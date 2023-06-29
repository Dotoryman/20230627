package com.yedam.board.dao;

import java.util.List;
import java.util.Map;

import com.yedam.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardList(int page);
	public int totalCnt();
	public BoardVO selectBoard(long bno);
	public int updateCnt(long bno);
	public int deleteCnt(long bno);
	public int updateBoard(BoardVO board);
	public int insertBoard(BoardVO board);
	
}