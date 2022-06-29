<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeTest3.jsp - 영역 객체</h1>
	<!-- attributeTest2.jsp 페이지를 실행하여 하이퍼링크를 통해 이동한 페이지 -->
	
	<!-- page 객체는 해당 페이지에서만 유효하므로 포워딩 된 다른 페이지에 전달X -->	
	<h3>page 객체 값 : <%=pageContext.getAttribute("pageValue") %></h3> <!-- null 출력됨 -->
	
	<!-- request 객체는 Redirect 방식으로 이동했으므로 새 페이지에 전달 X -->
	<h3>request 객체 값 : <%=request.getAttribute("requestValue") %></h3> <!-- null 출력됨 -->
	
	<h3>session 객체 값 : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application 객체 값 : <%=application.getAttribute("applicationValue") %></h3>
	
</body>
</html>











