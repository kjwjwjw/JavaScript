<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 현재 페이지의 언어 설정값을 한국어("ko-kr")로 기본 설정
String language = "ko-kr";
String cookieHeader = request.getHeader("Cookie");
if(cookieHeader != null) {
	Cookie[] cookies  = request.getCookies();
		
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("language")) {
			language=cookie.getValue();
		}
	}
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	if("en-us" | <%=language%>) --%>
	
	<%if(language.equals("ko-kr")) {%>
		<h1>안녕하세요. 쿠키 예제입니다.</h1>
	<%} else if(language.equals("en-us"))  {%>
		<h1>Hello, This is Cookie example.</h1>
	<% }%>
	
	
	<button onclick="location.href='cookieTest2_set.jsp?lang=ko-kr'">한국어</button>
	<button onclick="location.href='cookieTest2_set.jsp?lang=en-us'">영어</button>
	
	
</body>
</html>