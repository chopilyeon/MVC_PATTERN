/*
 * package kr.ac.kopo.board.dao;
 * 
 * 
 * t_board 테이블의 crud 담당 클래스
 * 
 * 
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.util.List;
 * 
 * import kr.ac.kopo.util.ConnectionFactory; import kr.ac.kopo.util.JDBCClose;
 * 
 * public class BoardDAO 
 * 
 * 
 * 
 * 전체 게시글을 조회하기 위한 메소드를 만들고 싶은 것임.
 * 
 * 
 * 
 * public List<BoardVO> selectAll() { Connection conn=null; preparedStatement
 * pstmt = null;
 * 
 * 
 * //나오는 레코드들이 겁나 나올 것임 -> 배열이나 그런 형태로 받아야함 여러개의 레코드를 저장해서 넘겨주고 싶은 것이다!
 * 
 * try { Connection conn = new ConnectionFactory().getConnection();
 * StringBuilder sql = new StringBuilder(); sql.
 * append("SELECT no,title,writer,to_char(reg_date,'yyyy-mm-dd') as reg_date");
 * sql.append(" from t_board "); sql.append(" order by no desc ");
 * 
 * PreparedStatement pstmt = conn.prepareStatement(sql.toString()); ResultSet rs
 * =pstmt.executeQuery(); }catch(Exception e) { e.printStackTrace(); }finally {
 * JDBCClose.close(pstmt, conn);
 * 
 * }
 * 
 * 
 * return null;
 * 
 * 
 * }
 * 
 * 
 * 
 * }
 */
package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * t_board 테이블의 CRUD 담당 클래스
 */
public class BoardDAO {

	/**
	 * 전체게시글 조회 메소드
	 */
	
	public BoardVO selectByNo(int no) {
		/* 클릭을 하는 시점에 누가 지울 수도 있음 일단 그런 거는 제외하자 /// 최대 1개밖에 안됨. select한 게시물이 1개밖에 안됨! return 타입에 boardVo 하나만 넘기면 됨 */ 
		/* 무조건 외부 데이터를 받아올 때 close로 외부 연결 차단해야 함 매번써주기 귀찮음 -> 새로운 try문 탄생함  */
		
		
		StringBuilder sql = new StringBuilder();// 이건 autocloserable 안갖고 있으므로 try문안에다가 못만듬
		sql.append("select no,title,writer,content,view_cnt ");
		sql.append(" ,to_char(reg_date,'yyyy-mm-dd') reg_date");
		sql.append(" from t_board ");
		sql.append(" where no=?");
		
		
		try(
				// 여기에 객체를 만들수가 있음. -> 이 객체의 목적은 close를 위함임. 반드시 auto closerable 인터페이스를 상속받은 놈만 만들 수가 있음
				Connection conn=new ConnectionFactory().getConnection();// connection은 auto closerable을 상속받기 때문임! 
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());//이것도 auto closerable을 상속받고 있음 이거만 쓰면 자동으로 연결을 해지하더라~! 1.7버전에서 나왔음 그전에는 1.7버전으로 개발 안할수도 있으니 안알려줬음 
		){
			
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery(); //최대 1개 혹은 0개임 
			if(rs.next()) {
				
				int boardNo= rs.getInt("no");
				String title=rs.getString("title");
				String writer=rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt=rs.getInt("view_cnt");
				String regDate=rs.getString("reg_date");
				
				
				
				BoardVO board =new BoardVO(boardNo,title,writer,content,viewCnt,regDate);
				return board;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
		
		
	}
	
	
	public List<BoardVO> selectAll() {
		
		List<BoardVO> list = new ArrayList<>();
		
		
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer ");
			sql.append("       ,to_char( reg_date, 'yyyy-mm-dd') as reg_date");
			sql.append("  from t_board ");
			sql.append(" order by no desc ");

			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String title=rs.getString("title");
				String writer=rs.getString("writer");
				String regDate=rs.getString("reg_date");
				/*
				 * String regDate=rs.getString(4); //이렇게 써줘도 됨 to_char(reg_date,'yyyy-mm-dd') 이거
				 * 쓰기 너무 힘듬 그래서 숫자도 가능함.
				 */
				BoardVO board=new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				list.add(board);
			}
			

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		//return null; return null은 뭘까? 
		
		 return list;
	}
		public static void main(String[] args) {
			
		BoardDAO dao = new BoardDAO();
		dao.selectAll();
		
		
		
	}
		
		
	/*
	 * 새글 등록을 위한 seq_t_board_no의 시퀀스 추출
	 * 	
	 */
	public int selectBoardNo() {
		
		String sql = "select seq_t_board_no.nextval from dual ";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				
		){
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
		
		
		
		
		
		
		
		
		
		
		
 /*새글 등록
  * 
  * 
  * */
		
	public void insertBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// writer.jsp에서 긁어오자~! 
		try {
			conn = new ConnectionFactory().getConnection();
			  
			  
			  StringBuilder sql = new StringBuilder();
			  sql.append("insert into t_board(no,title,writer,content) ");
			  sql.append(" values(?,?,?,?) ");
			 pstmt = conn.prepareStatement(sql.toString());  
			 
			 int loc = 1;
			 pstmt.setInt(loc++, board.getNo());
			 pstmt.setString(loc++, board.getTitle());
			 pstmt.setString(loc++, board.getWriter());
			 pstmt.setString(loc++, board.getContent());
			 
			 pstmt.executeUpdate();
			 
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		}
		
		
	}
		
	//------------------------------
	//첨부파일 CRUD
	//-------------------------------
	
	
	
	public void insertBoardFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file(no, board_no, file_ori_name, file_save_name, file_size)  ");
		sql.append("  values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			
			pstmt.setInt(1, fileVO.getBoardNo());
			pstmt.setString(2, fileVO.getFileOriName());
			pstmt.setString(3, fileVO.getFileSaveName());
			pstmt.setInt(4, fileVO.getFileSize());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardFileVO> selectFileByNo(int boardNo){
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append(" 	from t_board_file ");
		sql.append(" 	where board_no = ? ");
		
		
		try(
				
				Connection conn =new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				
		){
			pstmt.setInt(1,boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				
				fileList.add(fileVO);
				/* System.out.println(fileVO); */
				/* return fileList; */

				/* pstmt.executeUpdate(); */
				/* System.out.println(fileVO); */
				
			}
			
			pstmt.executeUpdate();
			
			return fileList;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		
	return null ;
		
	}
	
	
	
	
	
	
	
}












