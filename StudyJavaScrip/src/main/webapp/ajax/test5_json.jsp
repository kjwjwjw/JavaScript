<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// 자바스크립트 형식의 객체 생성
	let jsObject = {
		name : "홍길동",
		age : 20
	};
	// => 자바스크립트의 객체에 접근 시 변수명.속성명 형태로 접근
	
	// JSON 객체의 stringify() 함수
	// - 파라미터로 전달된 자바스크립트 객체를 JSON 형식의 문자열로 변환
// 	$(function() {
// 		$("#btnOk").on("click", function() {
// 			// jsObject 객체를 JSON 형식으로 변환
// 			// {"name":"홍길동","age":20} 출력됨
// 			alert(JSON.stringify(jsObject));
// 		});
// 	});
	
	$(function() {
			$.ajax({
				type: "GET",
				url: "account_data.txt",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
				// 요청 성공 시 자동으로 호출되는 함수 정의
				// => 요청에 성공했을 경우 함수 파라미터에 응답 결과(JSON 객체)가 전달됨
// 				alert(data);
				
				// 전달받은 JSON 객체를 문자열 형식으로 변환
// 				alert(JSON.stringify(data));
				
// 				$("#resultArea").html(JSON.stringify(data));

				$("#resultArea").html("<table border='1'><tr><th colspan='4'>데이터 목록</th></tr></table>");
				$("#resultArea > table").append("<tr><th>Price</th></tr><tr><th>View</th></tr><tr><th>Brand</th></tr><tr><th>Category</th></tr>")
				// JSON 데이터가 대괄호[] 로 감싸져 있을 경우 배열 데이터로 취급되고
				// 해당 배열 내에서 중괄호{} 감싸져 있는 객체에 접근하여 객체의 속성 사용 가능
				// => 배열명[인덱스].속성
// 				$("#resultArea").html(data[0].id);
				
				// 파싱된 JSON 객체의 배열 크기만큼 반복 작업 수행 => for문 사용
				for(let i = 0; i < 1; i++) {
					// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
					let ownerName = data[i].ownerName;
					let accountNo = data[i].accountNo;
					let balance = data[i].balance;
					let agreeRcvSpam = data[i].agreeRcvSpam;
					
					// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
					$("#resultArea > table").append(
						
							
							
							"<tr><td><input type='checkbox' value='"+ ownerName + "'> "+ ownerName + "</td></tr>" 
							+ "<tr><td><input type='checkbox' value='"+ accountNo + "'> "+ accountNo + "</td></tr>" 
							+ "<tr><td><input type='checkbox' value='" + balance + "'>" + balance + "</td></tr>" 
							+ "<tr><td><input type='checkbox' value='" + agreeRcvSpam + "'> " + agreeRcvSpam + "</td></tr>"
					);
				}
			})
			.fail(function() {
				// 요청 실패 시 자동으로 호출되는 함수 정의
				$("#resultArea").html("요청 실패");
			});
		
	});
	
</script>
</head>
<body>
	<h1>test5_json.jsp</h1>
	<div id="resultArea"></div>
</body>
</html>












