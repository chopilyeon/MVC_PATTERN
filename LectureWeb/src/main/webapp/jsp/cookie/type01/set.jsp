<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	request.setCharacterEncoding("utf-8");
	//한글이라 setting 해주어야 함 
	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	
	//쿠키 생성
	Cookie cookie = new Cookie(cName,cValue);

	
	//쿠키 전송 클라이언트한테 전송해주자~! 
	response.addCookie(cookie);
	//response를 안보냈는데 왜 보내지나? 이거 자체가 웹브라우저로 보내는 것임.

%>    
    
     
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 쿠키 설정 완료 </h2>
	<a href="get.jsp">설정된 쿠키 확인</a>



</body>
</html>