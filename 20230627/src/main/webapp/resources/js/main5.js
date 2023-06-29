/**
 * 
 */
document.querySelectorAll('#page-content-wrapper table')
					.forEach(function (tbl) {
							tbl.innerHTML = "";
					});

document.querySelectorAll('#page-content-wrapper h3')
					.forEach(function (elem) {
							elem.remove();
					});



const array1 = ['a', 'b', 'c'];

array1.forEach(function(element, idx, ary){
	console.log(element, idx, ary);
})

let box = document.querySelector('.outer span');

/*let userInput = document.querySelector('userInput');

let cnt = 0;
userInput.addEventListener('change', function(text){
	if(box.innerHTML == userInput.value){
		text.remove();
		cnt++;
	}
	
})*/
document.querySelector('#userInput').addEventListener('change', function(e){
	let span = document.createElement('span');
	span.innerText = document.querySelector('#userInput').value;
	document.querySelector('.outer').appendChild(span);
	
	document.querySelector('#userInput').value = "";
})
let cnt = 0;
userInput.addEventListener('change', function(text){
	if(box.innerHTML == userInput.value){
		text.remove();
		cnt++;
	}
})