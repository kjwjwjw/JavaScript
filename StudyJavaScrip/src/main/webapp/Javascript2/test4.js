/**
 * 
 */
 
 function checkNum2(num) {
	document.write("전달받은 상수 :" + num);
	var result = " ";
	
	if(num>0) {
		result ="양수";
	} else if(num<0) {
		result ="음수";
	} else {
		result = "0";
	}
	
	return result;
}

 function login(id, password) {
	
	while(true){
		var result = " "
	id = prompt("ID 입력하세요");
	if(id == "admin") {
		password = prompt("Password 입력하세요");
		if (password == "1234") {
			result = "로그인 성공";
			break;
		} else {
			result = "로그인 실패";
		}
	} else {
		result = "로그인 실패";
	}
	
	return result;
}
}

