<%@page import="com.yedam.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	BoardVO vo = (BoardVO) request.getAttribute("board");
	
	%>

	<%
	if (vo == null) {
	%>
	<p>조회된 결과가 없습니다!</p>
	<%
	}
	%>
	<form action="modifyForm.do" name = "myFrm" method = "post">
		<input type="hidden" name ="bno" value = "${board.brdNo}">
	<h2>상세화면(boardOne.jsp)</h2>
	
	<table class ="table">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" readonly
				value="${board.brdTitle} "></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" readonly
				value="${board.brdWriter} "></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" readonly cols="30" rows="10">"${board.brdContent}"</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">

				<button type="submit">수정</button>
				<button type="button">삭제</button>

			 </td>
		</tr>


	</table>
</form>

	<br>
	<a href="boardList.do">목록으로</a>
	<script>
		console.log(this);
		document.querySelector('form[name="myFrm"] button[type="button"]').addEventListener('click', function(e) {
		console.log(e);
		document.forms[0].action = "boardRemove.do";
		document.forms[0].submit();
		
		// 이거도 가능
		// window.location.href = "boardRemove.do?bno=3"
		
		});
	</script>
