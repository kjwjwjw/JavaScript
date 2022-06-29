<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식 요청에 대한 한글 처리
request.setCharacterEncoding("UTF-8");

// requestForm3.jsp 페이지로부터 전달받은 request 객체에서 폼 데이터 가져오기
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String job = request.getParameter("job");
// 복수개의 데이터가 하나의 파라미터로 전달될 경우 getParameterValues() 메서드 호출
String[] hobby = request.getParameterValues("hobby");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro3.jsp - 회원 정보 출력</h1>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>직업 : <%=job %></h3>
	<h3>
		취미 : 
		<%
		if(hobby != null) { // 취미를 하나라도 체크했을 경우에만 반복문 수행
			for(String strHobby : hobby) {
				out.print(strHobby + " ");
			}
		} else { // 취미를 하나도 체크하지 않은 경우
			out.print("없음");
		}
		%>
	</h3>
</body>
</html>














