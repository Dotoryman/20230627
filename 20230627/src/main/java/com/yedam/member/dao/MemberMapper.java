package com.yedam.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.member.vo.MemberVO;

public interface MemberMapper {
	public List<MemberVO> memberList();
	public MemberVO login (@Param("id") String id, @Param("pw") String pw);
	public int insert(MemberVO member); 
}
