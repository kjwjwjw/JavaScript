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
	// 폼 파라미터로 전달받은 4개의 파라미터값 가져와서 변수에 저장 후 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin");
	String forwardPage = request.getParameter("forwardPage");
	%>
	<h1>forwardPro2.jsp - 포워딩 페이지</h1>
	<h3>이름 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>주민번호 : <%=jumin %></h3>
	<h3>포워드 페이지 : <%=forwardPage %></h3>
	
	<!-- jsp:forward 액션태그의 jsp:param 태그를 통해 전달받은 파라미터 가져와서 출력 -->
	<h3>jsp:param 값1 : <%=request.getParameter("paramValue") %></h3>
	<h3>jsp:param 값2 : <%=request.getParameter("paramValue2") %></h3>
	
</body>
</html>


















