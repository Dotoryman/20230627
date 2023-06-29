package com.yedam.board.dao;

import java.util.List;
import java.util.Map;

import com.yedam.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardList();
	public int insert(BoardVO board);
	public List<Map<String, Object>> chartData();
	public BoardVO select (String id);
	public int update(BoardVO board);
	public int updateImage(BoardVO board);

}
