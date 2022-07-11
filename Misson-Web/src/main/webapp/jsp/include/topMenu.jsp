<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<%-- <table border="1" style="width:100%">
	<tr>
		<!--2개의 행을 합병하겠다는 의미임  -->
		<td rowspan="2" >
			<a href="/Misson-Web">
			<img src="/Misson-Web/resources/images/symbol.jpg" style="height:45px; width:150px;">
			</a>
		</td>
		<td align="right">
		즐겨찾기
		<c:if test="${not empty userVO}">
			[${userVO.name}님이 접속하였습니다]
		</c:if>
		<!--로그인도 안되었는데 나오게 할 수 없다!   -->
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${userVO.type eq 'S'}">
				회원관리 |
				</c:if>
				<a href="/Misson-Web/jsp/board/list.jsp"> 게시판 </a> | 
			<c:choose>
			<c:when test="${ empty userVO }">
				회원가입 |
				<a href="/Misson-Web/jsp/login/login.jsp"> 로그인 </a>| 
			</c:when>
			<c:otherwise>
				마이페이지 |
				<a href="/Misson-Web/jsp/login/logout.jsp"> 로그아웃</a>
			</c:otherwise>
			</c:choose>
			</nav>
		</td>
	</tr>
</table> --%>

<nav class="navbar navbar-expand-lg bg-light fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand fs-1 m-3" href="#">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">MENU</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
      
        <ul class="navbar-nav justify-content-center flex-grow-1 p-3 m-2">
        <c:if test="${userVO.type eq 'S'}">
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="#">회원관리</a>
          </li>
        </c:if>  
          <c:choose>
			<c:when test="${ empty userVO }">
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="#">회원가입</a>
          </li>
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="/Misson-Web/jsp/login/login.jsp">로그인</a>
          </li>
            </c:when>
          <c:otherwise>  
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="/Misson-Web/jsp/board/list.jsp">게시판</a>
          </li>
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="#">마이페이지</a>
          </li>
          <li class="nav-item">	
            <a class="nav-link active m-3" aria-current="page" href="/Misson-Web/jsp/login/logout.jsp">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link m-3" href="#">Link</a>
          </li>
         	</c:otherwise>
         	</c:choose>
        </ul>
        <form class="d-flex m-5" role="search">
          <input class="form-control input-group" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>
</nav>