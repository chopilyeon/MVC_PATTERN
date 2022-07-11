<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Misson-Web/resources/css/bootstrap.min.css">
<script>
	/* if('${userVO}'==''){
		
		
	}
 */

	function doAction(type){
		switch(type){
		case 'U':
			location.href="update.jsp?no=${param.no}";
			/*몇번 게시물 넘길지 번호 넘겨야 됨 그 번호는 어디있을까? 위에 board도 no를 알겠지만 url로 날라올 때도 알 수 있음 param으로 받을 수도 있음  */
			break;
		case 'D':
			if(confirm('삭제하시겠습니까?')){
				location.href="delete.jsp?no=${param.no}"
			}
			/*확인과 취소버튼이 필요하더라 삭제하시겠습니까가 참이라면 delete로 넘어가라~! 취소와 확인버튼이 생기게 됨*/
			break;
		case 'L':
			location.href = "list.jsp"
			break;
		
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h1>개별 게시글 조회</h1>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="25%">번호</th>
				<td>${board.no}</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${board.title}</td>
				
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${board.writer}</td>
				
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${board.content}</td>
				
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${board.viewCnt}</td>
				
			</tr>
		
			<tr>
				<th width="25%">등록일</th>
				<td>${board.regDate}</td>
				
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach items = "${ fileList }" var="fileVO" >
						<a href="/Misson-Web/upload/${ fileVO.fileSaveName }">${fileVO.fileOriName}
						</a>
							(${fileVO.fileSize}bytes)
					
					</c:forEach>
				</td>
				
					
			</tr>
			
			
			
			
		
		</table>
		<br>
		<button onclick="doAction('U')">수  정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭  제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목  록</button>&nbsp;&nbsp;
		<!--onclick은 클릭하면 함수 호출.   -->

	</div>


</body>
</html>