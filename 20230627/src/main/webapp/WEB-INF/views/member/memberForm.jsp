<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/jquery/jquery-3.7.0.min.js"></script>
<script>
    let today = new Date('Dec 14, 2023, 12:00:00 AM');
    Date.prototype.timeFormat = function () {
        console.log(this.getFullYear());
        let yyyy = this.getFullYear();
        let mm = this.getMonth() + 1;
        let dd = this.getDate();
        // yyyy-mm-dd 양식 만들기
        return yyyy + '-' +('0'+mm).slice(-2) + '-' + ('0'+dd).slice(-2);
    }
    console.log(today.timeFormat());

	$(document).ready(function () {
		// jquery 의 ajax 실행
        $.ajax({
            url: 'memberListJson.do',
            method:'get',
            success: function(result){
                console.log(result);
                result.forEach(item => {
                	let tr = $('<tr />').append(
                			$('<td />').text(item.userId)
                            ,$('<td />').text(item.userName)
                            ,$('<td />').text(new Date(item.userBirth).timeFormat())
                            ,$('<td />').text(item.userPhone)
                            ,$('<td />').text(item.userAddr)
                            ,$('<td />').append($('<img>').attr('src', 'images/' + item.userImg).attr('width','90px'))
                            ,$('<td />').append($('<button />').text('삭제').on('click', delMemberFnc) )
                    );
                    tr.data('id', item.userId);
                    tr.on('click', modifyFnc);
                    $('#list').append(tr);
                });
            },
            error: function() {
                console.log(err)
            }
        });

        function delMemberFnc(e) {
            e.stopPropagation(); //이벤트가 전파되는 것을 차단하겠습니다.
            // data-id -> dataset.id
            console.log($(this).parent().parent().data('id'));
            // DOM일땐 this.parentElement.parentElement.dataset.id
            let targetId = $(this).parent().parent().data('id');
            //<tr data-id="user1"> 또는 $('tr[data-id="user1"]')
            let targetTr = $(this).parent().parent();
            $.ajax({
                url: '',
                method: 'post',
                data: {id: targetId},
                success: function(result) {
                    if (result.retCode == 'Success'){
                        targetTr.remove();
                    }
                },
                error: function(err) {
                    console.log(err)
                }
            })
        }



        function modifyFnc(e){
            // console.log($(this).children().eq(0).text());
            console.log($(this).find('td:nth-child(1)').eq(0).text());
            let id = $(this).find('td:nth-child(1)').eq(0).text();

            $.ajax({
                url: 'memberInfoJson.do',
                method:'post',
                data: {uid: id}, //req.getParameter("uid")
                success: function (result) {
                    console.log(result);
                    $('#uid').val(result.userId);
                    $('#upw').val(result.userPw);
                    $('#uname').val(result.userName);
                    $('#ubirth').val(new Date(result.userBirth).timeFormat());
                    $('#uaddr').val(result.userAddr);
                    $('#uphone').val(result.userPhone);
                },
                error: function (err) {
                    console.log(err);
                }
                
            })
        }


        //등록버튼 클릭시
        $('form[name="myFrm"]').on('submit', submitForm);
        function submitForm(e) {
            e.preventDefault();
            console.log(e);

            $.ajax({
                url: $('form[name="myFrm"]').attr('action'),
                method: 'post',
                data: $('form[name="myFrm"]').serialize(),
                success: function(result){
                    console.log(result);
                    let tr = $('<tr />').append(
                			$('<td />').text(result.userId)
                            ,$('<td />').text(result.userPw)
                            ,$('<td />').text(result.userName)
                            ,$('<td />').text(result.userPhone)
                            ,$('<td />').text(result.userAddr)
                            ,$('<td />').text(result.userBirth)
                    );
                    $('#list').append(tr);
                },
                error: function(err){
                    console.log(err);
                } 
                

            });
        }
        
        // 수정(변경) 버튼 클릭시 on click
        $('#modBtn').on('click',editForm);
        function editForm(e) {
        	
        	$.ajax({
                url: 'memberEditJson.do',
                method: 'post',
                data: {
                    uid: $('#uid').val(),
                    upw: $('#upw').val(),
                    uname: $('#uname').val(),
                    uphone: $('#uphone').val(),
                    uaddr: $('#uaddr').val(),
                    ubirth: $('#ubirth').val()
                },
                success: function(result){
                    //result.userId
                    //Array.prototype.forEach(function(item, idx, ary){ })
                    console.log(result);
                    console.log($('#list tr').children());
                    $('#list tr').each(function (idx, item){
                        console.log(idx,item);
                        if ($(item).children().eq(0).text() == result.userId){
                            $(item).children().eq(1).text(result.userName)
                            $(item).children().eq(2).text(new Date(result.userBirth).timeFormat())
                            $(item).children().eq(3).text(result.userPhone)
                            $(item).children().eq(4).text(result.userAddr)
                        }
                    });
                },
                error: function(err){
                    console.log(err);
                }
            })
        }
	})
</script>
<h3>Jquery연습 (memberForm.jsp) Ajax = Single Page Application</h3>
<form name="myFrm" action="memberAdd.do">
	<table calss="table">
	 <tr>
        <th>아이디</th>
        <td><input type="text" name="uid" id="uid" value="newbie"></td>
        <th>비밀번호</th>
        <td><input type="password" name="upw" id="upw" value="newbie"></td>
     </tr>
     <tr>
        <th>이름</th>
        <td><input type="text" name="uname" id="uname" value="워싱턴"></td>
        <th>연락처</th>
        <td><input type="text" name="uphone" id="uphone" value="010-123-1563"></td>
     </tr>
     <tr>
        <th>주소</th>
        <td><input type="text" name="uaddr" id="uaddr" value="SpringField"></td>
        <th>생년월일</th>
        <td><input type="date" name="ubirth" id="ubirth" value="1995-08-23"></td>
     </tr>
     <tr>
        <td colspan="2" align="center">
            <input type="submit" value="등록">
            <input type="reset" value="초기화">
            <button type="button" id="modBtn">변경</button>
            
        </td>
     </tr>
	</table>
</form>
<table class="table">
    <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>생일</th>
            <th>연락처</th>
            <th>주소</th>
            <th>사진</th>
        </tr>
    </thead>
    <tbody id="list">

    </tbody>
</table>