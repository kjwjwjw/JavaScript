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
	// jdbc_insert_form2_join.jsp 페이지에서 입력받은 폼 파라미터 값을 변수에 저장
	// 한글 처리 필수
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// 주민번호와 이메일의 경우 두 파라미터 결합 필요
	String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	
	// 주의! 체크박스 등을 통해 동일한 이름으로 복수개의 파라미터가 전달될 경우
	// request.getParameter() 가 아닌 request.getParameterValues() 메서드를 통해 배열로 전달받아야함
// 	String hobby = request.getParameter("hobby"); // 첫번째 항목만 전달받게 됨
	String[] arrHobby = request.getParameterValues("hobby");
	String hobby = "";
	// for문을 사용하여 arrHobby 배열에 차례대로 접근하여 저장되어 있는 데이터를 hobby 변수에 결합
	// => 주의! 체크박스 체크 항목이 하나도 체크되지 않은 경우 null 값이 전달되므로 반복문 사용 불가(오류 발생)
	// => 따라서, 배열이 null 이 아닐 때만 반복을 수행하도록 조건문 사용
	if(arrHobby != null) {
// 		for(int i = 0; i < arrHobby.length; i++) {
// 			hobby += arrHobby[i] + "/";
// 		}
		
		for(String item : arrHobby) {
			hobby += item + "/";
		}
	} 
	
	String reason = request.getParameter("reason");
	%>
<%-- 	<h3>이름 : <%=name %></h3> --%>
<%-- 	<h3>ID : <%=id %></h3> --%>
<%-- 	<h3>패스워드 : <%=passwd %></h3> --%>
<%-- 	<h3>주민번호 : <%=jumin %></h3> --%>
<%-- 	<h3>E-Mail : <%=email %></h3> --%>
<%-- 	<h3>직업 : <%=job %></h3> --%>
<%-- 	<h3>성별 : <%=gender %></h3> --%>
<%-- 	<h3>취미 : <%=hobby %></h3> --%>
<%-- 	<h3>가입동기 : <%=reason %></h3>		 --%>

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
	String sql = "INSERT INTO test4 VALUES (?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, passwd);
	pstmt.setString(4, jumin);
	pstmt.setString(5, email);
	pstmt.setString(6, job);
	pstmt.setString(7, gender);
	pstmt.setString(8, hobby);
	pstmt.setString(9, reason);

	
	// 4단계. SQL 구문 실행 및 결과 처리
	int insertCount = pstmt.executeUpdate();
	
	if(insertCount > 0) { // INSERT 성공 시
		out.println("회원 추가 성공!");
	} else { // INSERT 실패 시
		out.println("회원 추가 실패!");
	}
	%>
</body>
</html>















