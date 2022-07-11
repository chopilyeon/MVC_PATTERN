<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		alert('새글등록을 완료하였습니다')
		location.href ='${pageContext.request.contextPath}/board/list.do'
		/*   / 는localhost:9999를 의미함  */
	</script>
</head>
<body>

</body>
</html>