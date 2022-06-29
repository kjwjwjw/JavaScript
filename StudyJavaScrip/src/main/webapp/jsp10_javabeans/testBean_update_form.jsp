
<%@page import="jsp10_javabeans.Test3DTO"%>
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Test3DAO 객체의 selectDetail() 메서드를 호출하여 회원 1명의 정보 조회 = select 와 동일
// 전달받은 URL 파라미터(no) 가져오기
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
	<h1>회원 정보 수정</h1>
	<form action="testBean_update_pro.jsp" method="post">
		<!-- 번호는 데이터 전달 시 함께 전달해야하므로 input type="hidden" 으로 포함시켜 전달 -->
<%-- 		<input type="hidden" name="no" value="<%=no %>"> --%>
		<table border="1">
			<tr>
				<td>학번</td>
<%-- 				<td><%=no%></td> --%>
				<!-- 또는 편집은 불가능하게 하고, 폼에 포함시키려면 readonly 속성 설정 -->
				<td><input type="text" name="no" value="<%=no%>" readonly="readonly"></td>
			</tr>
			<!-- 이름, 나이, 성별 편집을 위해 기존 데이터를 폼에 표시 -->
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="<%=dto.getAge()%>"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>	
					<!-- 성별 데이터에 맞게 선택하기 위해서 checked 속성을 if문으로 실행 여부 결정 -->
					<input type="radio" name="gender" value="남"
						<%if(dto.getGender().equals("남")) {%>checked="checked"<%}%>>남
					<input type="radio" name="gender" value="여" 
						<%if(dto.getGender().equals("여")) {%>checked="checked"<%}%>>여
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>








