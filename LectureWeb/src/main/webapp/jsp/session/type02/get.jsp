<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String password=(String)session.getAttribute("password");
	//이거 사실 안써도 됨 sessonscope에 이미 저장이 되어 있으므로~! 

%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	설정된 ID: <%= id %><br>
	설정된 ID: ${sessionScope.id }<br>
	설정된 PASSWORD :${password } 
	<!--이렇게만 쳐도 알아서 공유영역 알아서 찾아감.  --> 
	<a href="remove.jsp">세션 삭제</a>
	
	
	
</body>
</html>