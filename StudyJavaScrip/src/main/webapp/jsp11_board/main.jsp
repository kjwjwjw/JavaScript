<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 객체에 저장된 아이디("sId") 가져와서 변수 id 에 저장하기
String id = (String)session.getAttribute("sId"); // Object -> String 변환 필요
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	<h3><a href="./board/write_form.jsp">글쓰기</a></h3>
	<h3><a href="./board/list.jsp">글목록</a></h3>
	<!-- 로그인이 되지 않았을 경우 회원가입, 로그인 링크 표시 -->
	<!-- 로그인이 되었을 경우 로그인된 아이디, 로그아웃 링크 표시 -->
	<%if(id == null) { %>
	<h3><a href="./member/join_form.jsp">회원가입</a></h3>
	<h3><a href="./member/login_form.jsp">로그인</a></h3>
	<%} else { %>
	<h3><%=id %>님 | <a href="./member/logout.jsp">로그아웃</a></h3>
	<%} %>
</body>
</html>










