<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<!-- form 태그 액션을 writePro.jsp 로 지정하고, 메서드는 POST 방식으로 지정 -->
	<!-- table 태그를 통해 작성자(name), 비밀번호(pass), 제목(subject), 내용(content) 입력 받기 -->
	<!-- submit(글쓰기), reset(초기화), button(취소 => 클릭 시 이전페이지로 돌아가기) -->
	<form action="writePro.jsp" method="post">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="20"></textarea>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기">
					<input type="reset" value="초기화">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>
















