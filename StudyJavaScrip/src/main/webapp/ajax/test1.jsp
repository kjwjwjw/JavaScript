<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// document 객체에 대한 ready 이벤트
	$(function() {
		// btonOk 버튼 클릭 시 동작할 이벤트에 익명 함수 연결
		$("#btnOk").on("click", function(){
			
			// 폼을 지정하여 serialize() 함수호출 시 해당폼의 데이터 직렬화(= 모두 내보내기)
			
// 			let sendData = $("form").serialize();
			
			$.ajax({
				// 속성명 : 값 형태로 지정
				type: "GET", // 요청 방식
				url: "test1_result.jsp", // 요청 URL
				data : {
					// 복수개의 파라미터 직접 전달 시
// 				id: "admin" ,"
//  				passwd : "1234"
 				id: $("#id").val(),
 				passwd: $("#passwd").val()
				},
// 				data: sendData, // $("form").serialize() 함수 사용시 가져온 데이터 전달
				dataType: "text", // 전송하는 데이터의 타입
				success: function(msg) { // 요청 성공 시 응답 데이터를 전달받는 익명 함수 정의
					// => 응답 페이지의 응답 내용이 익명 함수 파라미터로 전달되며
					// 	  해당 파라미터 내의 데이터를 사용하여 응답 페이지에 접근 가능
					$("#resultArea").html(msg); // 응답 내용을 #resultArea에 출력
				}
			});
		});
	});

</script>
</head>
<body>
	<h1> AJAX - test.jsp </h1>
	<form>
		<table border="1">
			<tr>
				<td>아이디</td><td><input type="text" name="id" id="id" ></td>
				</tr>
				<tr>
				<td>패스워드</td><td><input type="password" name="passwd" id="passwd" ></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="button" value="확인" id="btnOk"></td>
			</tr>
		</table>
	</form>
	<div id="resultArea"></div>
	
</body>
</html>