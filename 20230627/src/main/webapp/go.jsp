<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>검색 조건</h3>
	시도:<select id="search">
			
		</select>
	
	<button id="searchBtn">조회</button>
	<div id ="show">
		<table border="1">
			<thead>
				<tr>
					<th>센터 ID</th><th>센터 이름</th><th>센터 연락처</th><th>시도</th><th>우편 번호</th>
				</tr>
			</thead>
			<tbody id="list">
			
			</tbody>
		</table>
	</div>

	<script>
		let totalData = [];
		let url=`https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=AhFQHHOv5YBZSF2KvX8zf0lBj0BaWbPXbhU4H%2BBu%2BzXITa2G%2FvitTV0mJczD3JvQ5D8ERlNpZ01rEs9YItseHA%3D%3D`;
		
		//Ajax 호출
		let xhtp = new XMLHttpRequest();
		xhtp.open('get', url);
		xhtp.send();
		
		xhtp.onload = function () {
			let tbody = document.getElementById("list")
			let data = JSON.parse(xhtp.responseText);
			console.log(data.data);
			totalData = data.data;
			for (let i=0; i<data.data.length; i++){
				tbody.appendChild(makeRow(data.data[i])); //센터정보 1건
			}
			//sido 정보만 => sidoAry
			// totalData => [{},{},{},...,{}]
			let sidoAry = [];
			for(let data of totalData){
				if(sidoAry.indexOf(data.sido)==-1){
					sidoAry.push(data.sido)
				}
			}
			console.log(sidoAry)
			for(let sido of sidoAry){
				let sel = document.getElementById("search");
				let opt = document.createElement("option");
				opt.innerText = sido;
				opt.value = sido;
				sel.appendChild(opt);
			}
		}
		// 보여줄 필드 설정
		let fields = ['id', 'centerName','phoneNumber','sido','zipCode'];
		// 센터정보 생성하기(tr)
		function makeRow(obj={}) {
			let tr =document.createElement('tr');
			for (let field of fields){
				let td = document.createElement('td');
				if (field == 'centerName') {
					let ahref = document.createElement('a');
					ahref.setAttribute('href', 'map.jsp?lat='+obj.lat+'&lng='+obj.lng+'&cname='+obj.centerName); // ahref.href = 'map.jsp'; 둘 다 가능
					ahref.target = "_blank"; //새창에서 보여주기
					ahref.innerText = obj[field];
					td.appendChild(ahref);
				} else {
					td.innerText = obj[field];
				}
				tr.appendChild(td);
			}
			return tr;
		}
		document.querySelector('#searchBtn').addEventListener('click', findFnc2);
		
		function findFnc2(){
			console.log(totalData);
			//1. 기존목록 clear 2. 사용자가 입력한 값과 데이터값(totalData) 비교 totalData의 'sido'
			//3.tbody.appendChild(makeRow(obj)) 
			document.getElementById('list').innerHTML = "";	//1.
			
			for (let sido of totalData){
				if(sido.sido == document.getElementById('search').value){//2.
					document.getElementById("list").appendChild(makeRow(sido)); //3. tbody가 위에함수에 갇혀있으니까 그냥 원래 모양 그대로 떼오기
				}
			}
		}
		
		
		function findFnc1() {
			
			let trs = document.querySelectorAll('tbody tr');
			let ary = [];
			for (let tr of trs){
				if(tr.children[3].innerText == document.getElementById('search').value){
					ary.push(tr);
				}
			}
			console.log(ary);
			//
			document.getElementById('list').innerHTML = "";	
			for(let tr of ary) {
				document.getElementById('list').appendChild(tr);
			}
		}
		
		
		//db가 아닌 화면에서 데이터 가져오면 한번에 하나씩밖에 못봄
	</script>
</body>
</html>