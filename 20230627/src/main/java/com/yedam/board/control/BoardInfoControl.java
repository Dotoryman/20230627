package com.yedam.board.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.board.service.BoardServiceMybatis;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.Control;

public class BoardInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// 서비스에 getMember(id)하면 멤버정보 넘겨주고 맵퍼에는 select(id) => MemberVO
		// 최종 도달은 admin/memberInfo.jsp
		
		String no = req.getParameter("bno");
		BoardService service = new BoardServiceImpl();
		BoardVO result = service.getBoard(Long.parseLong(no));
		
		
		req.setAttribute("board", result);
		
		return "board/boardInfo.tiles";
	}

}
