<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("phone","010-1111-2222");
	
	
	
	%>
	


<!--이건 당연히 내가 내 영역에서 찍었으니 나옴. one.jsp에 가서 확인해보자~!   -->
	phone:${phone}<br>
    msg: <%=msg %>
	<h2>인클루드 전</h2>
	<h3>파라미터 미설정</h3>
	<c:import url ="one.jsp"/>
	<!--request 공유영역에 있는 값도 사용이 가능함! --> 
	<h2>인클루드 후</h2>
	<!--이건 호출 될때만 코드를 읽어옴. 즉 메모리 낭비가 없음. include 지시자 같은 경우는 코드를 처음부터 싹 복사 붙여넣기 하므로 메모리의 낭비가 있음.  -->
	<!--근데 굳이 param사용 안하고 request 공유영역을 써도 됨!   -->
	msg: <%=msg %>
	<h2>인클루드 전</h2>
	<h3>파라미터 설정</h3>
	<c:import url="one.jsp">
		<c:param name="name" value="hong" />
	</c:import>
	
	<h2>인클루드 후</h2>
	
	phone:${phone} <br>
	
	
	



</body>
</html>