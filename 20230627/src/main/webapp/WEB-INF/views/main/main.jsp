<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Main page </h2>
<h3>It's the hard knock life</h3>
<table border="1" class="table">
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" value="반헬싱"></tr>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" id="age" value=22></tr>
	</tr>
	<tr>
		<th>점수</th>
		<td><input type="number" id="score" value=90></tr>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button class="btn btn-primary" id="saveBtn" > 저장 </button>
		</td>
	</tr>
</table>

<h3>학생 목록</h3>
<table id="list" border="1" class="table">
	<thead>
		<tr><th>이름</th><th>나이</th><th>점수</th><th>삭제</th></tr>
	</thead>
	<tbody id="target">
		
	</tbody>
</table>



<script src="resources/js/main4.js"></script>