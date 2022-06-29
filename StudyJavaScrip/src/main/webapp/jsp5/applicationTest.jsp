<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>applicationTest.jsp</h1>
	<!-- 
	application 객체
	- 웹 어플리케이션 서버(WAS = 웹컨테이너 = 톰캣)에 대한 정보를 관리하는 객체
	- 웹 어플리케이션(= 프로젝트) 하나 당 하나의 application 객체를 생성하고 관리함
	  => 웹 어플리케이션 전체 영역에서 하나의 application 객체를 공유함
	- 서버가 시작되면 application 객체가 생성되고, 서버가 중단되면 객체가 제거됨
	-->
	<h3>서버 정보 : <%=application.getServerInfo() %></h3>
	<h3>서버의 물리적 경로(실제 경로) : <%=application.getRealPath("/") %></h3>
	<h3>서버의 컨텍스트 경로 : <%=application.getContextPath() %></h3>
</body>
</html>













