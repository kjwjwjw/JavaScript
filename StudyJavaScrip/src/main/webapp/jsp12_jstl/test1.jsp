<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// JSP 내장 객체인 session 객체를 활용하여 "testValue" 라는 속성에 "Session value" 값(문자열) 저장
// => 요청 처리 페이지(test1_result.jsp)에서 EL 의 내장 객체로 접근할 데이터 저장
session.setAttribute("testValue", "Session value");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>JSTL - test1.jsp</H1>
	<form action="test1_result.jsp">
		이름 <input type="text" name="name">
		<input type="submit" value="전송">
	</form>
</body>
</html>