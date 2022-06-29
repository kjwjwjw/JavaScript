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
	// 폼 파라미터로 전달받은 4개의 파라미터값 가져와서 변수에 저장 후 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin");
	String forwardPage = request.getParameter("forwardPage");
	%>
	<h1>forwardPro.jsp - 액션태그(forward)</h1>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>주민번호 : <%=jumin %></h3>
	<h3>포워드 페이지 : <%=forwardPage %></h3>
	
	<%--
	액션 태그(Action Tag)
	- JSP 페이지에서 자바 코드 등을 사용하지 않고도 동일한 작업을 수행하도록 만든 태그(XML)
	- <jsp:액션태그명 속성명="값 /> 형태로 사용하며, 태그 내에 또 다른 태그를 포함해야하는 경우
	  끝 태그 </jsp:액션태그명> 을 사용하여 포함해야함
	- 주로 사용하는 액션 태그명 : forward, include, useBean, setProperty 등   
	
	1. forward 액션 태그
	- pageContext 객체의 forward() 메서드 기능을 수행하는 태그
	  => 즉, 페이지 이동 처리를 수행하는 액션 태그
	- 현재 페이지가 갖고 있는 request 객체를 그대로 유지하여 페이지 이동만 수행
	  => 주소표시줄의 URL 이 유지되며, request 객체 데이터가 유지됨 = Dispatcher 방식 포워딩
	- 포워딩 시 전달할 데이터는 주소(URL) 뒤에 파라미터 형식으로 붙여서 전달하거나,
	  jsp:param 태그를 사용하여 데이터를 포함시켜 전달 가능(= input type="hidden" 과 동일)
	  => 단, jsp:param 태그로 전달하는 데이터는 URL 뒤에 표시되지 않음
	
	< 기본 문법 >
	<jsp:forward page="포워딩 할 페이지" /> 
	또는
	<jsp:forward page="포워딩 할 페이지"> 
		<jsp:param name="파라미터명1" value="데이터1" />
		<jsp:param name="파라미터명2" value="데이터2" />
	</jsp:forward>   
	--%>
	<!-- pageContext 객체의 forward() 메서드를 통한 포워딩 수행 -->
	<!-- => forwardPro2.jsp 페이지 사용 -->
<%-- 	<%pageContext.forward("forwardPro2.jsp"); %> --%>
	
	<!-- forward 액션 태그를 사용하여 forwardPro2.jsp 페이지로 포워딩 수행 -->
	<!-- 별도의 끝 태그 없이 시작 태그에서 바로 끝 표시 -->
<%-- 	<jsp:forward page="forwardPro2.jsp" /> --%>
	<!-- 
	주의! 맨 앞에 / 를 붙이면 상대경로에서 최상위 루트(= 컨텍스트루트 = 프로젝트명)가 되므로
	폴더 구조에 유의하여 페이지를 지정해야한다!
	ex) http://localhost:8080/StudyJSP/jsp6_action_tag/forwardPro2.jsp 페이지로 이동할 경우
	    1) page="forwardPro2.jsp"   =>   현재 위치와 같은 경로상의 forwardPro2.jsp 페이지 지정
	    2) page="/jsp6_action_tag/forwardPro2.jsp"  =>  컨텍스트루트상의 jsp6_action_tag 폴더 지정
	-->
<%-- 	<jsp:forward page="/jsp6_action_tag/forwardPro2.jsp" />   --%>

	<!-- 포워딩 페이지를 동적으로 변화시키기 위해 변수 조합도 가능 -->
	<jsp:forward page="<%=forwardPage %>" />
	
	<!-- 별도의 끝 태그를 사용하고, 사이에 jsp:param 태그를 통해 데이터 저장할 경우 -->
<%-- 	<jsp:forward page="forwardPro2.jsp"> --%>
<%-- 		<jsp:param name="paramValue" value="param"/> --%>
<%-- 		<jsp:param name="paramValue2" value="<%=id %>"/> --%>
<%-- 	</jsp:forward> --%>
</body>
</html>


















