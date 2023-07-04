package com.yedam.member.contorl;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class memberEditJson implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		String uname = req.getParameter("uname");
		String uphone = req.getParameter("uphone");
		String uaddr = req.getParameter("uaddr");
		String ubirth = req.getParameter("ubirth");
		System.out.println(uid +" "+ upw + " " + uname + " " + uphone + " " + uaddr + " " + ubirth);
		MemberVO vo = new MemberVO();
		vo.setUserId(uid);
		vo.setUserPw(upw);
		vo.setUserName(uname);
		vo.setUserPhone(uphone);
		vo.setUserAddr(uaddr);
		try {
			vo.setUserBirth(sdf.parse(ubirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		MemberService svc = new MemberServiceImpl();
		svc.modifyMember(vo);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(vo) + ".json";
	}
}
