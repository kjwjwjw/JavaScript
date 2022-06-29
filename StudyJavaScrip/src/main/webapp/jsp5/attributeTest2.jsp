<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeTest2.jsp - 영역 객체</h1>
	<!-- attributeTest1.jsp 페이지를 실행하여 이동한 페이지 -->
	<!-- page 객체는 해당 페이지에서만 유효하므로 포워딩 된 attributeTest2.jsp 페이지에 전달X -->	
	<h3>page 객체 값 : <%=pageContext.getAttribute("pageValue") %></h3> <!-- null 출력됨 -->
	
	<!-- request 객체는 Dispatcher 방식으로 이동했으므로 새 페이지에서도 유지됨 -->
	<h3>request 객체 값 : <%=request.getAttribute("requestValue") %></h3>
	<h3>session 객체 값 : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application 객체 값 : <%=application.getAttribute("applicationValue") %></h3>
	
	<!-- 
	하이퍼링크를 사용하여 "attributeTest3.jsp" 페이지로 이동(= Redirect 방식)
	=> 새로운 요청이 발생하므로 새로운 request 객체가 생성되도록 하기 위함
	-->
	<a href="attributeTest3.jsp">Redirect 방식으로 이동</a>
</body>
</html>











