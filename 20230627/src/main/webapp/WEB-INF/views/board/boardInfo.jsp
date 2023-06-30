<%@page import="com.yedam.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<h2>상세화면</h2>
	
	<table class ="table">
		<tr>
			<th>글번호</th>
			<td><input type="text" name="bno" readonly
				value="${board.brdNo} "></td>
		</tr>
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
        <th>작성일자</th>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.createDate }"/></td>
        </tr>
        <tr>
        <th>조회수</th>
        <td>${board.clickCnt }</td>
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
<hr>	
<!-- 댓글부분 시작 -->
<div class="row" style="width: 80%; margin: 0 auto 0;">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- heading -->
			<div class="panel-heading" style="height: 40px;">
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
					New Reply
				</button>
			</div>
			<!-- body -->
			<div class="panel-body">
				<ul class="chat">
					<!-- <li class="left clearfix" data-rno=12>
						<div>
							<div class="header">
								<strong class="primary-font">user1</strong>
								<small class="pull-right text-muted">2023-06-30 13:20</small>
							</div>
							<p>비내리는 6월의 마지막날</p>
						</div>
					</li> -->
				</ul>

			</div>
			<!-- footer -->
			<div class="panel-footer">

			</div>
		</div>
	</div>
</div>

<!-- 댓글부분 종료 -->	
<!--모달창 시작-->
<div class="modal fade" id="myModal" style="top: 50px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<button class="close">&times;</button>
				<h4 class="modal-title">Reply Modal</h4>
				<input type="hidden" name="replyNo">
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="form-group">
					<label for="">Reply</label>
					<input class="form-control" name="reply" value="새로운 댓글...">
				</div>
				<div class="form-group">
					<label for="">Replyer</label>
					<input class="form-control" name="replyer" value="user6">
				</div>
				<div class="form-group">
					<label for="">Reply Date</label>
					<input class="form-control" name="replyDate" value="2023-06-30 11:53">
				</div>
			</div>
			<!-- footer -->
			<div class="modal-footer">
				<div class="modal-footer">
					<button id="modalModBtn" class="btn btn-warning">Modify</button>
					<button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
					<button id="modalRegisterBtn" class="btn btn-primary">Register</button>
					<button id="modalCloseBtn" class="btn btn-secondary">Close</button>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!--모달창 종료-->
