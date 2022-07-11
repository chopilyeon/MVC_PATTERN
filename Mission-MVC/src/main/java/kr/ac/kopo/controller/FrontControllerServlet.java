package kr.ac.kopo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("요청처리 ...");

		// .do는 다 이리로 들어온다 뭐가 들어오는지 이제 분석하자

		String uri = request.getRequestURI();
		System.out.println("uri: " + uri);
		String context = request.getContextPath();
		System.out.println("context :" + context);
		uri = uri.substring(context.length());
		System.out.println("uri: " + uri);

		//HandlerMapping mappings = new HandlerMapping();

		try {
			/*
			 * String callPage = null; 
			 * Controller control = null;
			 */
			HandlerMapping mappings = new HandlerMapping();

			Controller control = mappings.getController(uri);
			/*
			 * switch(uri) { case "/board/list.do" : //이거 언제 다쓰나.. 전체 게시글 조회를 대신할 수 있는
			 * class를 하나 만들 계획임. 그것의 이름은 BoardListController임.
			 * //System.out.println("전체 게시글 조회서비스..."); control = new BoardListController();
			 * callPage = control.handleRequest(request, response); //이건 이제 controller에 있는
			 * interface에 있는 method임 묵시적 형변환을 사용해보자~! BoardListController list = new
			 * BoardWriteFormController(); callPage = list.handleRequest(request,response);
			 * 
			 * 
			 * //exception 처리를 안해서 에러남. try로 묶자. -> 우리는 지금 IOException이랑 ServletException만
			 * 처리중임. -> 그래서 try로 묶어주도록 해야 함. break; case "/board/writeForm.do":
			 * System.out.println("새글 등록 서비스..."); control = new BoardWriteFormController();
			 * callPage=control.handleRequest(request, response);
			 * 
			 * 
			 * BoardWriteFormController write = new BoardWriteFormController(); callPage =
			 * write.handleRequest(request, response);
			 * 
			 * break; case "/board/write.do": control=new BoardWriteController(); break;
			 * 
			 * }
			 */

			if (control != null) {

				// jsp의 forward랑 다름. -
				// switch 내의 지역변수라 에러남

				// 이제 redirect 하는 경우도 있고 그냥 String으로 callpage할수도 있는 것임.
				String callPage = control.handleRequest(request, response);
				if (callPage.startsWith("redirect:")) {
					callPage = callPage.substring("redirect:".length());
					response.sendRedirect(request.getContextPath() + callPage);
					// response.sendRedirect(callPage);
					// 위에 처럼만 쓰면은 mission-MVC가 없음. forward include xml 이 아니므로
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
					// 위에 String callpage = null로 옮겨주자~!
					dispatcher.forward(request, response);

				}
			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/*
	 * 
	 * switch(uri) { case "/Mission-MVC/board/list.do" :
	 * System.out.println("전체 게시글 조회서비스..."); break; case
	 * "/Mission-MVC/board/writeForm.do": System.out.println("새글 등록 서비스..."); break;
	 * }
	 * 
	 * // "/Mission-MVC 이게 마음이 안들음. /Mission-Web 이면 어쩔거야. 실제 list.do만 있으면 좋겠음.
	 * //getContextPath 이용 ->substring으로 쪼개버림. }
	 */

	// init은 맨처음 servlet이 호출될때 맨 처음 시작되는 것.
	// service는 요청이 올 때마다 처리하는 것임.
	// 보안 폴더라 외부에서 접근 불가능함 -> 가상의 url을 web.xml에서 처리하자~!

}
