<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<%--
 작업순서
 1. t_board 테이블에서 전체 게시글 조회
 2. 조회된 게시물을 하나씩 웹브라우저 출력 

드라이버 접속하고 연결객체 얻어오고 쿼리를 만들어서 실행객체에 넣은 다음에 걔를 실행해서 결과를 얻어와야함 -> 다 끝나면 종료해야 함 

checked exception인데 왜 try catch 안쓰지? -> jsp 가 내부적으로는 servlet code로 바뀌면서 실제로는 jsp 는 try문 안에 들어감 이미 예외처리기 안에 들어가 있다는 소리임.  
 
먼저 db에 접속하는 것이 좀 더 합리적임. 
 
 --%>

<%-- 
 <%
  Connection conn = new ConnectionFactory().getConnection();
  StringBuilder sql = new StringBuilder();
  sql.append("SELECT no,title,writer,to_char(reg_date,'yyyy-mm-dd') as reg_date");
  sql.append(" from t_board ");
  sql.append(" order by no desc ");
		
  PreparedStatement pstmt = conn.prepareStatement(sql.toString());
  ResultSet rs =pstmt.executeQuery();
  	
 %> --%>

<%
BoardDAO dao = new BoardDAO();
List<BoardVO> list = dao.selectAll();

//공유영역에 등록을 시키고 싶음 -> 페이지 컨텍스트 리퀘스트 세션 어플리케이션이 있음. 	
//페이지 컨텍스트 -> 자신의 페이지내에 등록된 객체만 access 가능한 것임 
//request는 한번 요청에 응답이 올 때 까지 연결된 jsp가 값을 공유할때까지 공유가 가능함.

//공유영역 등록
pageContext.setAttribute("list", list);
%>


<!--위엣 놈을 board DAO라고 부를 것이다 객체지향의 목적 -> 변화에 둔감하게 만들고 싶다임. 일반적으로 DAO를 interface로 만들더라! 
 오라클로 만든놈은 board DAOimplement board DAOimplement2 이런식으로 만드는 것임. 똑같이 interface 상속받았으므로 crud하는 명령어는 같음. 
 그래서 interface로 구현하더라~! 상속받아서 만들더라. -->



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>



<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/Misson-Web/resources/css/font.css">
<link rel="stylesheet" href="/Misson-Web/resources/css/layout.css"> 

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			location.href ='writeForm.jsp'
				
		})
	})
	
	function checkLogin(boardNo){

		<c:choose>
			<c:when test="${empty userVO}">
				if(confirm('로그인 후 사용이 가능합니다\n 로그인 페이지로 이동할까요?')){
					location.href="/Misson-Web/jsp/login/login.jsp"
				}
					
					
			
			</c:when>
			<c:otherwise>
				location.href='detail.jsp?no=' + boardNo
			</c:otherwise>
		
		</c:choose>  
	} 
	
	/* board란 애는 empty이므로 쓸수가 없더라~! board는 foreach태그 밑에서 정의된 녀석임.'
	  */
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<!--http://localhost:9999/Misson-Web/jsp/board/list.jsp 이게 경로임   -->
		<div align="center">
			<hr>
			<h2>전체 게시글 조회</h2>
			<hr>
			<table style="width: 80%" class="table">
			  <thead>
				<tr class="table-light">
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>
					<th width="20%">등록일</th>
				</tr>
			  </thead>	
				<!--collection 요소를 가져오자~! []로 갖고 오자 -->
				<%-- 		<tr>
			
				<td>${list[0].no }</td>
				<td>${list[0].title }</td>
				<td>${list[0].writer }</td>
				<td>${list[0].content }</td>
				
			</tr> --%>
				<!--자 이제 태그를 쓰기 위해 jstl을 쓰자~ 전부다 끌고 오기 위함임 
			<c:set var="board" value="${list[0]}"/> 
			<c:set var="board" value="${list[1]}"/> 
			
			-->
				<!--href쓸 때 javascript 명령어를 이용해 난 어떤어떤 일을 하려고 해! 저기에 번호를 넘길수도 있음  -->
				<!--<a href="#" onclick="checkLogin">-->
			<tbody class="table-group-divider">
				<c:forEach items="${ list }" var="board" varStatus="loop">
					<tr <c:if test="${loop.count mod 2 eq 0}">class="even table-light"</c:if>>
						<td class="table-light">${ board.no }</td>
						<td class="table-light"><a href="javascript:checkLogin(${board.no })"> <c:out
									value="${board.title }" />
						</a> <%-- <a href="detail.jsp?no=${ board.no }">
						 ${board.title }
						 <c:out value="${ board.title }"/> 
						</a> --%> <!--몇번 게시물을 볼 지 써주어야함 1번인지 2번인지 3번인지 알고 있어야 함. 제일 먼저 해석은 부터 해석하므로 해서이 가능하다! 소스보기로 한번 보자! 그러면 {}부분 숫자로 바뀌어 있음 실제 원래 코드는 안보임 우리가 볼때만 숫자로 보임 그래서 보안이 좋다고 얘기함. 순수 jsp코드는 안보이더라~!   -->
							<!--화면에 출력하는 방식을 out태그를 이용해서 해주자~!   --></td>
						<td class="table-light">${ board.writer }</td>
						<td class="table-light">${ board.regDate }</td>
					</tr>
				</c:forEach>
			 </tbody>







				<!--rs가 몇개의 tr을 만들어야 하는지 알고 있음 false나올 때까지 실행함-->
				<%--이제 여기 필요 없음 -> DAO가 알아서 해줌  <%
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate= rs.getString("reg_date");
				
		%>	
			<tr>
				<td><%= no %></td>
				<!--detail에 대한 번호가 필요함 1번 게시물 2번 게시물 이런거 위에 no과 관련이 있음  -->
				<!--jsp 는 그냥 문자열만 알음~! jsp를 가장 먼저 해석하므로 no을 숫자로 인식을 하더라는 것임  -->
				<td><a href="detail.jsp?no=<%=no%>"><%=title %></a></td>
				<td><%=writer %></td>
				<td><%=regDate %></td>
			</tr>
		<%
			}
		%>	
			 --%>
			</table>
			<br>
			<c:if test="${not empty userVO }">
				<button id="addBtn"><a href="writeForm.jsp">새글등록</a></button>
			</c:if>
		</div>


	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
		<!-- footer부분 -->
		<!--include xml forward 에서는 root의 의미는 밑에는 localhost:9999/mission-Web임 상대경로를 못쓰는 이유?  -->
		<!--원래는 localhost:9999임   -->

	</footer>



</body>
</html>










<%-- <%
  JDBCClose.close(pstmt,conn);
%> --%>