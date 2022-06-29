<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	// DB 연결에 필요한 정보 문자열 4가지를 변수에 저장
	String driver = "com.mysql.jdbc.Driver"; // 드라이버 클래스 위치 및 클래스명
	String url = "jdbc:mysql://localhost:3306/study_jsp3"; // 접속 URL 및 DB명
	String user = "root"; // DB 접속 계정명
	String password = "1234"; // DB 접속 계정 패스워드
	
	// 1단계. JDBC 드라이버 로드
	Class.forName(driver);
	out.println("<h1>드라이버 로드 성공!</h1>");
	
	
	// 2단계. DB 연결
// 	DriverManager.getConnection(url, user, password);
	
	// getConnection() 메서드를 통해 DB 연결 성공 시
	// DB 접속 정보를 관리하는 java.sql.Connection 타입 객체가 리턴됨
	// => Connection 타입 변수를 선언하여 리턴되는 객체 저장
	Connection con = DriverManager.getConnection(url, user, password);
	
// 	out.println("<h1>DB 연결 성공!</h1>");
	%>
	<h1>DB 연결 성공!(객체 내용 : <%=con %>)</h1>
</body>
</html>















