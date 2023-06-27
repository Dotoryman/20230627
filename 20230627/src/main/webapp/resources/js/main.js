/**
 * main.js 
 */
 console.log("main.js입니다");
 
let obj = {name : "링컨", age : 29, phone : "010-1231-1321"}
console.log(obj.name, obj['age'], obj['phone']);
console.log(obj.age);
console.log(obj.phone); 
for (let prop in obj) {
	console.log("속성 : " + prop + ", 값 : " + obj[prop]);
}

let ary = [];
ary.push({name : "루즈벨트", age : 26, phone : "010-2323-4444"});
ary.push(obj);
ary.push("김춘길");
ary.pop();

console.log(ary);

for (let val of ary) {
	for (let prop in val){
		console.log(val[prop]);
	}
}

let ulTag = document.createElement('ul'); // <ul />
for (let val of ary) {
	let liTag = document.createElement('li'); //<li />
	liTag.innerText = val['name'];
	ulTag.appendChild(liTag);
	// button
	let btn = document.createElement('button');
	btn.innerText = '클릭';
	liTag.appendChild(btn);
}

console.log(ulTag);

document.getElementById('page-content-wrapper').appendChild(ulTag);




