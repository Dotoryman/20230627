package com.yedam.member.contorl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class ChartDataControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		// {"name":"워싱턴","age":20,"phone":"010-2345-6789"}
		String json = "{\"name\":\"워싱턴\",\"age\":20,\"phone\":\"010-2345-6789\"}";
		json = "";
		
		MemberService service = new MemberServiceImpl();
		List<Map<String, Object>> list = service.getData();
		// 자바스크립트배열 = [{},{},{}]
		json = "[";
		int cnt = 1;
		for(Map<String, Object> map : list) {
			json += "{\"" + map.get("DEPARTMENT_NAME") 
					+ "\" :" + map.get("CNT") + "}";
			// 마지막 데이터는 , 가 필요없어서 넣어주는 예외
			if (cnt++ !=list.size()) {
				json +=",";
			}
		}
		json +="]";
		return json + ".json";
	}

}
