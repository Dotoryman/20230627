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
<style>
	div.outer {
		display: inline-block;
		width: 700px;
		height: 500px;
		background-color: aliceblue;
	}

	.outer span{
		display: inline-block;
		width: 80px;
		height: 30px;
		margin: 2px;
		padding: 2px;
		background-color: cadetblue;
		text-align: center;
	}
</style>

<input type="text" id="userInput"><br>
<br>
<div class="outer">
	<span>HELL</span>
	<span>1</span>
	<span>2</span>
	<span>3</span>
	<span>4</span>
	<span>5</span>

</div>



<script src="resources/js/main5.js"></script>