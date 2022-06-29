<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
pageContext 객체
- JSP 페이지와 관련된 프로그램에서 다른 내장 객체를 얻어내거나
  현재 페이지의 요청/응답 제어권을 다른 페이지로 넘겨주는 용도로 사용
- request, session, application 등의 내장 객체 속성을 제어하는 용도로도 사용

1) forward() 메서드
=> 현재 페이지의 요청과 응답에 관한 제어권을 지정된 URL 로 영구적으로 전달함
   (즉, forward 된 페이지의 요청 처리가 끝나면 응답도 종료됨)
- 지정된 페이지로 포워딩(이동)을 수행하는 메서드
- 포워딩 시 주소 표시줄의 주소가 새로운(요청된) 주소로 변경되지 않고 기존의 주소가 그대로 유지됨
  => 이처럼, 새로운 요청이 발생해도 기존의 요청 주소(URL)가 그대로 유지되는(= 변경되지 않는) 
     이동(포워딩) 방식을 "Dispatcher 방식" 의 포워딩이라고 함

2) include() 메서드    
=> 현재 페이지의 요청과 응답에 관한 제어권을 지정된 URL 로 임시로 전달함
=> 해당 include 된 페이지의 처리가 끝나면 제어권이 다시 원래의 페이지로 돌아옴
=> 따라서, include 로 지정된 페이지의 내용을 원래 페이지에 삽입하는 효과
*/

// response 객체의 sendRedirect() 메서드를 사용하여 pageContextTest2.jsp 페이지로 이동
// response.sendRedirect("pageContextTest2.jsp");
// => 포워딩 시 주소표시줄의 주소가 새로운 요청 주소인 "pageContextTest2.jsp" 로 변경됨
//    ex) 포워딩 결과 : http://localhost:8080/StudyJSP/jsp3/pageContextTest2.jsp

// pageContext 객체의 forward() 메서드를 사용하여 pageContextTest2.jsp 페이지로 이동
pageContext.forward("pageContextTest2.jsp");
// => 포워딩 시 주소표시줄의 주소가 기존의 주소인 "pageContextTest1.jsp" 로 유지되고
//    새로운 요청 주소인 "pageContextTest2.jsp" 주소는 보이지 않는다!
//    단, 웹브라우저에 표시되는 내용은 새로운 요청 주소인 "pageContextTest2.jsp" 페이지가 표시됨
//    ex) 포워딩 결과 : http://localhost:8080/StudyJSP/jsp3/pageContextTest1.jsp

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>pageContextTest1.jsp</h1>
	<script type="text/javascript">
		alert("확인");
	</script>
</body>
</html>

















