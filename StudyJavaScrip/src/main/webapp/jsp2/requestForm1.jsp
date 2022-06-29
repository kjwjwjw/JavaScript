<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm1.jsp - request 객체 예제</h1>
	<!-- 
	form 태그
	1) action 속성
	   - submit 시 폼 태그 내의 파라미터(= 폼파라미터)를 모두 request 객체에 저장한 후
	     action 속성에 지정된 페이지(또는 파일)로 포워딩(= 이동)
	   ex) <form action="requestPro1.jsp"> : submit 버튼 클릭 시 requestPro1.jsp 페이지로 이동
	2) method 속성
	   - 서버가 수행해야할 동작을 지정하는 속성
	   - GET 방식
	     => 폼 태그 내에 method="get" 명시 또는 method 속성 생략하거나
	        하이퍼링크를 사용하여 이동하거나 URL 을 직접 입력하여 이동할 경우
	     => 폼 파라미터가 URL 에 함께 포함되어 전달되므로 URL 에 파라미터값 노출되며,
	        전송 파라미터 데이터의 길이 제한이 있으나, POST 방식에 비해 전송속도가 빠름
	   - POST 방식
	     => 폼 태그 내에 method="post" 명시하여 이동할 경우
	     => 폼 파라미터가 URL 에 포함되지 않고 body 영역에 포함되어 전달되므로
	        URL 에 파라미터값 노출이 없고, 전송 파라미터 데이터 길이 제한도 없음
	-->
	<form action="requestPro1.jsp" method="get">
<!-- 	<form action="requestPro1.jsp" method="post"> -->
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="male">남
					<input type="radio" name="gender" value="female">여
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="운동">운동
					<input type="checkbox" name="hobby" value="게임">게임
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>

















