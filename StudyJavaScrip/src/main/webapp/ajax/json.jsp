<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<style type="text/css">
table {
	text-align: center;
}

</style>
<script type="text/javascript">



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

				$("#resultArea").html("<table border='1' margin='auto'><tr></tr></table>");
				$("#resultArea > table").append("<tr><th>예금주</th><th>계좌번호</th><th>현재잔고</th><th>정보수신동의</th></tr>")
				// JSON 데이터가 대괄호[] 로 감싸져 있을 경우 배열 데이터로 취급되고
				// 해당 배열 내에서 중괄호{} 감싸져 있는 객체에 접근하여 객체의 속성 사용 가능
				// => 배열명[인덱스].속성
// 				$("#resultArea").html(data[0].id);
				
				// 파싱된 JSON 객체의 배열 크기만큼 반복 작업 수행 => for문 사용
				for(let i = 0; i < data.length; i++) {
					// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
					let ownerName = data[i].ownerName;
					let accountNo = data[i].accountNo;
					let balance = data[i].balance;
					let agreeRcvSpam = data[i].agreeRcvSpam;
					
					// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
					$("#resultArea > table").append(
							"<tr><td>" + ownerName + "</td>" 
							+ "<td>" + accountNo + "</td>" 
							+ "<td>" + balance + "</td>" 
							+ "<td>" + agreeRcvSpam + "</td></tr>"
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
	<h1>json.jsp</h1>
	<div id="resultArea"></div>
</body>
</html>












