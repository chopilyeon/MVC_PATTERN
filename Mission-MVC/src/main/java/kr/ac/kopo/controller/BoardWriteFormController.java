package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardWriteFormController implements Controller{
	
	/*
	 * http://localhost:9999/Mission-MVC/board/writeForm.do 요청시 처리 
	 * 
	 */
	//localhost:9999/Mission-MVC/board/list.jsp 
	//forward에서의 /는 /board/list.jsp 를 의미함.
	
	
	// a 태그나 이런 것들은 /가 /Mission-MVC/board/writeForm.do
	//xml forward include 는 /의 의미가 /board/writeForm.do 를 의미함 
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");

		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		
		BoardService service = new BoardService();
		service.addBoard(board);
		
		
		
		
		
		return "/jsp/board/writeForm.jsp";

	}

}
