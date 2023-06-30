<%@page import="com.yedam.common.PageDTO"%>
<%@page import="com.yedam.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<style>
.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: cadetblue;
  color: white;
  border: 1px solid cadetblue;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

	<h1>게 시 판</h1>
<table class="table">
    <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
  		<c:forEach items="${boards }" var="vo" >
			<tr>
				<td><c:out value="${vo.brdNo }" /></td>
				<td><a href="boardInfo.do?bno=${vo.brdNo}">${vo.brdTitle }</td>
				<td>${vo.brdWriter }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.createDate }"/></td>
				<td>${vo.clickCnt }</td>
			</tr>
		</c:forEach>
    </tbody>
</table>
	<br>
	<div class="center">
    <div class="pagination">
        <c:if test="${page.prev }">
            <a href="boardList.do?page=${page.startPage - 1 }"> Prev </a>
        </c:if>

        <c:forEach begin="${page.startPage }" end="${page.endPage }" var="pg">
            <a href="boardList.do?page=${pg }" class="${page.curPage == pg ? 'active' : '' }">${pg }</a>
        </c:forEach>

        <c:if test="${page.next }">
            <a href="boardList.do?page=${page.endPage + 1 }"> Next </a>
        </c:if>
    </div>
</div>
	
	<br>
	<br>
	<tr>
	<a href="boardForm.do">글쓰기</a>
	</tr>
