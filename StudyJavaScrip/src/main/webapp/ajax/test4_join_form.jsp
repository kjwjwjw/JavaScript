<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#id").on("blur", function(){
			// 아이디 값을 사용하여 test4_check_id_pro.jsp 페이지로 전달하여
			// MemberDAO 의 checkId() 메서드를 통해 ID중복 판별 후 결과 출력
			$.ajax({
				type: "GET",
				url: "test4_check_id_pro.jsp",
				data: {
					id : $("#id").val()
				},
				dataType: "text",
				success: function(msg) { // 요청에 대한 처리 성공 시
					$("#resultArea").html(msg);
				}
				});
		});
	});
	
	
</script>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="test4_result.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
				<input type="text" name="id" id="id" required="required">
				<div id="resultArea"></div>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
					<input type="reset" value="초기화">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>