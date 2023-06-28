package com.yedam.member.contorl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// 서비스에 getMember(id)하면 멤버정보 넘겨주고 맵퍼에는 select(id) => MemberVO
		// 최종 도달은 admin/memberInfo.jsp
		
		String id = req.getParameter("uid");
		MemberService service = new MemberServiceImpl();
		MemberVO result = service.getMember(id);
		
		
		req.setAttribute("member", result);
		
		return "admin/memberInfo.tiles";
	}

}
