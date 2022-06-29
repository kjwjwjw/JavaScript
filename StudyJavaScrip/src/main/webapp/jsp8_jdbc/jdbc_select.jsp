<%@page import="java.sql.ResultSet"%>
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
	// JDBC 를 활용하여 test4 테이블에 레코드 추가
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계. 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, user, password);

	// 3단계. SQL 구문 작성 및 전달
	// test3 테이블의 모든 레코드 조회
	String sql = "SELECT * FROM test3";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	/*
	4단계. SQL 구문 실행 및 결과 처리 => SELECT 에서 매우 중요!
	int executeUpdate() : INSERT, UPDATE, DELETE  등 데이터베이스 조작에 필요한 작업을 수행하는 메서드
	=> 실행 후 영향을 받은 레코드 수가 int 타입으로 리턴됨(단, DML 만 실제 값이 리턴됨)
	
	ResultSet executeQuery() : SELECT 구문 전용 메서드
	=> 실행 후 조회된 테이블 형태를 관리하는 ResultSet 타입 객체 리턴됨
	*/
	
	ResultSet rs = pstmt.executeQuery(); // 조회 후 결과를 ResultSet 타입으로 저장
	/*
	조회 결과가 다음 형태의 테이블로 조회되며, ResultSet 타입 객체로 리턴됨
	또한, 커서(Cursor) 라는 개념의 포인터가 조회된 테이블 최상단(데이터보다 윗쪽)에 위치함
	+------+--------+------+--------+
	| no   | name   | age  | gender | <= 현재 포인터(커서) 위치
	+------+--------+------+--------+
	|    1 | 홍길동 |   20 | 남     |
	|    2 | 관리자 |   30 | 남     |
	|    3 | 이순신 |   44 | 남     |
	|    4 | 김태희 |   40 | 여     |
	|    5 | 전지현 |   20 | 여     |
	+------+--------+------+--------+
	현재 커서가 위치한 곳은 데이터가 있는 레코드의 윗쪽이므로
	커서를 한 줄씩 아래로 이동시키면서 각 레코드에 접근해야함
	=> ResultSet 객체의 next() 메서드를 호출하면 커서를 한 줄 아래로 이동시킨 후 
	   레코드가 존재하면 true 값 리턴하고, 존재하지 않으면 false 값 리턴
	=> 따라서, 커서를 다음 레코드가 존재할 동안 이동시키면서 각 레코드에 접근 가능
	=> 반복 횟수가 정해져 있지 않으므로 while 문을 활용하여 rs.next() 결과가 true 동안 반복하는것이 유리함
	   (조회 결과 레코드가 1개밖에 없을 경우 while 문 대신 if 문으로 교체 가능)
	*/
// 	while(rs.next()) { // 다음 레코드가 존재할 동안 반복(= 다음 레코드가 존재하지 않으면 반복 종료됨)
// 		/*
// 		커서를 이동시킨 후 해당 레코드에서 각 컬럼에 접근하기 위해
// 		ResultSet 객체의 getXXX() 메서드를 호출하여 컬럼에 접근 가능
// 		=> 이 때, getXXX() 메서드의 XXX 은 가져올 컬럼에 대한 자바 데이터타입명을 지정
// 		   ex) 가져올 컬럼의 타입이 varchar 타입일 경우 호출할 메서드 이름 : getString()
//                가져올 컬럼의 타입이 int 타입일 경우 호출할 메서드 이름 : getInt()
//         => getXXX() 메서드의 파라미터로 컬럼 인덱스 번호(int 타입) 또는 컬럼명(String 타입) 사용
//            인덱스 번호는 1번부터 컬럼순서대로 자동으로 부여됨
//            ex) "varchar 타입"의 "두번째" 컬럼인 "name" 컬럼에 에 접근할 경우 : getString(2) 또는 getString("name")
// 		*/
		
// 		// 첫번째 컬럼(1번 인덱스)의 타입이 varchar 타입이고 컬럼명이 "no" 인 컬럼에 접근하여 데이터 가져와서 변수 no 에 저장하기
// // 		String no = rs.getString(1); // 인덱스 번호(int 타입)를 사용하여 컬럼에 접근 시 => 인덱스 범위 주의!
// //         out.println("인덱스로 접근 : " + no + "<br>");

// // 		String no = rs.getString("no"); // 컬럼명(String 타입)를 사용하여 컬럼에 접근 시 => 오타 주의!
// //         out.println("컬럼명으로 접근 : " + no + "<br>");

// 		// 4개 컬럼 데이터를 모두 변수에 저장 후 한꺼번에 출력
// // 		int no = rs.getInt(1); // int 타입 첫번째 컬럼
// 		int no = rs.getInt("no"); // 컬럼명 "no" 인 컬럼
// 		String name = rs.getString("name"); // 또는 rs.getString(2)
// 		int age = rs.getInt("age"); // 또는 rs.getInt(3)
// 		String gender = rs.getString("gender"); // 또는 rs.getString(4)
		
// 		out.println(no + ", " + name + ", " + age + ", " + gender + "<br>");
// 	}
	%>
	
	<!-- 조회된 테이블 정보를 table 태그를 사용하여 표시하기 위해 테이블 생성 -->
	<!-- while 문을 사용하여 ResultSet 객체를 반복하기 전 제목열 까지는 직접 생성하고, 데이터만 반복 -->
	<table border="1">
		<!-- 제목을 표시하기 위한 행(tr) 생성 -->
		<tr>
			<th width="150">학번</th>
			<th width="150">이름</th>
			<th width="100">나이</th>
			<th width="100">성별</th>
		</tr>
		<!-- 데이터를 표시하기 위한 행(tr) 생성 => while 문을 통해 반복 작업 필요 -->
		<%
		// while 문을 사용하여 ResultSet 객체의 다음 레코드가 존재할 동안 반복
		while(rs.next()) {
			// no, name, age, gender 변수 선언 및 데이터 가져와서 저장
			int id = rs.getInt("no");
			String name = rs.getString("name");
			int age = rs.getInt("age");
			String gender = rs.getString("gender");
			
			// tr 태그와 td 태그를 조합하여 1개 레코드(tr)의 각 데이터(td)를 표시
			// out.println() 메서드를 통해 자바코드로 행, 열 출력할 경우
// 			out.println("<tr>");
// 			out.println("<td>" + id + "</td>");
// 			out.println("<td>" + name + "</td>");
// 			out.println("<td>" + age + "</td>");
// 			out.println("<td>" + gender + "</td>");
// 			out.println("</tr>");

			// 스크립틀릿 사이에 HTML 태그를 출력할 경우
		%>
			<!-- 이 부분은 HTML 태그 작성이 가능하며 while 문 내부이므로 반복됨 -->
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=age %></td>
				<td><%=gender %></td>
			</tr>
		<%
		}
		%>			
	</table>
</body>
</html>















