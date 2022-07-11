package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.login.LoginVO;
import kr.ac.kopo.util.ConnectionFactory;

public class LoginDAO {
	
	
	
	public LoginVO login(LoginVO loginVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id,password,name,type ");
		sql.append(" from t_member ");
		sql.append(" where id =? and password=? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			
			ResultSet rs = pstmt.executeQuery();
			
			//나올수 있는 것은 1개 아니면 0개임 primary key이기 때문임.
			if(rs.next()) {
				LoginVO userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
				userVO.setType(rs.getString("type"));
				return userVO;
			
			}
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return null;
		
		
		
	}

	
	
	  public static void main(String[] args) {
	 
		  LoginDAO dao=new LoginDAO();

	  System.out.println((dao.login(new LoginVO("eunji","1222"))));
	
	
	
	
	  }
}