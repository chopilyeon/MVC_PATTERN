<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	전체 게시글 조회...
	<!--한번 요청에 연결되어 있는 놈들은 다 같이 고유함   -->
	<table border="1">
	<c:forEach items="${list}" var ="board">
		<tr>	
			<td>${board.title}</td>
			<td>${board.writer}</td>		
		</tr>
		
		
	</c:forEach>
	</table>
	
</body>
</html>