<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp - 세션값 설정</h1>
	<!-- 
	session 객체 정보는 웹브라우저가 유지되는 동안 지속되는 정보를 저장하는 용도로 사용
	=> 주로, 로그인 정보 등을 임시로 저장
	
	1. session.setAttribute("속성명", 속성값); => 속성명으로 된 이름을 사용하여 속성값을 저장
	2. session.getAttribute("속성명"); => 속성명을 사용하여 저장된 속성값을 가져오기
	3. session.removeAttribute("속성명"); => 속성명과 일치하는 세션 정보를 제거
	4. session.invalidate() => 세션 정보 초기화
	-->
	<%
	session.setAttribute("session1", "세션값1");
	session.setAttribute("session2", "세션값2");
	%>
	
	<h3>세션값 저장 완료!</h3>
	<h3><a href="sessionTest2_get.jsp">이동</a></h3>
</body>
</html>














