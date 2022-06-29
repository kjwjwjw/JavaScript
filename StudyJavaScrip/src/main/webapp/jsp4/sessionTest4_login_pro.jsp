<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionTest4_login_pro.jsp - 로그인 처리</h1>
	<%
	// 폼 파라미터로 전달받은 아이디, 패스워드 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
	<!-- 
	아이디가 "admin" 이고, 패스워드가 "1234" 일 경우 현재 웹페이지에 "로그인 성공!" 출력하고,
	세션 객체에 "sId" 라는 속성명으로 아이디를 저장한 후 sessionTest4_login_main.jsp 페이지로 이동
	아니면, 자바스크립트를 사용하여 "로그인 실패!" 출력 후 이전페이지로 돌아가기
	=> 주의! 자바코드에서 문자열 비교 시 동등비교연산자(==) 보다 equals() 메서드 사용을 권장!
	   원본문자열.equals(비교할문자열) => 결과값이 boolean 타입으로 리턴됨
	-->
	<%if(id.equals("admin") && passwd.equals("1234")) { %>
		<%-- 아이디와 패스워드가 일치할 경우(= 로그인 성공일 경우) --%>
		<h3>로그인 성공!</h3>
		<%
		session.setAttribute("sId", id);
		response.sendRedirect("sessionTest4_login_main.jsp");
		%>
	<%} else { %>
		<%-- 아이디 또는 패스워드가 일치하지 않을 경우(= 로그인 실패일 경우) --%>
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
	<%} %>
</body>
</html>














