
<%@page import="ajax.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h1>test3_result.jsp</h1>
	
<%
  String id=request.getParameter("id");
  String passwd = request.getParameter("passwd");
  
  MemberDAO member = new MemberDAO();
  boolean isLoginSuccess = member.login(id, passwd);
  
  
  if(isLoginSuccess) {%> 
	 <script>
	 alert("로그인 성공");
	 </script>
	  
 	<% } else {
 		%>
 		<script>
 		alert("로그인 실패!");
		</script>
 		
 <% } %>

</body>
</html>