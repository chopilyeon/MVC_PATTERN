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
		<h2>결과화면</h2>
	<c:if test="${ param.id == 'admin' }">
		<jsp:forward page="admin.jsp" />
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<jsp:forward page="user.jsp" />
	</c:if>
	끝!!!!
</body>
</html>