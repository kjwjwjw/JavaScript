<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro5.jsp</h1>
	<!-- URL 을 통해 파라미터를 전달하거나 form 태그의 method="get" 지정 시 GET 방식 요청 -->
	<%
	// URL 을 통해 전달받은 id, passwd 파라미터값 가져와서 변수에 저장 후 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
</body>
</html>