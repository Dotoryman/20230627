package com.yedam.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.dao.BoardMapper;
import com.yedam.board.vo.BoardVO;
import com.yedam.common.DataSource;

public class BoardServiceImpl implements BoardService{

	SqlSession session = DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> boards() {
		return mapper.boardList();
	}
	
	@Override
	public List<Map<String, Object>> getData() {
		return mapper.chartData();
	}
	
	@Override
	public BoardVO getBoard(String id) {
		return mapper.select(id);
	}
	
	@Override
	public boolean modifyBoard(BoardVO vo) {
		return mapper.update(vo) == 1;
	}
	
	@Override
	public boolean modifyImage(BoardVO vo) {
		return mapper.updateImage(vo) == 1;
	}

	@Override
	public BoardVO login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}
}
