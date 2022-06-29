<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	${param.id } 님 비밀번호는
	${param.passwd }입니다.
	
	<c:if test="${param.id eq 'admin' }">
			<h3>관리자님, 반갑습니다!</h3>
	</c:if>
	
	<c:if test="${param.id != 'admin' }">
			<h3>${param.id}님 , 반갑습니다!</h3>
	</c:if>
	

</body>
</html>