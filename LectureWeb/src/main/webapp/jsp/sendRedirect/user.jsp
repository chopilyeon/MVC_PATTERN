<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${param.id}님 환영합니다</h2>
	
	<!--원래 forward나 다른 방식들은 request에 공유받고 있으므로 requestScope.id 랑 똑같음 근데 여기서는 param.id를 써주어야함 request에 써봤자 공유를 못함!  -->
</body>
</html>