<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.login.LoginVO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.ac.kopo.util.ConnectionFactory" %>    
    
    
    
<%
  /* 
   작업순서
   1.파라미터 추출(제목,작성자,내용)
   2.t_board table에 새로운 레코드르를 생성해야 함. 새로운 게시글을 삽입함 
   3. 클라이언트에게 결과를 전송해주어야 함. 
  
  
  
  */
  
  request.setCharacterEncoding("utf-8");

  String saveFolder = "D:/Lecture/web-workspace/Misson-Web/src/main/webapp/upload";
/*원래 원칙은 이런식으로 /Mission -Web/upload 에 설정을 해주어야 함 톰캣서버를 지우면 우리가 업로드한 파일들이 사라지게 됨. 그래서 잠깐 옮기는 방식을 쓴다. 지켜보자 */


/*eclipse workspace에 있는 파일을 일로 끌고 복사해서 갖고 온 셈.   */	



  MultipartRequest multi = new MultipartRequest(
		  request,
		  saveFolder,
		  1024*1024*3,
		  "utf-8",
		  new KopoFileNamePolicy()
		  );
		  
	/*이렇게 하면 parsing 함   */
  String title = multi.getParameter("title");		 	 
  String writer = multi.getParameter("writer");
  String content = multi.getParameter("content");	

  //1. 게시판 저장 
 BoardVO board=new BoardVO();
 board.setTitle(title);
 board.setWriter(writer);
 board.setContent(content);
 
 BoardDAO dao= new BoardDAO();
 
 
 //등록할 글 번호 조회 
 int boardNo = dao.selectBoardNo();
 board.setNo(boardNo);
 
 
 System.out.println(board);
 
 dao.insertBoard(board);
 
  //2. 첨부파일 저장
  Enumeration<String> files = multi.getFileNames();
  /*이터레이터 나오기전에 enumration임*/
  /*hasNext처럼 그 다음 객체가 있는지 확인함  */
  while(files.hasMoreElements()){
	  String fileName=files.nextElement();
  	  System.out.println(fileName);
  	  File f =multi.getFile(fileName);
  	  if(f != null){
  		 String fileOriName = multi.getOriginalFileName(fileName);
  		 String fileSaveName = multi.getFilesystemName(fileName);
  		 int fileSize =(int) f.length();
  		 //long형이라 형변환 시킴
  		 
  		 BoardFileVO fileVO=new BoardFileVO();
  		 fileVO.setFileOriName(fileOriName);
  		 fileVO.setFileSaveName(fileSaveName);
  		 fileVO.setFileSize(fileSize);
  		 fileVO.setBoardNo(boardNo);
  		 
  		 System.out.println(fileVO);
  		 /*여기까지만 하면은 no을 가져올 수 없음 -> no을 가져와야한다. 어찌 가져올까?   */
  		 
  		 dao.insertBoardFile(fileVO);
  	  }
  }
  
  
 //파일이 한개면 이렇게 써도 됨.
  
 /*  File f = multi.getFile("attachfile1");
  if(f!=null){
	  String ori = multi.getOriginalFileName("attachfile1");
	  String save = multi.getFilesystemName("attachfile1");
  }
 */  
  
  
  /*  이렇게 쓰기 싫어서 위에 처럼 만들었음. 
  File f = multi.getFile("attachfile1");
  f= multi.getFile("attachfile2");
   */
  
  
  
  
  
  

/* 
  String title=request.getParameter("title");
  String writer=request.getParameter("writer"); */
 /*  LoginVO userVO=(LoginVO)session.getAttribute("userVO");
  String writer1=userVO.getId(); */
  /* 여기서 공유영역에 있는놈을 저장하면? -> 해도 되지만 서버는 서버만의 일을 view단은 view단의 일을 해야지! */
		  
  /* String content=request.getParameter("content"); */
  
  /*multipart로 받아오므로 이거 getparameter 이런걸로 못받아냄. -> 이걸 다 하도록 만들고 싶다!   */
  
  
 
/*   dao.insertBoard(title,writer,content); */
  /*VO에 감싸서 보내야 함! vo 객체를 파라미터로 보내면 됨 이러면 수정할 게 적어지게 됨! */
  //dao.insertBoard(board);
 
  
  
  
  /*맞게 되었는지 확인하자  
  //System.out.println("title: " + title); //  잘 찍혔느지 확인을 하자 
  System.out.println("writer: " + title);
  System.out.println("content: " + title);
  이게 되면은 그 다음부분으로 넘어가면 됨
  */
 /* 
  Connection conn = new ConnectionFactory().getConnection();
  StringBuilder sql = new StringBuilder();
  sql.append("insert into t_board(no,title,writer,content) ");
  sql.append(" values(seq_t_board_no.nextval,?,?,?) ");
  PreparedStatement pstmt = conn.prepareStatement(sql.toString());  
  pstmt.setString(1,title); // 물음표자리에 넣어주는 중 
  pstmt.setString(2,writer);
  pstmt.setString(3,content);

  
  pstmt.executeUpdate(); // 새글 등록이 완료되었다고 클라이언트한테 보내주면 됨. body로 가자  */
 
%> 
 

<script>
	alert('새글 등록을 완료하였습니다')
	//location을 그리고 옮겨주자 
	location.href="list.jsp" 
</script>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--작성한 글을 서버쪽에 전달을 하면 클라이언트가 넘겨준 데이터를 가지고 작성자 제목 내용 등을 추출해야 함 추출한 데이터를 t _board table에 저장해야 함 -> 클라이언트에게 완료되었다는 결과를 알려주어야 함  -->
<!-- 	<h3>새 글 등록을 완료하였습니다.</h3>
	<a>목록으로 이동</a>  이것도 근데 귀찮다!-->
	

</body>
</html>