<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      let aryData = [];
      aryData.push(['Department', 'Cnt']); //타이틀, 없으면 오류남 아예 출력안됨 ㅈㅈ
   	  let xhtp = new XMLHttpRequest(); // 비동기처리방식 = 'Ajax' --많이쓰게될거다 
   	  xhtp.open('get', 'chartData.do');
   	  xhtp.send();
   	  xhtp.onload = function () {
   		  let data = JSON.parse(xhtp.responseText);
   		  console.log(data);
   		  for (let i=0; i<data.length; i++){
   			  let obj = data[i]; // {Administrator : 1}
   			  for(let prop in obj){
   				console.log(prop, obj[prop]) 
   			  	aryData.push([prop, obj[prop]]) //부서정보 , 인원정보
   			  }
   		  }
   		  console.log(aryData);
   	      google.charts.load("current", {packages:["corechart"]});
  	      google.charts.setOnLoadCallback(drawChart);
   		  
   	  }     //onload close
    
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable(aryData);
        var options = {
          title: '부서별 인원현황',
          is3D: true,
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
  </body>
</html>