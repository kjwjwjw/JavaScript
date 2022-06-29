<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_delete_form.jsp</h1>
	<form action="jdbc_delete_pro.jsp" method="post">
		<table border="1">
			<tr>
				<td>학번</td>
				<td><input type="text" name="no" placeholder="삭제할 학번 입력" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="삭제할 이름 입력" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="삭제"></td>
			</tr>
		</table>
	</form>
</body>
</html>