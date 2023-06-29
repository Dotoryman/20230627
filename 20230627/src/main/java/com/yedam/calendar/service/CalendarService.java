package com.yedam.calendar.service;

import java.util.List;

import com.yedam.calendar.vo.CalendarVO;

public interface CalendarService {
	List<CalendarVO> events();
	public boolean addEvents(CalendarVO vo);
	public boolean removeEvents(CalendarVO vo);

}
