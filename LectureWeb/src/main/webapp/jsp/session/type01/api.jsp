<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = session.getId();
   int interval = session.getMaxInactiveInterval();
   session.setMaxInactiveInterval(2);
   int interval2 = session.getMaxInactiveInterval();
   /*마지막 접근시간도 알아낼 수 있음   */
   
  	long lastTime = session.getLastAccessedTime();
   	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
   	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 ID(JSESSIONID): <%=id %></h2>
	<h2>기존의 유효시간:<%=interval %>초</h2>
	<!--아무것도 안해야 세션이 끊어지는 것임. 계속 새로고침하면은 행위로 간주해서 세션이 끊기지 않음.  -->
	<h2>변경된 유효시간:<%=interval2 %>초</h2>
	<!-- 세션 유효시간 변경(2초) -->
	<h2>마지막 접근시간:<%=sdf.format(new Date(lastTime)) %></h2>
	id:${id}<br>
	cookie:${cookie}<br>
	session:${session}<br>	
	application:${application}<br>
	${page}
	${out}
	param:${param}<br>
	paramValues:${paramValues}
	${exception }
	
</body>
</html>