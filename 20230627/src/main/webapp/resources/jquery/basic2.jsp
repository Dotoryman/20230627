<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic2</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js" ></script>

<script>
    // document.addEventListener('DOMcontentLoaded',function(){
    // 제이쿼리 말고 돔으로 쓰기
    // })
    $(document).ready(function(){
      $('li:nth-child(1)').css('color', 'orange').css('font-size', '30px').css('list-style', 'none')
      $('li:nth-child(2)').css('color', 'yellow').css('font-size', '30px').css('list-style', 'none')
      $('li:nth-child(3)').css('color', 'purple').css('font-size', '30px').css('list-style', 'none')
      $('li:nth-child(4)').css('color', 'red').css('font-size', '30px').css('list-style', 'none')

      let li = $('<li />').text('Melon').css('color', 'green').css('font-size', '30px').css('list-style', 'none');
      console.log(li);

      $('ul').append(li); // ul의 하위요소에 li 요소를 추가

      //버튼추가
      $('li').append($('<button />').text('사악제').on('click', delBtn));
        function delBtn(e) {
            console.log(e)
            //e.currentTarget : DOM
            //$(e.currentTarget) : jquery 객체
            $(e.currentTarget).parent().remove();

        }
      //이벤트추가 = on
      $('#allDel').on('click', function() {
        $('li:nth-child(1)').remove();
      });
      //추가 이벤트 등록
      $('#addBtn').on('click', function(e) {
        let li = $('<li />').text($('#userInput').val())
        .append($('<button />')
        .text('삭제')
        .on('click',delBtn));
        // $('ul').append(li); ul에 li 넣기
        // li.appendTp($('ul')); li를 ul에 넣기
        $('li:nth-child(2)').after(li); //2번째 li 뒤에 넣기
        // init
        $('#userInput').val('');

        });
        
    // $('button').wrap($('<div />')); // 버튼요소를 wrap 을 사용해서 div 로 감싸기
    });

</script>

</head>
<body>

    <button id ="allDel">요소 제거</button>
    <input id="userInput"><button id="addBtn">추가</button>
    <ul>
        <li>Orange</li>
        <li>Mango</li>
        <li>Grape</li>
        <li>Cherry</li>
    </ul>


</body>
</html>