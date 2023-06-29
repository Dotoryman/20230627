<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Sample Page</h2>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src='fullcalendar-6.1.8/dist/index.global.js'></script>
<script>
	let data =[
		{
			title: '식사',
			start: '2023-06-30T13:20:00',
			end: '2023-06-30T14:20:00'
		}
		
		
	]
  document.addEventListener('DOMContentLoaded', function() {
	  
	  
	  
		//Ajax 호출
		let xhtp = new XMLHttpRequest();
		xhtp.open('get', 'eventList.do');
		xhtp.send();
		
		xhtp.onload = function () {
			let result = JSON.parse(xhtp.responseText);
			for (let cal of result){
				let obj ={
							title: cal.title,
							start: cal.startDate,
							end: cal.endDate
						 }
				data.push(obj);
			}//end of for	  
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: new Date(), //'2023-01-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('등록하실 일정을 입력하세요');
        if (title) {
        	console.log(arg)
        	let addXhtp = new XMLHttpRequest();
			addXhtp.open('post', 'addEvent.do');
			addXhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=utf-8');
			addXhtp.send('title='+title+'&start='+arg.startStr+'&end='+arg.endStr);
			addXhtp.onload = function () {
				let result = JSON.parse(addXhtp.responseText);
				if(result.retCode = 'Success') {
			          calendar.addEvent({
			              title: title,
			              start: arg.start,
			              end: arg.end,
			              allDay: arg.allDay
			            }) //성공하면 화면에 등록
				} else {
					alert('일정을 등록하는데 실패했습니다.')
				}
			}//end onload
        }//end if
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
       	  console.log(arg) //title값을 찾아서 지워주기 Ajax로 요청
       	  let delAjax = new XMLHttpRequest();
       	  //open(), send()
       	  // 처리결과를 받아와서 retCode == 'Success'
       	    delAjax.open('get', 'removeEvent.do?title=' + arg.event._def.title);
     	  	delAjax.send();
     	  	delAjax.onload = function () {
				let result = JSON.parse(delAjax.responseText);
				if(result.retCode = 'Success') {
					arg.event.remove() 
					alert('일정을 삭제하는데 성공했습니다.')
				} else {
					alert('일정을 삭제하는데 실패했습니다.')
				}
			}
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: data
    });

    calendar.render();
    
	} //end of onload
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>