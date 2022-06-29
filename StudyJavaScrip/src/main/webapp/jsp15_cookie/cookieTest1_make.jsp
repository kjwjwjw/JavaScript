<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Cookie cookie = new Cookie("cookieName","cookieValue");
// => cookieName 이라는 속성명으로 cookieValue 라는 값 저장

// 2. 생성된 쿠키의 유효기간 설정 
// => Cookie 객체의 setMaxAge( ) 메서드를 호출하여 유효기간 지정(초 단위)
// 	  만약, 생략 시 웹브라우저 동작할 동안만 쿠키가 유지됨
cookie.setMaxAge(60);

// 3. 쿠키를 클라이언트로 전송
// => response 객체의 addCookie() 메서드를 호출하여 생성된 Cookie 객체를 파라미터로 전달
response.addCookie(cookie);

Cookie cookie2 = new Cookie("cookie2name", "cookie2value");
cookie.setMaxAge(100);
response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 생성</h1>
	<!-- Cookie 객체 정보 확인(임시로 생성한 페이지에서 확인 
		-getName() 메서드 : 쿠키명 확인
		-getMaxAge() 메서드 : 쿠키의 유효기간 확인
	-->
	<h3><%=cookie.getName() %></h3>
	<h3><%=cookie.getValue() %></h3>
	<h3><%=cookie.getMaxAge() %></h3>
	
	<button onclick="location.href='cookieTest1_use.jsp'">쿠키 확인</button>
</body>
</html>