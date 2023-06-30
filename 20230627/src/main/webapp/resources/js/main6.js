/**
 * 
 */
// 화면지우기
document.querySelectorAll('#page-content-wrapper table')
	.forEach(function(tbl) {
		tbl.innerHTML = "";
	});

document.querySelectorAll('#page-content-wrapper h3')
	.forEach(function(elem) {
		elem.remove();
	});

const str = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum autem repellat consectetur cum id ab quam atque in, facere sed architecto sunt labore repudiandae corporis distinctio. Aut minus sit corporis!';

const strAry = str.split(' ');
let outer = document.querySelector('div.outer')

strAry.forEach(function(word) {
	let span = document.createElement('span');
	span.innerText = word;
	outer.appendChild(span);
})

let secs = 100;
setInterval(function() {
	// document.getElementById('item').innerText = new Date();
	document.getElementById('time').innerText = secs--;
	if(secs == -2){
		alert("실패!");
	}
}, 1000);

let userInput = document.getElementById('userInput');

userInput.addEventListener('change', function() {
let texts = document.querySelectorAll('.outer span')
	if (userInput != null) {
		texts.forEach(function(text) {
			if (text.innerHTML == userInput.value) {
				text.remove();
			}
		})
        texts = document.querySelectorAll('.outer span')
		userInput.value = "";
        console.log(texts.length)
        if(texts.length == 28){
			alert("성공!");
		} 
	}
})
console.log();






//추가하기
/*
document.querySelector('#userInput').addEventListener('change', function(e){
	let span = document.createElement('span');
	span.innerText = document.querySelector('#userInput').value;
	document.querySelector('.outer').appendChild(span);
	
	document.querySelector('#userInput').value = "";
})*/



