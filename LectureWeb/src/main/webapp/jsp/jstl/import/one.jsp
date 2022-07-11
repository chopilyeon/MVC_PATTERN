<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>




<hr>

request 공유영역 phone : ${phone}<br>


넘어온 파라미터정보
name:${param.name }<br>


	<h2>인클루드 된 내용</h2>
	<h2>인클루드 된 내용</h2>
	<h2>인클루드 된 내용</h2>
<hr>
<!--scope 설정안해주면  page영역에서만 찾게 됨 그래서 scope 설정을 해주자~!   -->
<c:set var="phone" value = "010-8888-9999" scope="request" />