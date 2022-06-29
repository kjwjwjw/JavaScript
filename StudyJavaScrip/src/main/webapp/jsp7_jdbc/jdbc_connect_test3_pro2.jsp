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
	// 번호(idx), 아이디(id), 패스워드(passwd) 파라미터 가져와서 출력
// 	String idx = request.getParameter("idx");
	// String 타입 데이터를 int 타입으로 변환해야하는 경우
	// Integer.parseInt(문자열데이터);
	// => 지정된 문자열데이터를 int 타입으로 변환하여 리턴해줌
	// => 주의! 문자열이 정수 형태가 아닐 경우 오류 발생!
	int idx = Integer.parseInt(request.getParameter("idx"));
	String id = request.getParameter("id");
	String passwd =request.getParameter("passwd");
	
	// 1단계, 2단계 작업을 통해 MySQL 연결
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계
	Class.forName(driver);
	// 2단계
	Connection con = DriverManager.getConnection(url, user, password);
	out.println("<h3>DB 연결 완료!</h3>");
	
	// 3단계. SQL 구문 작성 및 전달
	// => 주의! 문자 데이터는 반드시 작은따옴표('')로 둘러싸야한다!
	//    ex) INSERT INTO test2 VALUES (1,'admin','1234');
	//    ex) INSERT INTO test2(idx,id,passwd) VALUES (1,'admin','1234');
// 	String sql = "INSERT INTO test2 VALUES (" + idx + ",'" + id + "','" + passwd + "')";
// 	PreparedStatement pstmt = con.prepareStatement(sql);

	// ------------------------------------------------------------------------------------------
	// SQL 구문을 사용하여 외부로부터 입력받은 데이터를 처리할 때
	// SQL 구문에 전달되는 데이터를 조작하여 개발자가 의도하지 않은 구문을 실행하도록 할 수 있다.
	// 이러한 공격 기법을 SQL 삽입 공격(Injection Attack) 이라고 한다.
	// => 이를, 예방하기 위해서는 전달되는 데이터에 대한 검증을 수행하여
	//    올바른 데이터인지 판별하고, SQL 구문에 직접적인 결합이 불가능하도록 해야함
	// => PreparedStatement 객체를 사용하고, 파라미터 대신 만능문자(?)를 사용하여
	//    데이터가 위치할 공간을 표시한 후, 차후에 별도로 데이터를 검증 후 전달해야함
	// 1) SQL 구문 작성할 때 데이터가 위치할 공간을 만능문자(?) 만으로 표시(실제 데이터 전달 X)
	//    => 문자 데이터를 표시할 때에도 작은따옴표('') 없이 만능문자만으로 표시
	String sql = "INSERT INTO test2 VALUES(?,?,?)";
	// 2) Connection 객체를 통해 SQL 구문을 전달하여 PreparedStatement 객체 리턴받기(기존과 동일)
	PreparedStatement pstmt = con.prepareStatement(sql);
	// 3) PreparedStatement 객체의 setXXX() 메서드를 호출하여 만능문자 부분에 데이터 교체
	//    => setXXX() 메서드의 XXX 은 전달할 데이터의 자바 데이터타입명 명시
	//       ex) idx 컬럼의데이터타입은 int, 자바 데이터타입도 int 이므로 setInt() 메서드 호출
	//    기본 문법 : void setInt(int parameterIndex, int x)
	//    => 첫번째 파라미터(int parameterIndex) : 만능문자(?)의 순서번호(1부터 시작)
	pstmt.setInt(1, idx); // 1번 만능문자(?)를 정수형 변수 idx 값으로 교체
	// 주의사항! 만능문자(파라미터) 갯수에 맞게 setXXX() 메서드로 데이터를 설정하지 않으면 오류 발생
	// => java.sql.SQLException: No value specified for parameter 2
	//    (2번 파라미터(만능문자)에 값이 없다!)
	pstmt.setString(2, id); // 2번 만능문자를 String 타입 변수 id 값으로 교체
	pstmt.setString(3, passwd);
	// ------------------------------------------------------------------------------------------
	// 4단계. SQL 구문 실행 및 결과 처리
	int insertCount = pstmt.executeUpdate();
	out.println("<h3>추가 완료</h3>");
	%>
	
</body>
</html>






















