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
	// DB 연결에 필요한 정보 문자열 4가지를 변수에 저장
	String driver = "com.mysql.jdbc.Driver"; // 드라이버 클래스 위치 및 클래스명
	String url = "jdbc:mysql://localhost:3306/study_jsp3"; // 접속 URL 및 DB명
	String user = "root"; // DB 접속 계정명
	String password = "1234"; // DB 접속 계정 패스워드
	
	// 1단계. JDBC 드라이버 로드
	Class.forName(driver);
	out.println("<h1>드라이버 로드 성공!</h1>");
	
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, user, password);
	out.println("<h1>DB 연결 성공!</h1>");
	
	// 3단계. SQL 구문 작성 및 전달
	// 1) SQL 구문 작성
// 	String sql = "INSERT INTO test VALUES (3)";
	
	// 일반적으로는 외부로부터 데이터를 입력(전달)받아 변수에 저장하여 데이터베이스에 전달
	int idx = 2; // 외부로부터 추가할 데이터를 입력받았다고 가정
	// 데이터가 위치할 부분은 문자열 결합을 통해 변수를 결합하여 SQL 구문을 작성해야한다!
	String sql = "INSERT INTO test VALUES (" + idx + ")";
	
	// 2) Connection 객체(con)의 prepareStatement() 메서드를 호출하여 SQL 구문 전달
	//    => 파라미터 : SQL 구문(String 타입)    리턴타입 : java.sql.PreparedStatement 객체
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	/*
	[ 4단계. SQL 구문 실행 및 결과 처리 ]
  - 3단계에서 리턴받은 PreparedStatemenet 객체의 
    executeXXX() 메서드를 호출하여 전달받은 SQL 구문 실행
    1) executeUpdate() - DB 에 조작을 가하는 쿼리문을 실행하는 용도의 메서드
                         => 주로, DML 중 INSERT, UPDATE, DELETE 와
                            DDL 중 CREATE, ALTER, DROP 등 실행하는 용도
                         => 작업 실행 후 결과값이 int 타입으로 리턴되는데
                            이는, 영향을 받은 레코드 수가 리턴됨(DML 한정, 나머지는 0)
    2) executeQuery() - DB 에 조작을 가하지 않는 쿼리문(SELECT)을 실행하는 용도의 메서드
                        => 작업 실행 후 조회된 결과 테이블을 
                           java.sql.ResultSet 타입 객체로 리턴함
	*/
	
	// INSERT 구문 실행을 위해 PreparedStatement 객체의 executeUpdate() 메서드를 호출
	// => 이 때, SQL 구문을 다시 전달하지 않도록 주의(executeUpdate(sql) 메서드는 다른 객체에 있음)
	// => 또한, 메서드 실행 후 리턴되는 데이터를 int 타입 변수에 저장하면
	//    DML 실행 후 영향을 받은 레코드 수를 알 수 있다! (결과 판별 가능)
	int insertCount = pstmt.executeUpdate();
	%>
	<hr>
	<h1>INSERT 작업 완료 - <%=insertCount %> 개 레코드 추가됨</h1>
</body>
</html>













