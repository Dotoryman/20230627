package com.yedam.member.contorl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberInfoJson implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("uid");
		MemberService service = new MemberServiceImpl();
		MemberVO result = service.getMember(id);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result) + ".json";
		
	}

}