<script>
	let modal = document.querySelector('#myModal');
	//등록버튼
	document.querySelector('#addReplyBtn').addEventListener('click', function(e) {
		modal.style.display = 'block';
		modal.style.opacity = 1;
		// 수정, 삭제 숨기기
		document.querySelector('#modalModBtn').style.display = 'none';
		document.querySelector('#modalRemoveBtn').style.display = 'none';
		document.querySelector('#modalRegisterBtn').style.display = 'block';
		//댓글등록 눌렀을때 날짜 숨기기
		document.querySelector('#myModal div.modal-body div.form-group:nth-child(3)').style.display = 'none';
	})


	//조회 버튼
	function searchList() {
		document.querySelectorAll('ul.chat li').forEach(function (tag) {
			tag.addEventListener('click', function(e){
				modal.style.display = 'block';
				modal.style.opacity = 1;
			// 수정, 삭제
				document.querySelector('#modalModBtn').style.display = 'block';
				document.querySelector('#modalRemoveBtn').style.display = 'block';
				document.querySelector('#modalRegisterBtn').style.display = 'none';
				// data-rno="2"
				console.log(tag.dataset.rno);
				let rno = tag.dataset.rno;
				fetch('getReply.do?rno='+rno)
				.then((response) => response.json()) //json 문자열로 변환 [{"name":"kim","age":"30"}]
				.then(function (result){ //댓글 정보 모달창에 나오게하기
					console.log(result)
					document.querySelector('#myModal input[name="replyNo"]').value = result.replyNo;
					document.querySelector('#myModal input[name="reply"]').value = result.reply;
					document.querySelector('#myModal input[name="replyer"]').value = result.replyer;
					document.querySelector('#myModal input[name="replyDate"]').value = result.replyDate;
				})
				.catch(function (err){
					console.error(err);
				})
			})
		})
	}
	//모달창 닫기
		document.querySelector('button.close').addEventListener('click', function(e) {
		modal.style.display = 'none';
		modal.style.opacity = 0;
		})
		document.querySelector('#modalCloseBtn').addEventListener('click', function(e) {
		modal.style.display = 'none';
		modal.style.opacity = 0;
		})




	function makeList(reply={}) {
		// <li class="left clearfix" >
		// 		<div>
		// 			<div class="header">
		// 				<strong class="primary-font">user1</strong>
		// 				<small class="pull-right text-muted">2023-06-30 13:20</small>
		// 			</div>
		// 			<p>비내리는 6월의 마지막날</p>
		// 		</div>
		// </li>
		let str ='';
		str += '<li class="left clearfix" data-rno='+ reply.replyNo +'><div><div class="header">';
		str += '<strong class="primary-font">' + reply.replyer +'</strong>';
		str += '<small class="pull-right text-muted">' + reply.replyDate +'</small></div>';
		str += '<p>' + reply.reply + '</p></div></li>';
		
		return str;
	}
	// 댓글목록 리스트 보여주기
	const bno = '${board.brdNo}';
	console.log(bno);

	const replyUL = document.querySelector('ul.chat');

	//댓글목록 Ajax
	fetch('replyList.do?brdNo='+bno)
	.then(function(response) {
		console.log(response);
		return response.json();
	})
	.then(function (result) {
		console.log(result);
		for(let reply of result) {
			replyUL.innerHTML += makeList(reply);
		}
		searchList();
	})
	.catch(function(err) {
		console.error(err);
	})

	//수정버튼
	document.querySelector('#modalModBtn').addEventListener('click', function(e) {
		let rno = document.querySelector('#myModal input[name="replyNo"]').value;
		let reply = document.querySelector('#myModal input[name="reply"]').value;
		fetch('editReply.do', {
			method: 'post',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
			},
			body: 'rno=' + rno + '&reply=' + reply
		})
		// fetch('editReply.do?rno='+rno+'&reply='+reply)
		.then((response) =>  response.json()) 
		.then(result => {
			let replyNo = result.replyNo;
			let targetLi = document.querySelector('.chat li[data-rno="'+ replyNo +'"]');
			targetLi.querySelector('p').innerText = result.reply;
			//모달창 닫기
			modal.style.display = 'none';
			modal.style.opacity = 0;
			alert("수정되었습니다!");
		})
		.catch(function (err){
			console.error(err);
		})
	})	

		//삭제버튼
		document.querySelector('#modalRemoveBtn').addEventListener('click', function(e) {
		let rno = document.querySelector('#myModal input[name="replyNo"]').value;
		fetch('delReply.do', {
			method: 'post',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
			},
			body: 'rno=' + rno
		})
		// fetch('editReply.do?rno='+rno+'&reply='+reply)
		.then((response) =>  response.json()) 
		.then(result => {
			let targetLi = document.querySelector('.chat li[data-rno="'+ rno +'"]');
			targetLi.remove();
			//모달창 닫기
			modal.style.display = 'none';
			modal.style.opacity = 0;
			alert("삭제되었습니다!");
		})
		.catch(function (err){
			console.error(err);
		})
	})	

	//등록버튼
	document.querySelector('#modalRegisterBtn').addEventListener('click', function(e) {
		let replyer = document.querySelector('#myModal input[name="replyer"]').value;
		let reply = document.querySelector('#myModal input[name="reply"]').value;
		fetch('addReply.do', {
			method: 'post',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
			},
			body: 'bno=' + bno + '&replyer=' + replyer  + '&reply=' + reply
		})
		// fetch('editReply.do?rno='+rno+'&reply='+reply)
		.then((response) =>  response.json()) 
		.then(result => {
			replyUL.innerHTML += makeList(result);
			//모달창 닫기
			modal.style.display = 'none';
			modal.style.opacity = 0;
			alert("등록되었습니다!");
			searchList();
		})
		.catch(function (err){
			console.error(err);
		})
	})
	//댓글갯수를 기준으로 페이지 계산
	let pageNum = 1;
	function showReplyPage(replyCnt){
		let endPage = Math.ceil(pageNum / 10.0) * 10;
		let startPage = endPage - 9;
		let prev = startPage != 1;
		let next = false;

		if(endPage * 10 > replyCnt) {
			endPage = Math.ceil(replyCnt / 10.0);
		}
		if(endPage * 10 < replyCnt) {
			next = true;
		}

		//계산한 값으로 페이지 출력
		let str = '<ul class="pagination pull-right">';
			if(prev){
				str += '<li class="page-item"><a href ="">' + (startPage - 1) + '</a></li>';
			}
			for(let i = startPage ; i<= endPage; i++) {
				str += '<li class="page-item"><a href ="">' + i + '</a></li>';
			}
			if(next){
				str += '<li class="page-item"><a href ="">' + (endPage + 1) + '</a></li>';
			}
			str += '</ul>';
	}
</script>
