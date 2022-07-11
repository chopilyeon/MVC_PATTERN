package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardListController implements Controller{

	
	@Override
	public String handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//String은 forward 시킬 주소를 의미함. 화면에 나타내는 것은 BoardVO jsp의 역할이기 때문임. 
		
		
		
		
		List<BoardVO> list = new ArrayList<>();
		list.add(new BoardVO("aaa","bbb"));
		list.add(new BoardVO("ccc","ddd"));
		list.add(new BoardVO("eee","fff"));
		
		request.setAttribute("list", list);
		
		//공유영역에 집어 넣자~! 
		
		
		BoardService service = new BoardService();
		List<BoardVO> boardList = service.selectAllBoard();
		
		
		request.setAttribute("list", boardList);
		
		
		
		return "/jsp/board/list.jsp";
		
	}
	
}
