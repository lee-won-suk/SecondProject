function chkTel(){
	var reg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var tel = document.getElementById("tel");
	
	if(tel.value==""){
		alert('핸드폰번호를 입력하세요');
		return;
	}
	if(!reg.test(tel.value)){
		alert('핸드폰번호의 형식이 잘못되었습니다');
		return;
	}
}
function sendMember(){
	let items = ['id', 'pw'];
	
	for(let item of items)
		if(IsEmpty(item)==false)
			return;
	
	document.getElementById('frm').submit();
}