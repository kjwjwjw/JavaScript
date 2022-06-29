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
	
	int search_no = Integer.parseInt(request.getParameter("search_no"));
	String search_name = request.getParameter("search_name");
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
	// 학번(search_no)과 이름(search_name) 이 일치하는 레코드를 찾아 
	// 전달받은 학번(no)과 이름(name)으로 변경(UPDATE)
	// => INSERT, DELETE 작업과 SQL 구문만 다르고 동작 방식은 동일함
	String sql = "UPDATE test3 SET no=?,name=? WHERE no=? AND name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no); // 변경할 학번
	pstmt.setString(2, name); // 변경할 이름
	pstmt.setInt(3, search_no); // 검색할 학번
	pstmt.setString(4, search_name); // 검색할 이름
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int updateCount = pstmt.executeUpdate();
	%>
	<h1>수정 완료 - <%=updateCount %>개 레코드</h1>
</body>
</html>












