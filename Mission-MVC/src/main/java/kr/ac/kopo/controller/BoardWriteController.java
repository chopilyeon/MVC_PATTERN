package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		//return "/jsp/board/write.jsp";
		return "redirect:/board/list.do";
		
		//요청을 재발생시키기 위해서 
		
		//send redirect 시키겠다는 의미임.
				

	}

}
