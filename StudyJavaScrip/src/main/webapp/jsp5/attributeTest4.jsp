<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeTest4.jsp - 영역 객체</h1>
	<!-- session 객체와 application 객체 확인을 위해 직접 실행하는 페이지 -->

	<!-- page 객체는 해당 페이지에서만 유효하므로 포워딩 된 다른 페이지에 전달X -->	
	<h3>page 객체 값 : <%=pageContext.getAttribute("pageValue") %></h3> <!-- null 출력됨 -->
	
	<!-- request 객체는 Redirect 방식으로 이동했으므로 새 페이지에 전달 X -->
	<h3>request 객체 값 : <%=request.getAttribute("requestValue") %></h3> <!-- null 출력됨 -->
	
	<!-- 웹브라우저를 완전히 종료한 후 현재 페이지를 실행했으므로 기존 세션 유지 X -->
	<h3>session 객체 값 : <%=session.getAttribute("sessionValue") %></h3> <!-- null 출력됨 -->
	
	<!-- 서버(= 톰캣)를 종료하기 전까지는 계속 유지 -->
	<h3>application 객체 값 : <%=application.getAttribute("applicationValue") %></h3>
	
</body>
</html>











