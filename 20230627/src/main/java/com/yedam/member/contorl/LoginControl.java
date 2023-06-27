package com.yedam.member.contorl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String id = req.getParameter("uid");
		String pw = req.getParameter("upw");
		
		// MemberVO 반환 / null
		MemberService service = new MemberServiceImpl();
		MemberVO result = service.login(id, pw);
		
		if(result == null) { //로그인 실패
			return "loginForm.do";
		}
		//접속하고있는 세션정보 반환
		HttpSession session = req.getSession();
		session.setAttribute("logId", result.getUserId());
		session.setAttribute("logName", result.getUserName());
		return "main.do";
	}

}
