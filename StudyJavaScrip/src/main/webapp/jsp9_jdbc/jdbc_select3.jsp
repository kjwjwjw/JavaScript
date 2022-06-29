<%@page import="jsp9_jdbc.JdbcUtil"%>
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
	<!-- 조회된 테이블 정보를 table 태그를 사용하여 표시하기 위해 테이블 생성 -->
	<!-- while 문을 사용하여 ResultSet 객체를 반복하기 전 제목열 까지는 직접 생성하고, 데이터만 반복 -->
	<table border="1">
		<!-- 제목을 표시하기 위한 행(tr) 생성 -->
		<tr>
			<th width="100">이름</th>
			<th width="100">ID</th>
			<th width="100">비밀번호</th>
<!-- 			<th width="150">주민번호</th> -->
			<th width="150">E-Mail</th>
<!-- 			<th width="100">직업</th> -->
<!-- 			<th width="100">성별</th> -->
<!-- 			<th width="150">취미</th> -->
<!-- 			<th width="150">가입동기</th> -->
			<th></th>
		</tr>
	<%
	// 1, 2단계 작업을 대신 수행해주는 JdbcUtil 클래스의 getConnection() 메서드를 호출하여
	// 드라이버 로드, DB 접속을 수행한 후 Connection 타입 객체를 리턴받아 변수에 저장하기
	// => jsp9_jdbc 패키지의 JdbcUtil 클래스 인스턴스 생성한 후 getConnection() 메서드 호출
	JdbcUtil jdbcUtil = new JdbcUtil();
	Connection con = jdbcUtil.getConnection();
	
	String sql = "SELECT * FROM test4";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("passwd") %></td>
<%-- 			<td><%=rs.getString("jumin") %></td> --%>
			<td><%=rs.getString("email") %></td>
<%-- 			<td><%=rs.getString("job") %></td> --%>
<%-- 			<td><%=rs.getString("gender") %></td> --%>
<%-- 			<td><%=rs.getString("hobby") %></td> --%>
<%-- 			<td><%=rs.getString("reason") %></td> --%>
			<td>
				<!-- 상세정보 버튼 클릭 시 jdbc_select3_detail.jsp 페이지로 이동(URL 에 id 파라미터 전달) -->
				<input type="button" value="상세정보" onclick="location.href='jdbc_select3_detail.jsp?id=<%=rs.getString("id") %>'">
				<!-- 삭제 버튼 클릭 시 jdbc_delete_pro2 페이지로 이동(URL 에 id 파라미터 전달) -->
				<input type="button" value="삭제" onclick="location.href='jdbc_delete_pro2.jsp?id=<%=rs.getString("id") %>'">
			</td>
		</tr>
	<%	
	}
	%>
	</table>
</body>
</html>














