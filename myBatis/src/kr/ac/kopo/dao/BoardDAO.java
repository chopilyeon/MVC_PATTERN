package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import kr.ac.kopo.MyConfig;
import kr.ac.kopo.vo.BoardVO;

public class BoardDAO {
	private SqlSession session;
	
	
	public BoardDAO() {
		session  = new MyConfig().getInstance();
		System.out.println("session : "+ session);
	}
	
	
	public void insert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("mybatis 삽입");
		board.setWriter("user");
		board.setContent("삽입완료2하였습니다");
		
		
		
		session.insert("dao.BoardDAO.insertBoard",board);
		//aaa,bbb,ccc 에 집어넣고 싶은 것임 ?,?,? 에 집어넣고 싶다 board 형태로 날라가게 됨 -> mappingdmf tlzuwnjdigka. 
		session.commit();
		//autocommit이 아니므로 저렇게 commit해줘야함. 
		System.out.println("삽입 완료");
	}

	public void select() {
		//BoardVO board = session.selectOne("dao.BoardDAO.selectAllBoard");
		//갖고온 행이  몇개든지 1개만 갖고오게 됨 return type은 object임. 
		List<BoardVO> boardList = session.selectList("dao.BoardDAO.selectAllBoard2");
		
		for(BoardVO board:boardList) {
			System.out.println(board);
		}
		
	}	
	
	public void selectOne() {
		//33번 게시물 조회
		BoardVO vo = new BoardVO();
		vo.setNo(33);
		//BoardVO board = session.selectOne("dao.BoardDAO.selectByNo", 33);
		//자동으로 형태도 바뀜 board형태로 바꾸버림. 
		//BoardVO board = session.selectOne("dao.BoardDAO.selectByNo2", vo);
		//System.out.println(board);
		
		BoardVO board = session.selectOne("dao.BoardDAO.selectByNo3", vo);
		System.out.println(board);
		
		
	}
	
	public void selectWhere() {
		//제목이 "제목"으로 시작하는 게시물 조회 
		
		List<BoardVO> list = session.selectList("dao.BoardDAO.selectWhere","제목");
		for(BoardVO vo : list) {
			System.out.println(vo);
		}
	}
	public void selectWhere2() {
		
		BoardVO vo = new BoardVO();
		
		//1번 : 제목이 "mybatis 삽입"이면서 작성자가 "user"인 게시물을 조회
		
		//vo.setTitle("mybatis 삽입");
		//vo.setWriter("user");
		
		
		//2번 : 제목이 "mybatis 삽입 게시물 조회 
		
		vo.setTitle("mybatis 삽입");
		
		//3번 : 제목이 "user"인 게시물 조회 
		
		//vo.setWriter("user");
		
		List<BoardVO> list = session.selectList("dao.BoardDAO.selectWhere2",vo);
		for(BoardVO board:list) {
			System.out.println(board);
		}
		
	}
	
	public void selectNos() {
		//1,2,6,10, 15 , 19 ,24 ,30 ,33 번에 속한 게시물 조회 
		//where no in (1,2,6 ... 33);
		
		int [] nos = {1,2,6,10,15,19,24,30,33};
		
		BoardVO vo = new BoardVO();
		vo.setNos(nos);
		
		
//		List<BoardVO> list = session.selectList("dao.BoardDAO.selectNos", vo);
	
		//nos 를 넘겨도 의미가 있을 것임. vo에 굳이 넣는게 으미가 없어보이더라~! 
		
		List<BoardVO> list = session.selectList("dao.BoardDAO.selectNos2", nos);
		
		for(BoardVO board:list) {
			System.out.println(board);
		}
		
	}
	
	void selectMap() {
		//제목이 "mybatis 삽입" 이면서 작성자가 "user"인 게시물 조회 VO 객체로 넘기지 않겠다!  
		
		Map<String, String> map = new HashMap();
		map.put("title", "mybatis 삽입");
		map.put("writer","user");
		/*
		 * map.put("title", "aaa");
		 * map.put("writer","bbb");
		 */
		
		List<BoardVO> list = session.selectList("dao.BoardDAO.selectMap",map);
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
		
	}
	
	
	void selectMap2() {
		//제목이 "mybatis 삽입" 이면서 작성자가 "user"인 게시물 조회 중 맨 처음 게시물만 조회 
		/*
		 * Map<String, String> map = new HashMap(); map.put("title", "mybatis 삽입");
		 * map.put("writer","user");
		 */
		
		Map<String,Object> board = session.selectOne("dao.BoardDAO.selectMap2",23);
		System.out.println(board);
		Set<String> keys = board.keySet();
		
		for(String key:keys) {
			System.out.println(key+":"+board.get(key));
		}
		
	}
	
	
	
	
	
	
	public void work() {
		//insert();
		//select();
		//view count 와 regDate가 제대로 안나옴 -> Reg_date DB의 column명과 안맞음 변경해주자~! 
		//selectOne();
		//selectWhere2();
		//selectNos();
		//map으로도 한번 해보자 
		selectMap();
		
		
	}
	
	
	
	
}
