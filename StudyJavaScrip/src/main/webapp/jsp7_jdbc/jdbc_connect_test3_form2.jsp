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
	<h1>정보 입력</h1>
	<form action="jdbc_connect_test3_pro2.jsp">
		번호 : <input type="text" name="idx"><br>
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="password" name="passwd"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>













