<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	<!--파일 이름과 데이터가 날아가야함   -->
	<!-- <form action="uploadInfo.jsp" method="post" enctype="application/x-www-form-urlencoded">
	 -->	
	 	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
	 	ID : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile" size="50 "><br>
		<input type="submit" value="전송"> 
	</form>
</body>
</html>