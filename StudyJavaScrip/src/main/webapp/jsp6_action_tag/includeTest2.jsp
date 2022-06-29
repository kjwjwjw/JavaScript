<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<h1>includeTest2 - 액션태그(include)</h1>
	<h3>includeTest1.jsp 로부터 전달받은 파라미터값 : <%=request.getParameter("param") %></h3>
</body>
</html>