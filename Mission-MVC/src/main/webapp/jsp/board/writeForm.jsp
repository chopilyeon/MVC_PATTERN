<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Misson-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Misson-Web/resources/css/table.css">
<link rel="stylesheet" href="/Misson-Web/resources/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/Misson-Web/resources/css/font.css">
<link rel="stylesheet" href="/Misson-Web/resources/css/layout.css">



<script src="/Misson-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#listBtn').click(function(){
			location.href="list.jsp"
		})
		
		
		
	})

	 function checkForm(){
		
		let f = document.writeForm
		if(f.title.value==''){
			alert('제목을 입력하세요')
			f.title.focus() 
			/*focus 함수 때문에 마우스에 커서가 가 있음 */
			return false
		}
		
		/* if(f.writer.value==''){
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}
		 */
		if(f.content.value==''){
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		
		//첨부파일 확장자 체크를 해보자! 이래서 밑에다가 함수를 따로 만든 것임.  attachfile2에도 쓰려고~! 
		if(checkExt(f.attachfile1))
			return false;

		if(checkExt(f.attachfile2))
			return false;
		
		return true;
	}	
		
		
		function checkExt(obj){
			/*console.log(obj.value)*/
			/* obj.value 출력하게 되면은 앞에 fakepath로 출력이 됨. 확장자니까 뒤에 .jpg만 뽑아내면 됨! */
			let filebidName=['exe','java','class','java','jsp']
			let fileNmae=obj.value
			let ext=fileName.substring(fileNmae.lastIndexOf('.')+1)
			console.log(ext)
			
			for(let i=0; i<forbidName.length;i++){
				if(forbidName[i]==ext){
					alert('['+ext+'] 확장자는 파일 업로드 정책에 위배됩니다')
					return true;
				}
				
			}
			
			
			return false
			
			
			
		}
		
		
		
		
		
		

	

</script>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
	<div align="center">
		<hr>
		<h2>새글 등록폼</h2>
		</hr>
		<br>
	<!--원래는 우리가 아는 %request.contextPath> 써가지고 사용함.  -->	
	<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="writeForm" onsubmit="return checkForm()">
	<!--이름부분과 내용부분이 동시에 우리에게 보여지므로 multipart라고 부르는 것임. -->
	<%-- 	<input type="hidden" name ="writer" value="${userVO.id}"> --%>
		<table border="1" style="width:80%">
			<tr>
				<th width="25%">제목</th>	
				<td><input type="text" name="title" size=80></td>  
				
			</tr>
			<tr>
		
				<th width ="25%">작성자</th>
				<%-- <td>${userVO.id }</td>  --%>
		
				<td><input type="text" name="writer" ></td>
				
			</tr>
			<tr>
				<th width ="25%">내용</th>
				<td>
					<textarea rows="5" cols="80" name="content"></textarea>
				</td>
				
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="attachfile1"><br>
					<input type="file" name="attachfile2">
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="새글등록">&nbsp;
		<button id="listBtn">목록</button>
	<form>
	</div>
</section>
<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
<!-- 		footer부분 -->
		<!--include xml forward 에서는 root의 의미는 밑에는 localhost:9999/mission-Web임 상대경로를 못쓰는 이유?  -->
		<!--원래는 localhost:9999임   -->

</footer>
</body>
</html>