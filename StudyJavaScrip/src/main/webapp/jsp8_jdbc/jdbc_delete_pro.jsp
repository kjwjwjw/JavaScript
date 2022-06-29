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
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계. 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, user, password);

	// 3단계. SQL 구문 작성 및 전달
	// 학번(no)과 이름(name) 이 일치하는 레코드를 찾아 삭제(DELETE) 작업 수행
	// => INSERT 작업과 SQL 구문만 다르고 동작 방식은 동일함
	String sql = "DELETE FROM test3 WHERE no=? AND name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no);
	pstmt.setString(2, name);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int deleteCount = pstmt.executeUpdate();
	%>
	<h1>삭제 완료 - <%=deleteCount %>개 레코드</h1>
</body>
</html>












