<%@page import="jsp9_jdbc.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 상세정보</h1>
	<!-- http://localhost:8080/StudyJSP/jsp8_jdbc/jdbc_select3_detail.jsp?id=hong -->
	
	<%
	// URL 로 전달받은 파라미터값 가져오기
	String id = request.getParameter("id");
	

	JdbcUtil jdbcUtil = new JdbcUtil();
	Connection con = jdbcUtil.getConnection();
	
	
	String sql = "SELECT * FROM test4 WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	// SELECT 구문 실행 결과를 전달받을 ResultSet 타입 변수 선언 및 executeQuery() 메서드 실행 결과 리턴받기
	ResultSet rs = pstmt.executeQuery();
	
// 	while(rs.next()) {} // 단, 조회되는 레코드가 한 개 일 경우 while 대신 if 문 사용도 가능
	if(rs.next()) {
		String name = rs.getString("name");
// 		String id = rs.getString("id"); // 이미 파라미터로 전달받아 저장되어 있음
		String passwd = rs.getString("passwd");
		String jumin = rs.getString("jumin");
		String email = rs.getString("email");
		String job = rs.getString("job");
		String gender = rs.getString("gender");
		String hobby = rs.getString("hobby");
		String reason = rs.getString("reason");
		
		
		// 이메일 주소를 계정과 도메인으로 분리시키려면 "@" 기호를 기준으로 양쪽의 문자열에 대한 분리 필요
		// => String 클래스의 split() 메서드 필요(메서드 파라미터로 분리에 사용될 문자 지정(= 구분자 = Delimeter 라고 함))
		// => 주의! 분리된 문자열들은 복수개의 문자열이 되므로 String[] 타입으로 모든 문자열이 관리됨
		String[] arrEmail = email.split("@");
		
	%>
		<form action="jdbc_update_pro2.jsp" name="fr" onsubmit="return checkForm()">
			<input type="hidden" name="id" value="<%=id %>">
			<table border="1">
				<tr><td>이름</td><td><!-- 이름 데이터 표시할 곳 --><%=name %></td></tr>
				<tr>
					<td>ID</td>
					<td><!-- 아이디 데이터 표시할 곳 --><%=id %></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" placeholder="기존 비밀번호 입력" required="required"></td>
				</tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td><input type="password" name="newPasswd" placeholder="새 비밀번호 입력"></td>
				</tr>
				<tr>
					<td>주민번호</td><td><%=jumin%><!-- 주민번호 표시할 곳 --></td>
				</tr>
				<tr>
					<td>E-Mail</td>
					<td>
						<!-- @ 기호를 기준으로 분리된 arrEmail 배열의 0번 인덱스에 계정, 1번 인덱스에 도메인이 저장되어 있음 -->
						<input type="text" name="email1" required="required" value="<%=arrEmail[0]%>">@
						<input type="text" name="email2" required="required" value="<%=arrEmail[1]%>">
						<select name="emailDomain" onchange="selectDomain(this.value)">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="job" required="required">
							<!-- 존재하는 값에만 selected="selected" 속성이 실행되도록 if문 사용 필요 -->
							<option value="개발자" <%if(job.equals("개발자")) {%> selected="selected" <%} %>>개발자</option>
							<option value="DB엔지니어" <%if(job.equals("DB엔지니어")) {%> selected="selected" <%} %>>DB엔지니어</option>
							<option value="관리자" <%if(job.equals("관리자")) {%> selected="selected" <%} %>>관리자</option>
							<option value="기타" <%if(job.equals("기타")) {%> selected="selected" <%} %>>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="남" <%if(gender.equals("남")) {%> checked="checked" <%} %>>남
						<input type="radio" name="gender" value="여" <%if(gender.equals("여")) {%> checked="checked" <%} %>>여
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<!-- 복수개의 취미 항목이 하나의 문자열로 연결되어 있으므로, 특정 항목이 포함되었는지 판별 = contains() 메서드 활용 -->
						<!-- 문자열.contains("찾을 문자열") => boolean 타입 결과가 리턴됨 -->
						<input type="checkbox" name="hobby" value="여행" <%if(hobby.contains("여행")) {%> checked="checked" <%} %>>여행
						<input type="checkbox" name="hobby" value="독서" <%if(hobby.contains("독서")) {%> checked="checked" <%} %>>독서
						<input type="checkbox" name="hobby" value="게임" <%if(hobby.contains("게임")) {%> checked="checked" <%} %>>게임
						<!-- 전체선택 체크박스 클릭 시 체크 상태(true, false)를 함수에 전달(함수 이름과 name 속성 다르게!) -->
						<input type="checkbox" name="check_all" value="전체선택" 
											onclick="checkAll(this.checked)">전체선택
					</td>
				</tr>
				<tr>
					<td>가입동기</td>
					<td><textarea name="reason" cols="40" rows="10"><%=reason %></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="정보수정">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	<%} else { %>
		<!-- 전달받은 id 가 존재하지 않을 경우 자바스크립트를 사용하여 오류 메세지 출력 및 이전 페이지로 돌아가기 -->
		<script type="text/javascript">
			// "존재하지 않는 아이디입니다" alert 창에 표시
			alert("존재하지 않는 아이디입니다!");
			// 이전 페이지로 돌아가기
			history.back();
		</script>
	<%} %>
</body>
</html>













