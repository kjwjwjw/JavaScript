<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
JSTL(JSP Standard Tag Library)
- JSP 에서 사용 가능한 커스텀 태그 라이브러리
- JSTL 을 사용하려면 라이브러리 다운로드 및 Build path 추가 필요
  또한, JSP 파일 내에서 라이브러리를 사용하기 위한 선언문 작성 필요
  => 라이브러리 등록 방법 : <%@ taglib %> 디렉티브 활용
     - prefix 와 uri 속성을 설정해야함
       prefix : 태그에서 사용할 문구(접두어)이며, 주로 c 사용(core 약자)
       url : 태그 라이브러리가 존재하는 위치(오타 발생 시 오류)
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String strMsg = "Hello, World!";
// 자바 문법으로 생성한 일반 변수를 같은 페이지에서 JSTL(EL)을 통해 접근해야할 경우
// 내장 객체인 pageContext 객체에 저장한 뒤 사용 가능
pageContext.setAttribute("strMsg", strMsg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test2.jsp</h1>
	<!-- 
	JSTL 태그는 반드시 시작&끝 태그로 이루어져야하며 
	태그 사이에 다른 항목이 없을 경우 끝태그 대신 <시작태그 /> 로 축약 가능-->
<%-- 	<c:set></c:set> --%>
	<c:set var="msg" value="Hello, World!" />
	<!-- EL 을 사용하여 c:set 태그로 지정한 변수값에 접근 -->
	c:set 태그로 생성한 변수 msg : ${msg }<br>
	<!-- c:out 태그를 사용하여 출력문 역할 수행 가능 -->
<%-- 	c:out 태그로 변수 msg 출력 : <c:out value="msg"/><!-- 주의! msg 가 문자열로 취급됨 --><br> --%>
	c:out 태그로 변수 msg 출력 : <c:out value="${msg }"/><!-- msg 가 변수로 취급됨 --><br>
	<!-- 
	자바 문법을 통해 생성된 변수(객체 포함)에 접근하려면 
	접근 전 pageContext.setAttribute() 메서드를 통해 page 객체에 저장해 놓아야 함
	=> 그렇지 않을 경우 해당 변수 접근 코드는 무시됨(출력되지 않음)
	-->
	자바 문법으로 생성한 변수 strMsg : ${strMsg }<br>
	c:out 태그로 자바 변수 strMsg 출력 : <c:out value="${strMsg }"/><br>
	c:out 태그로 자바 변수 strMsg 출력 : <c:out value="<%=strMsg %>"/><br> <!-- 기존 JSP 변수 접근 방법 -->
	<hr>
	<!-- c:set 태그로 변수 num 선언 및 10 으로 초기화(정수 등의 데이터도 "" 로 지정) -->
	<c:set var="num" value="10" />
	<!-- EL 을 통해 연산 과정에서 자동으로 해당 타입 데이터로 처리됨 -->
<%-- 	<h3>num + 10 = ${num + 10 } </h3>  --%>

	<!-- if문에 해당하는 커스텀 태그 c:if (c:if text="조건식") -->
	<!-- 변수 num 값이 0보다 큰지 판별 -->
	<c:if test="${num > 0}"> <!-- 주의! 조건식도 EL 문법 사용 -->
		<!-- if문과 마찬가지로 조건식 판별 결과가 true 일 경우에만 태그 사이의 문장 실행 -->
		<h3>num 이 0보다 크다!</h3>
	</c:if>
	<!-- c:if 태그는 단일 if문과 동일하므로 아닐 때(false)의 조건 설정이 불가 -->
	
	<hr>
	<!-- 
	if ~ else if ~ else 문에 해당하는 커스텀 태그 c:choose, c:when, c:otherwise
	1) c:choose 태그 : 조건 판별을 시작하겠다는 선언(조건 설정 하지 않음)
	2) c:when 태그 : 조건식을 기술(복수개 태그 사용하여 복수개의 조건 설정 가능, if 와 else if)
	3) c:otherwise 태그 : 조건식이 일치하지 않을 경우(= else 문과 동일)
	-->
	<!-- 변수 name 선언 및 임의의 이름을 저장 -->
	<c:set var="name" value=""/>
	<!-- 변수 name 에 저장된 이름이 "홍길동" or "이순신" or 나머지 인지 판별 -->
	<!-- 주의! 태그 사이에 HTML 주석 사용 시 오류 발생하므로 JSP 주석 사용해야함 -->
	<c:choose> <%-- 조건 판별을 시작하겠다는 선언 --%>
		<%-- 실제 조건식은 c:when 태그로 지정 --%>
		<c:when test="${name eq '홍길동' }"> <%-- name == '홍길동' 과 동일 --%>
			<h3>홍길동 입니다!</h3>
		</c:when>
		<c:when test="${name eq '이순신' }"> <%-- name == '이순신' 과 동일 --%>
			<h3>이순신 입니다!</h3>
		</c:when>
		<%-- ------------------------------------------------------------- --%>
		<%-- 만약, name 변수 값이 입력되지 않았을 경우 --%>
		<c:when test="${empty name}"> <%-- name == '' 과 동일 --%>
			<h3>이름 입력 필수!</h3>
		</c:when>
		<%-- ------------------------------------------------------------- --%>
		<%-- else 문에 해당하는 otherwise 로 조건이 일치하지 않을 경우 실행할 문장 지정 --%>
		<c:otherwise> 
			<h3>그 외 나머지 입니다!</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>
















