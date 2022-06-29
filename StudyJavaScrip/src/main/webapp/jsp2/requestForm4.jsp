<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro4.jsp - 로그인</h1>
	<!-- 
	아이디(속성명 id), 패스워드(속성명 passwd)를 입력받고,
	"로그인" 버튼(타입 submit) 클릭 시 requestPro4.jsp 페이지로 이동(POST 방식) 
	-->
	<form action="requestPro4.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>
















