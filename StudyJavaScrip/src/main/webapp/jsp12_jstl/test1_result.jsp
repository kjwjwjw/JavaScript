<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	EL(Expression Language)
	- JSP 스크립트 태그(표현식 <%= %>) 대신 사용되는 데이터 처리 표현 방식(= 언어)
	- ${데이터} 형식으로 데이터를 표현
	  ex) test 라는 변수값을 EL 로 표현할 경우 ${test}
	- JSP 스크립트 태그는 다른 태그와 혼동을 가져올 수 있으나, EL 은 이러한 단점을 보완
	- 변수값만 사용 가능한 것이 아니라 제공되는 내장객체 및 연산자도 활용 가능
	  ex) 이전 페이지로부터 전달받은 파라미터값에 접근 : ${param.파라미터명}
	- 내장객체 : param(단일 파라미터), paramValues(복수 파라미터 = 배열),
	             pageScope, requestScope, sessionScope, applicationScope 등의 영역 관련 객체 등
	- EL 문법은 기본적으로 지정된 데이터로 파싱(변환)되는데
	  자동으로 파싱되지 않도록(= 데이터로 취급되지 않고, 문자 텍스트로 취급되도록) 하려면
	  $ 기호 앞에 \ 기호를 붙여서 표현할 경우 단순 텍스트로 취급됨
	  ex) ${name} 의 경우 name 변수를 표현하지만, \${name} 은 ${name} 이라는 텍스트로 사용됨
	  
	--%>
	<h3>이름(request 객체 활용) : <%=request.getParameter("name") %></h3>
	<!-- request.getParameter() 대신 param.파라미터명 으로 지정 가능 -->
	<h3>이름(EL 활용) : ${param.name }</h3>
	<hr>
	<h3>세션 객체의 testValue 속성값(request 객체 활용) : <%=session.getAttribute("testValue") %></h3>
	<!-- session.getAttribute() 대신 sessionScope.속성명 으로 지정 가능 -->
	<h3>세션 객체의 testValue 속성값(EL 활용) : ${sessionScope.testValue }</h3>
	<hr>
	<!-- EL 문법을 텍스트로 취급해야할 경우 -->
	<h3>\${param.name } : ${param.name }</h3>
	<h3>\${sessionScope.testValue } : ${sessionScope.testValue }</h3>
	<hr>
	<!-- EL 에서의 연산자 사용 -->
	<h3>\${10 + 20 } = ${10 + 20 }</h3>
	<h3>\${20 / 2 } = ${20 / 2 }</h3>
<%-- 	<h3>\${20 div 2 } = ${20 div 2 }</h3> <!-- / 연산자 대신 div 키워드 사용 가능하나 잘 사용 X --> --%>
	<h3>\${10 >= 20 } = ${10 >= 20 }</h3>
	<h3>\${10 ge 20 } = ${10 ge 20 }</h3> <!-- 10 >= 20 과 동일 -->
	<h3>\${20 == 20 } = ${20 == 20 }</h3>
	<h3>\${20 eq 20 } = ${20 eq 20 }</h3> <!-- 20 == 20 과 동일 -->
</body>
</html>















