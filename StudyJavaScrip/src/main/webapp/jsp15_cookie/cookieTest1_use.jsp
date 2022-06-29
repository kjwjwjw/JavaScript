<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클라이언트에 저장된 쿠키 사용하기</h1>
	<%
	// 1. request 객체의 헤더에 "Cookie" 문자열 존재 ㅇ부확인
	String cookieHeader = request.getHeader("Cookie");
	
	// 2. 리턴받은 헤더 정보 문자열이 null 이 아닐 경우 쿠키가 존재하는 의미
	if(cookieHeader != null) {
		// 3. request 객체로부터 Cookie 객체 가져오기
		//	  requst 객체의 getCookies() 메서드를 호출하여 Cookie[] 배열 타입으로 리턴받기 
		// => 복수개의 쿠키가 존재할 수 있으므로 배열로 관리되며
		// 	  for문을 사용하여 배열 크기만큼 반복하면서 쿠키에 접근 가능
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			out.println("Cookie getName( ) :" + cookie.getName() +"<br>" ); 
			out.println("Cookie getValue( ) :" + cookie.getValue() +"<br>");
		}
	}
	%>

</body>
</html>