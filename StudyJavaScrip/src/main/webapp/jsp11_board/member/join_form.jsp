<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="join_pro.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required="required"></td>
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