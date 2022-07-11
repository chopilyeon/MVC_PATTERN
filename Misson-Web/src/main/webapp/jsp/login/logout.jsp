<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("/Misson-Web");
	/*script 대신에 sendRedirect 써도 됨.  */
%>    

<!-- <script>
	location.href = "/Misson-Web"

</script> -->

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--session에 등록된 걸 지우자~! -->




</body>
</html>