<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	<%
	// 세션에 저장된 아이디("sId" 속성값)를 가져와서 변수 id 에 저장
	String id = (String)session.getAttribute("sId"); 
	%>
	<!-- 세션 아이디가 존재하지 않을 경우(= null 값일 경우) 로그인, 회원가입 링크 표시 -->
	<!-- 아니면, 세션 아이디를 출력하고(XXX 님), 로그아웃 링크(sessionTest4_logout.jsp) 표시 -->
	<%if(id == null) { %>
		<a href="sessionTest4_login_form.jsp">로그인</a>&nbsp;
		<a href="">회원가입</a>
	<%} else { %>
		<%=id %>님 | <a href="sessionTest4_logout.jsp">로그아웃</a>
	<%} %>
</body>
</html>
















