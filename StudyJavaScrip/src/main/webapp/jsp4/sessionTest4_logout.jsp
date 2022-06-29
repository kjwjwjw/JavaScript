<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 세션에 저장된 모든 정보 초기화 후 sessionTest4_login_main.jsp 페이지로 이동
// 	session.invalidate();
	
	// 만약, 특정 세션 정보만 삭제하는 경우 removeAttribute() 메서드 사용
	// 세션 아이디("sId") 만 삭제할 경우
	session.removeAttribute("sId");
	
	response.sendRedirect("sessionTest4_login_main.jsp");
	%>
</body>
</html>














