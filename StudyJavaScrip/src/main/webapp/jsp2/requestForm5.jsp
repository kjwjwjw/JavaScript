<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	URL 정보에 파라미터값을 포함하여 전달하는 기본 문법
	- 이동할 페이지 URL 뒤에 ? 기호를 붙이고 파라미터명=값 을 한 세트로 지정하며,
	  복수개의 파라미터가 있을 경우 각 파라미터간에 & 기호를 통해 구분해야함  
	- 이동할페이지URL?파라미터명1=파라미터값1&파라미터명2=파라미터값2
	-->
	<input type="button" value="이동" onclick="location.href='requestPro5.jsp?id=admin&passwd=1234'">
</body>
</html>




















