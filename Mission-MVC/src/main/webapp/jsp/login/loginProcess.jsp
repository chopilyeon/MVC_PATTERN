<%@page import="kr.ac.kopo.board.dao.LoginDAO"%>
<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password=request.getParameter("password");
	LoginVO loginVO=new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);

	LoginDAO dao = new LoginDAO();
	LoginVO userVO=dao.login(loginVO);
	
	String msg = "";
	String url = "";
	
	
	if(userVO==null){
		//로그인 실패
		msg = "아이디 또는 패스워드를 잘못 입력했습니다";
		url = "login.jsp";
		/* 상대경로 썼음 */
		/* 공유영역에 등록시키자! */
	}else{
		//로그인 성공
		switch(userVO.getType()){
		case "S" :
			msg = "관리자님 환영합니다";
			break;
		case "U" :
			msg = userVO.getId() + "님 환영합니다";
			break;
		}
		
		
		
		msg = "로그인 성공";
		url = "/Misson-Web";
		/*welcome file list에 의해 이렇게 갈 것임!   */
		
		
	}
	
	
	
	pageContext.setAttribute("msg",msg);
	pageContext.setAttribute("url",url);
	
	/*session에 userVO의 정보를 등록시켜야 함  */
	session.setAttribute("userVO",userVO);
	
%>    
    
    
    
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
 <script>
/*script 태그만 필요하면 다른거 다 지우고 이거만 써도 됨   */
	alert('${msg}')
	location.href='${url}';
	/*el부터 먼저 해석이 된다~! el 이 먼저 해석이 되어서 성공한다면 바뀐다!   */

</script>
<!-- </head>
<body>
 -->





</body>
</html>