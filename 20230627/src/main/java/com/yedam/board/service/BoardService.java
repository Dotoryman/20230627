package com.yedam.board.service;

import java.util.List;
import java.util.Map;

import com.yedam.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boards();
	public BoardVO login(String id, String pw);
	public List<Map<String, Object>> getData();
	public BoardVO getBoard(String id);
	public boolean modifyBoard(BoardVO vo);
	public boolean modifyImage(BoardVO vo);

}
