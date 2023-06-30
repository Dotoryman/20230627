package com.yedam.board.dao;

import java.util.List;
import java.util.Map;

import com.yedam.board.vo.BoardVO;
import com.yedam.board.vo.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> selectList(long brdNo);//댓글목록
	public ReplyVO selectOne(long replyNo);//댓글 한건조회
	public int insertReply(ReplyVO vo);//등록
	public int updateReply(ReplyVO vo);//수정
	public int deleteReply(long replyNo);//삭제
	
}