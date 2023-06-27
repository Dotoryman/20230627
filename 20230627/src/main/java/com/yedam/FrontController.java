package com.yedam;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class FrontController extends HttpServlet{
	
	

	private HashMap<String, Control> menu;
	public FrontController() {
		menu = new HashMap<>();
	}
	
	public void init(ServletConfig config) throws ServletException{
		menu.put("/main.do", new MainControl());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String page = uri.substring(contextPath.length());
		System.out.println(page);
		
		Control control = menu.get(page);
		String viewPage = control.exec(req, resp);
		
		RequestDispatcher rd = null;
		rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
		
	}
}
