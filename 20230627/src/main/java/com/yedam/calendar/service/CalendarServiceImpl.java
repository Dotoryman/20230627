package com.yedam.calendar.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.calendar.dao.CalendarMapper;
import com.yedam.calendar.vo.CalendarVO;
import com.yedam.common.DataSource;

public class CalendarServiceImpl implements CalendarService{

	
	SqlSession session = DataSource.getInstance().openSession(true);
	CalendarMapper mapper = session.getMapper(CalendarMapper.class);
	
	@Override
	public List<CalendarVO> events() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public boolean addEvents(CalendarVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo) == 1;
	}

	@Override
	public boolean removeEvents(CalendarVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo) == 1;
	}

}
