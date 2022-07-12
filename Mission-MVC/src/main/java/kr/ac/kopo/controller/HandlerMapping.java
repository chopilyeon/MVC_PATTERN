package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	private Map<String, Controller> mappings = new HashMap<>();
	// 전역변수로 쓸 수 있게 밖으로 뺐음~!

	public HandlerMapping(String propLocation) {

		Properties prop = new Properties();

		try {

			// 경로도 바뀔 수 있도록 하자. 이제

			//InputStream is = new FileInputStream("D:\\Lecture\\web-workspace\\Mission-MVC\\bean.properties");
			InputStream is = new FileInputStream(propLocation);
			prop.load(is);

			System.out.println(prop.getProperty("/board/list.do"));

			// 예외처리 발생하지 않았으면 제대로 들어온 것임. -> 이런식으로 test 가능함. name만 따로 뽑아보자~!
			Set<Object> keys = prop.keySet(); // return type이 object라 에러남. -> object로 바꿔주자~
			for (Object key : keys) {
				System.out.println(key);
				String className = prop.getProperty(key.toString());
				System.out.println(className);
				// 매개변수가 string 이어야 하므로
				// class명을 이용해서 그것들을 이용해서 동적으로 임의로 내가 원하는 객체를 만들고 싶더라. 이를 reflection이라고 표현함.
				// 동적으로 내가 원하는 객체를 만들고 싶어!
				// Spring은 다 relection 기반임.
				// 임의로 class명은 알고 있음. -> 그 class 명을 이용해서 객체를 생성하고 싶다는 것임.
				// class for Name으로 이름만으로 jvm에 객체를 생성하겠다는 것임.
				// mappings.put(key.toString(), new BoardListController());

				Class<?> clz = Class.forName(className);
				// clz.newInstance 이녀석의 return 타입이 그때마다 달라지므로 에러나므로 상속받았던 controller로 형변환 시키면 됨

				Constructor<?> constructor = clz.getConstructor();
				mappings.put(key.toString(),(Controller)constructor.newInstance());
				// mappings.put(key.toString(), (Controller)clz.newInstance());
				// mappings.put(key.toString(), clz.newInstance());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * Map<String,Controller> mappings = new HashMap<>(); 외부에서 인식못하므로 밖으로 빼자~
		 */
		/*
		 * mappings.put("/board/list.do", new BoardListController());
		 * mappings.put("/board/writeForm.do", new BoardWriteFormController());
		 * mappings.put("/board/write.do",new BoardWriteController());
		 */
	}

	public Controller getController(String uri) {

		return mappings.get(uri);

	}

	/*
	 * public static void main(String[] args) throws Exception {
	 * 
	 * java.util.Random r = new java.util.Random(); int random = r.nextInt(10) + 1;
	 * System.out.println(random);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * Class<?> clz = Class.forName("java.util.Random"); System.out.println(clz);
	 * java.util.Random r = (java.util.Random) clz.newInstance(); //newInstance로 그
	 * 클래스명으로 그 객체를 만들겠다. int random = r.nextInt(10) + 1 ;
	 * System.out.println(random);
	 * 
	 * 
	 * Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
	 * BoardListController obj = (BoardListController) clz.newInstance();
	 * System.out.println(obj.handleRequest(null,null));
	 * 
	 * 
	 * 
	 * 
	 * }
	 * 
	 */

	/*
	 * switch(uri) { case "/board/list.do" : control = new BoardListController();
	 * break; case "/board/writeForm.do": System.out.println("새글 등록 서비스...");
	 * control = new BoardWriteFormController() break; case "/board/write.do":
	 * control=new BoardWriteController(); break;
	 * 
	 * }
	 */

}
