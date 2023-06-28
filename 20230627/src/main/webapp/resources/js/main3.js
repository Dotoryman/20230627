/**
 * 
 */
console.log("main 3번입니다.");

let students = [
	{name: "애나벨", age: 22, score: 75}
	,{name: "톰소여", age: 24, score: 85}
	,{name: "장고", age: 29, score: 95}
]

function makeTr(obj ={}) {
	let tr = document.createElement('tr');
	for (let prop in obj){
		let td = document.createElement('td');
		td.innerText = obj[prop];
		tr.appendChild(td);
	}
	// button 생성
	let td = document.createElement('td');
	let btn = document.createElement('button');
	btn.innerText = '삭제'
	btn.addEventListener('click', delFnc);
	td.appendChild(btn);
	tr.appendChild(td);
	return tr;
}

function delFnc(e) {
	e.target.parentElement.parentElement.remove();
}


// 배열의 값을 활용해서 목록에 정보생성
// 배열의 경우 반복문 for ~ of 사용
for (let student of students){
	// student : {name: "링컨", age: 22, score: 75}
	let tr = makeTr(student); // tr 생성
	document.getElementById('target').appendChild(tr);
}