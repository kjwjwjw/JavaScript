<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro4.jsp - 로그인 처리</h1>
	<%
	// POST 방식 한글 처리(아이디, 패스워드에 한글 미포함 시 생략 가능)
// 	request.setCharacterEncoding("UTF-8");
	
	// 폼 파라미터로 전달받은 아이디, 패스워드 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
	<!-- 
	아이디가 "admin" 이고, 패스워드가 "1234" 일 경우 
	=> "requestPro4_response_login_success.jsp" 페이지로 이동
	아니면, "requestPro4_response_login_fail.jsp" 페이지로 이동
	-->
	<%
	if(id.equals("admin") && passwd.equals("1234")) { 
		// 아이디와 패스워드가 일치할 경우(= 로그인 성공일 경우)
		response.sendRedirect("requestPro4_response_login_success.jsp");
	} else {
		// 아이디 또는 패스워드가 일치하지 않을 경우(= 로그인 실패일 경우)
		response.sendRedirect("requestPro4_response_login_fail.jsp");
	}
	%>
</body>
</html>












