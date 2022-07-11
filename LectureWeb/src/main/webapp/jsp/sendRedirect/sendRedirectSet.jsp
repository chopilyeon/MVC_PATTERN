<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--response 를 발생시켜서 redirect를 시켜야함 -> 이건 자바객체의 response가 필요함 body에서 어쩔 수 없이 java scriptlet을 쓴다 원래는 안쓰는게 목적임.   -->
	<h2>결과화면</h2>
	<c:if test="${ param.id == 'admin' }">
		<% 
			response.sendRedirect("admin.jsp");
		%>
	
	
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%
			
		
			request.setAttribute("id",request.getParameter("id"));
			response.sendRedirect("user.jsp");
			response.sendRedirect("user.jsp?id=" + request.getParameter("id"));
			
		
		%>
	
		
	</c:if>
	끝!!!!
</body>
</html>