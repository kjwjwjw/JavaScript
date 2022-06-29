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
	// jdbc_select3.jsp 페이지에서 전달받은 id 파라미터 값을 변수에 저장
	// 한글 처리 필수
	request.setCharacterEncoding("UTF-8");
	
	// 전달받은 id 에 해당하는 레코드 삭제 후 jdbc_select3.jsp 페이지로 이동(단, 삭제 후 "삭제 완료!" 메세지 출력 후 이동)
	String id = request.getParameter("id");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	// id 가 일치하는 레코드 삭제하기 = DELETE
	String sql = "DELETE FROM test4 WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	int deleteCount = pstmt.executeUpdate();
	
	if(deleteCount > 0) { // 삭제 성공
		%>
		<script type="text/javascript">
			alert("삭제 성공!");
			// jdbc_select3.jsp 로 이동
			location.href = "jdbc_select3.jsp";
		</script>
		<%
	} else { // 삭제 실패
		%>
		<script type="text/javascript">
			alert("삭제 실패!");
			history.back();
		</script>
		<%
	}
	%>	
</body>
</html>












