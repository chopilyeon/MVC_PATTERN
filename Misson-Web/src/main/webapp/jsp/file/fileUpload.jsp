<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    InputStreamReader isr = new InputStreamReader(request.getInputStream(),"utf-8");
		/*servlet 안에 들어갈때 try catch로 감싸므로~ 상관없음   */
		BufferedReader br = new BufferedReader(isr);
		
		while(true){
			String buf = br.readLine();
			if(buf == null) break;
			out.write(buf+"<br>");
		/*이렇게 하면 파일 이름만 날라감   */
		}
				
				
	%>

</body>
</html>