package com.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.calendar.dao.CalendarMapper;
import com.yedam.calendar.vo.CalendarVO;

public class TestMain {
	public static void main(String[] args) {
//		SqlSession session = DataSource.getInstance().openSession();
//		MemberMapper mapper = session.getMapper(MemberMapper.class);
//		
//		List<Map<String, Object>> list = mapper.chartData(); // List<Map<String, Object>>
//		for(Map<String, Object> map : list) {
//			System.out.println("부서 : " + map.get("DEPARTMENT_NAME") + " || 인원 : " + map.get("CNT"));
//		}
		
		SqlSession session = DataSource.getInstance().openSession(true);
		CalendarMapper mapper = session.getMapper(CalendarMapper.class);
		
		CalendarVO vo = new CalendarVO();
		vo.setTitle("식사 멋있게하기");
		vo.setStartDate("2023-06-29");
		vo.setEndDate("2023-06-30");
		mapper.insert(vo);
//		mapper.delete(vo);
		
		
		
		
		List<CalendarVO> list = mapper.getList();
		for (CalendarVO cal : list){
			System.out.println(cal);
		}
	}
}
