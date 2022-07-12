package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.login.LoginVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		
		
		//System.out.println("LoginProcessController 처리부...");
	
		
		if(id.equals("user")&&password.equals("user")) {
			//로그인 성공
			LoginVO userVO = new LoginVO();
			userVO.setId(id);
			userVO.setPassword(password);
			//원래 없는데 넣어줌
			userVO.setName("홍길동");
			userVO.setType("U");
			
			
			
			
			//세션 등록
			//jsp에서는 pageContext RequestContext 이런데다가 등록하면 다 인식을 했음 내장객체라서. 
			//자바 파일에서는 session 모름. request 객체를 통해서 session 객체를 얻어올 수 있음. 
			//Session 객체를 만들어주어야 함. request를 통해서 session객체를 얻어오자.
			HttpSession session = request.getSession();
			session.setAttribute("userVO",userVO);
			
			
			
			return "redirect:/";
		}
		
		//로그인 실패
		//실패하면 로그인창 계속해서 뜨게 됨
		
		return "redirect:/login.do";
	}

}
