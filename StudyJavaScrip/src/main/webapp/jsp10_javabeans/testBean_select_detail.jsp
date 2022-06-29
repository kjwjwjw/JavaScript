
<%@page import="jsp10_javabeans.Test3DTO"%>
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// testBean_select.jsp 페이지로부터 전달받은 URL 파라미터(no) 가져오기
int no = Integer.parseInt(request.getParameter("no"));

// Test3DAO 클래스 인스턴스 생성 후 selectDetail() 메서드 호출하여 1명의 회원 정보 가져오기
// => 파라미터 : 번호(no)     리턴타입 : Test3DTO(dto)
Test3DAO dao = new Test3DAO();
Test3DTO dto = dao.selectDetail(no);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 상세정보</h1>
	<table border="1">
			<tr>
				<td>학번</td>
<%-- 				<td><%=dto.getNo() %></td> --%>
				<td><%=no %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=dto.getAge() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=dto.getGender() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 수정 버튼 클릭 시 "testBean_update_form.jsp" 페이지로 이동 -->
					<!-- URL 파라미터로 번호(no) 전달 -->
					<input type="button" value="수정" onclick="location.href='testBean_update_form.jsp?no=<%=no%>'">
				</td>
			</tr>
		</table>
</body>
</html>













