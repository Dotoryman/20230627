package com.yedam;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.control.AddReplyControl;
import com.yedam.board.control.BoardInfoControl;
import com.yedam.board.control.BoardListControl;
import com.yedam.board.control.BoardModifyControl;
import com.yedam.board.control.DelReplyControl;
import com.yedam.board.control.EditReplyControl;
import com.yedam.board.control.ReplyControl;
import com.yedam.board.control.ReplyListControl;
import com.yedam.calendar.control.AddEventControl;
import com.yedam.calendar.control.EventForm;
import com.yedam.calendar.control.EventListControl;
import com.yedam.calendar.control.RemoveEventControl;
import com.yedam.common.Control;
import com.yedam.member.contorl.CalendarForm;
import com.yedam.member.contorl.ChartDataControl;
import com.yedam.member.contorl.ChartFormControl;
import com.yedam.member.contorl.ImageUploadControl;
import com.yedam.member.contorl.LoginControl;
import com.yedam.member.contorl.LoginFormControl;
import com.yedam.member.contorl.MemberInfoControl;
import com.yedam.member.contorl.MemberListControl;
import com.yedam.member.contorl.MemberModifyControl;

public class FrontController extends HttpServlet{
	
	

	private HashMap<String, Control> menu;
	public FrontController() {
		menu = new HashMap<>();
	}
	
	public void init(ServletConfig config) throws ServletException{
		menu.put("/main.do", new MainControl());
		
		menu.put("/memberList.do", new MemberListControl());
		menu.put("/loginForm.do", new LoginFormControl());
		menu.put("/login.do", new LoginControl());
		menu.put("/memberInfo.do", new MemberInfoControl());
		menu.put("/memberModify.do", new MemberModifyControl());
		menu.put("/imageUpload.do", new ImageUploadControl());


		//
		menu.put("/chartForm.do", new ChartFormControl());
		menu.put("/chartData.do", new ChartDataControl());
		menu.put("/calendar.do", new CalendarForm());
		//
		menu.put("/eventForm.do", new EventForm()); //화면 열어주기
		menu.put("/eventList.do", new EventListControl()); // 데이터 가져오기
		menu.put("/addEvent.do", new AddEventControl());
		menu.put("/removeEvent.do", new RemoveEventControl());
		
		//Board
		menu.put("/boardList.do", new BoardListControl());
		menu.put("/boardInfo.do", new BoardInfoControl());
		menu.put("/boardModify.do", new BoardModifyControl());
		//Reply (Ajax 처리를 위한 컨트롤)
		menu.put("/replyList.do", new ReplyListControl()); //전체목록
		menu.put("/getReply.do", new ReplyControl()); //단건조회 rno로
		menu.put("/addReply.do", new AddReplyControl()); //추가
		menu.put("/editReply.do", new EditReplyControl()); //수정
		menu.put("/delReply.do", new DelReplyControl()); //삭제

	}
	
	@Override //중요!
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String page = uri.substring(contextPath.length());
		System.out.println(page);
		
		Control control = menu.get(page);
		String viewPage = control.exec(req, resp);
		
		if(viewPage.endsWith(".jsp")) {
			viewPage = "/WEB-INF/views/" +viewPage;
		} else if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage); //loginForm.do
			return;
		} else if(viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().print(viewPage.substring(0, viewPage.length() - 5));//.json 빼려고 5자 뺌
			return;
		}
		
		
		RequestDispatcher rd = null;
		rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
		
	}
}
