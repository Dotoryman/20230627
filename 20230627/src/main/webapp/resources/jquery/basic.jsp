<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resources/jquery/basic.jsp</title>
<style>
    p:nth-child(2) {
        color: cadetblue;
        font-size: 30px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- <script src='jquery-3.7.0.min.js'></script> 이런식으로 파일 받던가 위에처럼 가져오던가 하셔 -->
</head>
<body>
        <p>Hell of the World</p>
        <p>Hell of the World2</p>
    <script>
        $('p').css('background', 'yellow');
        $('p:nth-child(2)').after($('<p />').text('Hell of the world 3'));
        // 1번 jQuery
        // document.querySelectorAll('p')/.forEach(pTag => {
        //    pTag.style.background = 'yello';          
        // });

        //2번 jQuery
        // pTag = document.querySelector('p:nth-child(2)');
        // let new PTag = document,createElement('p').appendChild(document.createTextNode('Hell of the world 3'));
        // document.appendChild(newPTag);
    </script>

</body>
</html>