package kr.ac.kopo;

import kr.ac.kopo.dao.BoardDAO;

public class MyBatisMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BoardDAO dao = new BoardDAO();
		dao.work();
		//계속 insert 해주기 귀찮아서 work라는 메소드에다가 아예 넣어줌. 
		//autocommit이 아니라 에러남 
		


	}

}