<%@page import="java.sql.DriverManager"%>
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
	/*
	[ JDBC 를 활용한 MySQL 연동(사용) 방법 - 4단계 ]
	1단계. JDBC 드라이버 로드
     - java.lang 패키지의 Class 클래스의 static 메서드 forName() 호출하여 
       드라이버 클래스가 위치한 패키지명과 클래스명을 문자열로 전달
     - com.mysql.jdbc 패키지 내의 Driver.class 파일을 지정해야함
       => "com.mysql.jdbc.Driver" 형식으로 지정(주의! .class 생략)

     < 문법 >
     Class.forName("드라이버클래스");
     ex) Class.forName("com.mysql.jdbc.Driver");
     => 주의! 드라이버 클래스 위치 또는 파일명이 틀렸을 경우(= 파일이 없을 경우) 오류 발생
        java.lang.ClassNotFoundException: com.mysql.jdbc.Drive
        => com.mysql.jdbc.Drive 클래스를 찾지 못해서 발생한 오류라는 의미
	*/
	Class.forName("com.mysql.jdbc.Driver");
	%>
	<h1>드라이버 로드 성공!</h1>
	<hr>
	
	<%
	/*
	2단계. DB 연결(접속)
	  - java.sql 패키지의 DriverManager 클래스의 static 메서드인 getConnection() 호출
	  - 파라미터로 DB접속 URL, 계정명, 패스워드를 전달(문자열)
	  
	  < URL 형식 >
	  "jdbc:mysql://접속할주소:포트번호/DB명"
	  ex) "jdbc:mysql://localhost:3306/study_jsp3"

	  < 문법 >
	  DriverManager.getConnection("URL", "계정명", "패스워드");
	  => 주의! 반드시 DriverManager 클래스는 자동 완성을 통해
	     java.sql 패키지가 import 될 수 있도록 해야함
	*/
	DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp3", "root", "1234");
	%>
	<h1>DB 연결 성공!</h1>
	
	<!-- 2단계까지가 데이터베이스 제품별로 달라지는 부분 -->
	<!-- 3단계부터 실제 데이터베이스에서 SQL 구문(쿼리)을 사용한 작업을 수행하는 부분(= 공통) -->
</body>
</html>














