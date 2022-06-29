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
	// 번호, 이름, 나이, 성별 파라미터 가져와서 test3 테이블에 추가(INSERT)
	// => 주의! 한글 데이터가 포함되므로 UTF-8 설정 필수!
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no")); // String -> int 변환 필수
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age")); // String -> int 변환 필수
	String gender = request.getParameter("gender");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계. 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, user, password);
// 	out.println("<h3>DB 연결 성공!</h3>");

	// 3단계. SQL 구문 작성 및 전달
	String sql = "INSERT INTO test3 VALUES(?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	// 만능문자(?) 파라미터 데이터 교체
	pstmt.setInt(1, no);
	pstmt.setString(2, name);
	pstmt.setInt(3, age);
	pstmt.setString(4, gender);
	
	// 4단계. SQL 구문 실행 및 전달
	int insertCount = pstmt.executeUpdate();
	out.println("<h3>데이터 추가 성공! - " + insertCount + "개 레코드</h3>");
	%>
</body>
</html>

















