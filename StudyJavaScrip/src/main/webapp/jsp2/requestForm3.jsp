<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm3.jsp - 회원 가입</h1>
	<form action="requestPro3.jsp" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" required="required"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job" required="required">
						<option value="">항목을 선택하세요</option>
						<option value="개발자">개발자</option>
						<option value="DB엔지니어">DB엔지니어</option>
						<option value="관리자">관리자</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="게임">게임
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


















