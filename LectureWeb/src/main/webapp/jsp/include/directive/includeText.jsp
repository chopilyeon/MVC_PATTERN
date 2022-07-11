<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인클루드 전</h2>
	msg: <%=msg %>
	<%@ include file ="one.jsp"  %> 
	<!--servlet 코드로 변환될 때 들어가는 것임   -->
	<h2>인클루드 후</h2>

</body>
</html>