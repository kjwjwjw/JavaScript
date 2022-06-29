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
			<th width="150">학번</th>
			<th width="150">이름</th>
			<th width="100">나이</th>
			<th width="100">성별</th>
		</tr>
	<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT * FROM test3";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getInt("no") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getInt("age") %></td>
			<td><%=rs.getString("gender") %></td>
		</tr>
	<%	
	}
	%>
	</table>
</body>
</html>














