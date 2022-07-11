package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;

import kr.ac.kopo.MyConfig;
import kr.ac.kopo.dao.BoardDAO;

public class Test {
	
	//단일 테스트중 
	// 이렇게 쓰면 간단하게 그 메소드만 실행해보고 싶다는 뜻임.
	//junit 테스트할 떄 이거는 하지 말라는 소리임 
	@Ignore 
	@org.junit.Test
	public void myConfig테스트() throws Exception{
		
		MyConfig config=new MyConfig();
		SqlSession session = config.getInstance();
		//이런 메소드로 null인지 확인함. null 인지 아닌지가 중요함. 
		assertNotNull(session);
	}
	@org.junit.Test
	public void BoardDAO생성테스트() throws Exception{
		BoardDAO dao = new BoardDAO();
	}
	
	

}
