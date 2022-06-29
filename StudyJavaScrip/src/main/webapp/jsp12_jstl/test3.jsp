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
	<h1>JSTL - test3.jsp</h1>
	<!-- JSTL 에서의 반복문(c:forEach, c:forTokens) -->
	<%-- 
	c:forEach 문은 일반 for문과 향상된 for문 모두 적용 가능
	1) 일반 for문처럼 사용 시 
	   <c:forEach var="변수명" begin="시작값" end="종료값" step="증감값">
	   
	   </c:forEach>
	--%>
	<c:forEach var="value" begin="1" end="10" step="2">
		<%-- var 속성으로 지정한 변수(value)에 begin 부터 end 까지 step 씩 증가하는 값이 저장됨 --%>
		<h3>value 변수값 : ${value }</h3>
	</c:forEach>
	<hr>
	<%-- --------------------------------------------------------------------- --%>
	<%
	String[] names = {"홍길동", "이순신", "강감찬"};
	
	// 자바의 향상된 for문을 사용하여 names 배열의 각 요소를 name 변수에 저장 후 출력 반복
	// for(데이터 객체로부터 꺼내서 저장할 변수 선언 : 데이터가 저장된 객체) {}
	for(String name : names) {
		%>
		<h3><%=name %></h3>
		<%
		// 또는 out.println("<h3>" + name + "</h3>"); 활용 가능
	}
	%>
	<hr>
	<%
	// 위에서 선언한 배열을 JSTL 을 통해 접근하기 위해 pageContext 객체에 저장
	pageContext.setAttribute("names", names);
	%>
	<%-- c:forEach 태그를 통해 names 배열에 접근(c:forEach var="변수명 items=${객체명}) --%>
	<c:forEach var="name" items="${names }">
		<h3>${name }</h3>
	</c:forEach>
</body>
</html>












