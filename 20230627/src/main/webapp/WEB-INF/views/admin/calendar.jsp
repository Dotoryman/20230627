<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>---달력보기---</h2>

<select id="year">
	<option value="2023">2023</option>
	<option value="2024">2024</option>
	<option value="2025">2025</option>
	<option value="2026">2026</option>
</select>
<select id="month">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
</select>



<table border="1" class="table">

</table>

<script>
	function makeHead(){
		// <thead>~~~~~</thead> 요일부분 찍어주기
		let days = ['-Sun-', '-Mon-', '-Tue-', '-Wed-', '-Thr-', '-Fri-', '-Sat-'];
		let thead = document.createElement('thead');
		let tr = document.createElement('tr');
		for (let day of days) {
			let td = document.createElement('th');
			td.innerText = day;
			thead.align ="center";
			tr.appendChild(td);	
		}
		thead.appendChild(tr);
		
		return thead;
	}
	
	function makeBody(firstDay, lastDate) {
		let tbody = document.createElement('tbody');
		let tr  = document.createElement('tr');
		
		for (let day = 0; day < firstDay; day++){
			let td = document.createElement('td');
			td.innerText = "";
			tr.appendChild(td);
		}
		//날짜 출력
		for(let day = 1; day <= lastDate; day++){
			let td = document.createElement('td');
			td.innerText = day;
			tr.appendChild(td);
			td.align ="center";
			// <td style="color:blue;">
			if((day+firstDay) % 7 == 0){
				td.style.backgroundColor = 'blue';
				td.style.color = 'white';
				tbody.appendChild(tr);
				tr  = document.createElement('tr');
			} 
			if ((day+firstDay) % 7 == 1){
				td.style.backgroundColor = 'red';
				td.style.color = 'white';

			}
		}
		tbody.appendChild(tr);
		return tbody;
	}
	
	function makeCalendar(year, month) {
		document.querySelector('table').innerHTML = "";
		let today = new Date(year, month-1, 1);
		let firstDay = today.getDay(); //요일정보 반환

		today = new Date(year, month, 0);		
		let lastDate = today.getDate();
		console.log(firstDay, lastDate);
		
		let thead = makeHead();
		let tbody = makeBody(firstDay, lastDate);
	
		document.querySelector('table').appendChild(thead);
		document.querySelector('table').appendChild(tbody);	
	}
		makeCalendar(2023, 6);
		document.getElementById('month').addEventListener('change', function (e){
		let year = document.getElementById('year').value;
		let month = document.getElementById('month').value;
		makeCalendar(year, month);
	})
		document.getElementById('year').addEventListener('change', function (e){
		let year = document.getElementById('year').value;
		let month = document.getElementById('month').value;
		makeCalendar(year, month);
	})
	
</script>