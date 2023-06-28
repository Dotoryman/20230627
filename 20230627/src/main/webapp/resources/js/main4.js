/**
 * 
 */
let jsonData = `[{"id":1,"first_name":"Rudolf","last_name":"Musslewhite","email":"rmusslewhite0@cdc.gov","gender":"Male","salary":4175},
{"id":2,"first_name":"Brook","last_name":"Mawson","email":"bmawson1@telegraph.co.uk","gender":"Polygender","salary":2713},
{"id":3,"first_name":"Ashli","last_name":"Wearne","email":"awearne2@w3.org","gender":"Female","salary":4546},
{"id":4,"first_name":"Gaynor","last_name":"Scarratt","email":"gscarratt3@mozilla.com","gender":"Bigender","salary":4472},
{"id":5,"first_name":"Appolonia","last_name":"Follos","email":"afollos4@wp.com","gender":"Female","salary":3947},
{"id":6,"first_name":"Penrod","last_name":"Semkins","email":"psemkins5@discuz.net","gender":"Male","salary":2803},
{"id":7,"first_name":"Hunt","last_name":"Treat","email":"htreat6@timesonline.co.uk","gender":"Male","salary":4973},
{"id":8,"first_name":"Beatrisa","last_name":"Eakens","email":"beakens7@oaic.gov.au","gender":"Female","salary":1171},
{"id":9,"first_name":"Sena","last_name":"Scadding","email":"sscadding8@google.com.br","gender":"Genderfluid","salary":4992},
{"id":10,"first_name":"Romola","last_name":"Binder","email":"rbinder9@bravesites.com","gender":"Female","salary":2748},
{"id":11,"first_name":"Valdemar","last_name":"Whiteman","email":"vwhitemana@webeden.co.uk","gender":"Male","salary":4580},
{"id":12,"first_name":"Hadlee","last_name":"Rotge","email":"hrotgeb@cafepress.com","gender":"Male","salary":3310},
{"id":13,"first_name":"Sandro","last_name":"Rickarsey","email":"srickarseyc@sciencedaily.com","gender":"Male","salary":3710},
{"id":14,"first_name":"Brice","last_name":"Baudy","email":"bbaudyd@opensource.org","gender":"Male","salary":3799},
{"id":15,"first_name":"Raleigh","last_name":"Goodbourn","email":"rgoodbourne@eventbrite.com","gender":"Male","salary":4331}]`;

let data = JSON.parse(jsonData);
//console.log(data);

let xhtp = new XMLHttpRequest();
xhtp.open('get', 'chartData.do');
xhtp.send();
xhtp.onreadystatechange = function () {
	if (xhtp.readyState == 4 && xhtp.status == 200){
		console.log(xhtp.responseText);
		let data = JSON.parse(xhtp.responseText);
		console.log(data)
	}
}
