<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	
	StringBuilder sb = new StringBuilder(); 
	/*cookie들에 대한 정보를 담아주자  */

	for(Cookie c : cookies){
		String cName= c.getName();
		String cValue=c.getValue();
		sb.append("쿠키 이름:" + cName +",");
		sb.append("쿠키값 : " + cValue + "<br>");
	}
	//
	//pageContext.setAttribute("cookieInfo",)
	
	

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키 확인</h2>
	<!--sb를 사용하기 위해 공유영역에 넣어줘야 됨 -->
	<%=sb.toString() %>
	<a href="makeForm.jsp">쿠키 설정</a>
</body>
</html>