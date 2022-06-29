<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest1.jsp</h1>
	<!-- 
	session 객체
	- javax.servlet.http.HttpSession 객체를 사용하여 세션 정보를 관리하는 내장 객체
	- 클라이언트와 서버 사이의 연결 정보에 대한 역할을 수행하는 객체
	- 주로, 페이지와 관계없이 접속 정보 등의 클라이언트에 대한 정보를 유지하기 위해 사용
	  ex) 로그인 후 로그인 한 사용자 정보를 기억하여 페이지를 이동해도 로그인이 유지되도록 함
	      장바구니에 상품을 담았을 때 해당 장바구니 정보가 유지되도록 함
	- 클라이언트(웹브라우저)가 서버에 접속 시 기본적으로 해당 클라이언트에 대한 
	  기억장소(= 세션)이 생성되고 자동으로 아이디(= 세션ID) 값이 부여됨
	- 세션은 유지 시간이 존재하며, maxInactiveInterval 변수에 지정된 값만큼 세션 정보가 유지되고
	  유지 시간 동안 아무런 동작이 없을 경우 시간이 만료되어 세션 정보가 사라짐
	  => 기본 유지 시간(타이머 값)은 1800초(= 30분)로 설정되어 있음(변경도 가능)
	  
	[ 세션 정보 제거 방법 ]
	1. 세션 타이머가 만료될 경우
	2. 세션 타이머와 관계없이 invalidate() 메서드를 호출하면 세션이 초기화        
	3. 웹브라우저를 종료하면 세션이 초기화(동일한 웹브라우저 여러 개 실행 시 모두 종료할 경우)
	-->
	
	<!-- getId() : 자동으로 생성되는 세션 ID 를 가져오기 -->
	<h3>세션 ID : <%=session.getId() %></h3>
	<!-- 웹브라우저 종류가 다르면 아이디도 다르며, 접속 위치가 달라도 아이디가 다름 -->
	
	<h3>새 세션 여부 : <%=session.isNew() %></h3>
	
	<h3>세션 생성 시각 : <%=new Date(session.getCreationTime()) %></h3>
	<h3>세션 최근 접속 시각 : <%=new Date(session.getLastAccessedTime()) %></h3>
	
	<h3>세션 유지 시간 : <%=session.getMaxInactiveInterval() %> 초</h3>
	
	<!-- 세션 유지 시간을 기본값(1800초 = 30분)에서 1시간(= 3600초)으로 변경 -->
<%-- 	<%session.setMaxInactiveInterval(3600); %> --%>
	<!-- 단, 시간을 직접 입력하기 보단, 기초 단위부터 차례대로 계산과정을 명시하면 유지보수가 편리함 -->
<%-- 	<%session.setMaxInactiveInterval(60 * 60); // 1시간(= 60초 * 60분) %> --%>
		<%session.setMaxInactiveInterval(60 * 60 * 5); // 5시간(= 60초 * 60분 * 5시간) %>
	<h3>세션 유지 시간을 1시간으로 변경 후 : <%=session.getMaxInactiveInterval() %> 초</h3>
	
	<!-- 만약, 세션 타이머를 10초로 변경 시 서버와 10초간 통신이 없을 경우 세션 제거됨 -->
<%-- 	<%session.setMaxInactiveInterval(10); // 세션 타이머를 10초로 변경 %> --%>
	
	<hr>
	<h1>세션값 전체 삭제(초기화)</h1>
	<%session.invalidate(); %>
	<!-- 세션 정보를 완전히 초기화 한 후에는 세션 객체를 사용한 값들에 접근 불가(세션 객체 없음) -->
	<!-- 새로운 페이지를 접속하는 등 새로운 세션을 생성해야만 접근 가능해짐 -->
</body>
</html>














