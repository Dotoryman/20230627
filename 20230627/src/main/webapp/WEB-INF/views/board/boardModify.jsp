<%@page import="com.yedam.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	BoardVO vo = (BoardVO) request.getAttribute("board");
	%>
	<h2>수정화면(boardModify.jsp)</h2>
	<form action = "boardModify.do" method = "post">
		<table class ="table">
			<tr>
				<th>글번호</th><td><input readonly name="no" value="${board.brdNo}"></td><th>조회수</th><td>"${board.clickCnt}"</td>
			</tr>
			<tr>
				<th>제목</th><td colspan="3"><input name="title" value="${board.brdTitle}"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content" cols="54" rows="3">"${board.brdContent}"</textarea></td>
			</tr>
			<tr>
				<th>작성자</th><td>${board.brdWriter}</td><th>작성일자</th><td>${board.createDate}</td>
			</tr>
			<tr>
			<td colspan="4" align = "center">
				<input type = "submit" value ="저장">
			</td>
			
			</tr>
	
	
	
	
		</table>
	</form>
	
	<br>
	<a href="boardList.do">목록으로</a>