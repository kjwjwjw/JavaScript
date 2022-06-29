<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_get.jsp</h1>
	<!-- sessionTest2_set.jsp 페이지에서 이동 시 세션 객체가 유지되므로 정보 확인 가능함 -->
	<h3>세션값1 확인 : <%=session.getAttribute("session1") %></h3>
	<h3>세션값2 확인 : <%=session.getAttribute("session2") %></h3>
	<!-- 만약, 세션 객체에 저장되지 않은 속성명을 사용할 경우 null 값이 리턴됨 -->
	<h3>세션값3 확인 : <%=session.getAttribute("session3") %></h3>
	<hr>
	<%
	// 주의! getAttribute() 메서드로 가져온 속성값(데이터)를 변수에 저장할 경우
// 	String name = session.getAttribute("session1");
    // => 리턴타입이 Object 타입인 getAttribute() 리턴값을 String 타입에 저장하려하면 오류 발생!
    //    따라서, 저장된 데이터가 String 타입이라는 보장이 있으면 강제 형변환을 통해 
    //    String 타입으로 변환하여 저장 가능함
    String name = (String)session.getAttribute("session1");
	%>
	<h3>세션값1 확인 : <%=name %></h3>
</body>
</html>













