package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
	
		
		
		
		return "/jsp/board/writeForm.jsp";

	}

}
