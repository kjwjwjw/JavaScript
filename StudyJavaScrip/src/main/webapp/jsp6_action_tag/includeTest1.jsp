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
	2. include 액션태그
	- 현재 페이지에 특정 페이지를 포함(include) 시키는 용도의 액션 태그
	- 포함시키는 페이지로 제어권이 넘어간 후 해당 패키지의 작업이 끝나면
	  다시 원래의 페이지로 제어권이 돌아옴
	- 이 때, forward 액션태그와 마찬가지로 include 되는 페이지에 파라미터를 전달하려면
	  jsp:param 액션태그를 사용하여 전달 가능
	  
	< 기본 문법 >
	<jsp:include page="요청할 페이지" />
	또는 
	<jsp:include page="요청할 페이지">
		<jsp:param ... />
	</jsp:include>
	--%>
	<%request.setCharacterEncoding("UTF-8"); %>
	
	<h1>includeTest1.jsp - 액션태그(include)</h1>
	<!-- includeTest2.jsp 페이지로 제어권이 이동, 해당 페이지 처리 결과값을 현재 위치에 포함시킴 -->
	<jsp:include page="includeTest2.jsp">
		<jsp:param name="param" value="홍길동"/>
	</jsp:include>
</body>
</html>





















