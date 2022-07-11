<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute("id");
	//session.removeAttribute("password");

    session.invalidate();
    //위에꺼만 써도 됨 invalidate() 만 써도 되더라~!
%>    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 삭제 완료</h2>
	<a href="get.jsp">세션 정보 확인</a>



</body>
</html>