package kr.ac.kopo;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;




public class MyConfig {
	
	private SqlSession session;

	
	public MyConfig() {
		
		String resource = "mybatis-config.xml";
		try {
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		session = sqlSessionFactory.openSession();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}
	//getter로 만들어도 됨. 
	
	public SqlSession getInstance() {
		return session;
	//dao가 이 session 객체가 필요하다~	
	}
	
	
	
}
