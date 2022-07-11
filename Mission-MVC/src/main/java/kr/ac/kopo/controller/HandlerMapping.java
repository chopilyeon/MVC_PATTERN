package kr.ac.kopo.controller;

import java.util.Map;

public class HandlerMapping {
	private Map<String,Controller> mappings;
	//전역변수로 쓸 수 있게 밖으로 뺐음~! 
	
	public HandlerMapping() {
		
		/*
		 * Map<String,Controller> mappings = new HashMap<>();
		 *외부에서 인식못하므로 밖으로 빼자~
		 */
		mappings.put("/board/list.do", new BoardListController());
		mappings.put("/board/writeForm.do", new BoardWriteFormController());
		mappings.put("/board/write.do",new BoardWriteController());
		
	}
	
	public Controller getController(String uri) {
		
		return mappings.get(uri);
		
	}
	
	
	
	
	
	
	
	/*
	 * switch(uri) { case "/board/list.do" : control = new BoardListController();
	 * break; case "/board/writeForm.do": System.out.println("새글 등록 서비스...");
	 * control = new BoardWriteFormController() break; case "/board/write.do":
	 * control=new BoardWriteController(); break;
	 * 
	 * }
	 */
	

}
