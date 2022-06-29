<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>번호 입력 시스템</h1>
	<form action="jdbc_connect_test3_pro.jsp">
		번호 : <input type="text" name="idx">
		<input type="submit" value="저장">
	</form>
</body>
</html>













