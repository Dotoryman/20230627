package com.yedam.board.service;

import java.util.List;

import com.yedam.board.vo.ReplyVO;

//등록, 조회, 수정, 삭제, 목록 구현
public interface ReplyService {
	public List<ReplyVO> replyList(long brdNo, int page);
	public int replyCount(long brdNo);
	public ReplyVO getReply(long brdNo);
	public boolean addReply(ReplyVO vo);
	public boolean modifyReply(ReplyVO vo);
	public boolean RemoveReply(long brdNo);
}
