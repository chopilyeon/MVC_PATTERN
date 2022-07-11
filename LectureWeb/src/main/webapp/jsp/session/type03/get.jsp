<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(member !=null){ 
			/*  원래 이런거 써줘야 됨 session 삭제되면은 사라지게 되므로*/
	%>


설정된 ID : <%= member.getId() %><br>
	<%
		}
	%>

	<!--표현식은 getId 없으면 에러가 남.   -->
	<!--알아서 session scope 찾아냄.  -->
	설정된 ID : ${ sessionScope.member.id }<br>
	설정된 PASSWORD : ${member.password }<br>
	
	<!--이렇게만 쳐도 알아서 공유영역 알아서 찾아감.  --> 
	<a href="remove.jsp">세션 삭제</a>
	
	
	
</body>
</html>