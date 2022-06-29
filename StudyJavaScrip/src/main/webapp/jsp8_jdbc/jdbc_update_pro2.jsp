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
		
// 	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd"); // 기존 패스워드
	String newPasswd = request.getParameter("newPasswd"); // 변경할 새 패스워드(값이 없을 수도 있음)
	// 주민번호와 이메일의 경우 두 파라미터 결합 필요
// 	String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	
	String[] arrHobby = request.getParameterValues("hobby");
	String hobby = "";
	if(arrHobby != null) {
		for(String item : arrHobby) {
			hobby += item + "/";
		}
	} 
		
	String reason = request.getParameter("reason");
	%>
<%-- 	<h3>이름 : <%=name %></h3> --%>
	<h3>ID : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>변경할 패스워드 : <%=newPasswd %></h3>
<%-- 		<h3>주민번호 : <%=jumin %></h3> --%>
	<h3>E-Mail : <%=email %></h3>
	<h3>직업 : <%=job %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>취미 : <%=hobby %></h3>
	<h3>가입동기 : <%=reason %></h3>	
	
	<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	// id 가 일치하는 레코드의 패스워드, E-Mail, 직업, 성별, 취미, 가입동기를 모두 수정하기 = UPDATE
	// => 패스워드도 검사해야하므로 id 와 passwd 가 모두 일치하는 레코드를 수정해야함
	// => 단, newPasswd 값이 널스트링("")일 경우 패스워드는 변경하지 않도록 해야함(if문을 통해 서로 다른 작업 수행 필요)
// 	if(newPasswd.equals("")) {
// 		String sql = "UPDATE test4 SET email=?,job=?,gender=?,hobby=?,reason=? WHERE id=? AND passwd=?";
// 		PreparedStatement pstmt = con.prepareStatement(sql);
// 		pstmt.setString(1, email);
// 		pstmt.setString(2, job);
// 		pstmt.setString(3, gender);
// 		pstmt.setString(4, hobby);
// 		pstmt.setString(5, reason);
// 		pstmt.setString(6, id);
// 		pstmt.setString(7, passwd);
		
// 		int updateCount = pstmt.executeUpdate();
// 	} else {
// 		String sql = "UPDATE test4 SET passwd=?,email=?,job=?,gender=?,hobby=?,reason=? WHERE id=? AND passwd=?";
// 		PreparedStatement pstmt = con.prepareStatement(sql);
// 		pstmt.setString(1, newPasswd); // 변경해야하는 새 패스워드
// 		pstmt.setString(2, email);
// 		pstmt.setString(3, job);
// 		pstmt.setString(4, gender);
// 		pstmt.setString(5, hobby);
// 		pstmt.setString(6, reason);
// 		pstmt.setString(7, id);
// 		pstmt.setString(8, passwd);
		
// 		int updateCount = pstmt.executeUpdate();
// 	}
	
	// 새 패스워드 존재 유무에 따라 UPDATE 항목에 passwd 변경 문자열을 추가할지 말지 결정 => 삼항연자를 통해 문자열 추가 선택 가능
	String sql = "UPDATE test4 SET email=?,job=?,gender=?,hobby=?,reason=?" + 
				(newPasswd.equals("") ? "" : ",passwd=?") +  
				" WHERE id=? AND passwd=?";
	
// 	out.println(sql);
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, email);
	pstmt.setString(2, job);
	pstmt.setString(3, gender);
	pstmt.setString(4, hobby);
	pstmt.setString(5, reason);
	// 새 패스워드가 있을 경우와 없을 경우 다른 파라미터 순서로 전달해야함
	if(newPasswd.equals("")) { // 새 패스워드가 없을 경우 패스워드를 제외한 나머지 파라미터 지정
		pstmt.setString(6, id);
		pstmt.setString(7, passwd);		
	} else { // 새 패스워드가 있을 경우 새 패스워드를 포함하여 파라미터 지정
		pstmt.setString(6, newPasswd); // 변경할 새 패스워드 전달
		pstmt.setString(7, id);
		pstmt.setString(8, passwd);
	}
	
	int updateCount = pstmt.executeUpdate();
	
	if(updateCount > 0) { // 수정 성공
		%>
		<script type="text/javascript">
			alert("정보 수정 성공!");
			// jdbc_select3_detail.jsp 로 이동 => id 파라미터 전달
			location.href = "jdbc_select3_detail.jsp?id=<%=id%>";
		</script>
		<%
	} else { // 수정 실패
		%>
		<script type="text/javascript">
			// "수정 권한이 없습니다!" alert 창에 표시
			alert("수정 권한이 없습니다!");
			// 이전 페이지로 돌아가기
			history.back();
		</script>
		<%
	}
	%>	
</body>
</html>












