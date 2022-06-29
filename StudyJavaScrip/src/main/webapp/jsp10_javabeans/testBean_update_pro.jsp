DTO"%>
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@page import="jsp10_javabeans.Test3DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 폼파라미터로 전달되는 이름, 나이, 성별 가져와서 출력
// => 폼 파라미터에 대한 한글 처리 필수
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");

// 수정에 사용될 데이터를 직접 메서드에 전달해도 되지만 하나의 객체로 관리하기 위해 Test3DTO 객체 사용
Test3DTO dto = new Test3DTO();
dto.setNo(no);
dto.setName(name);
dto.setAge(age);
dto.setGender(gender);

// Test3DAO 객체 생성 후 update() 메서드를 호출하여 회원 정보 수정
// => 파라미터 : Test3DTO 객체(dto)     리턴타입 : int(updateCount)
Test3DAO dao = new Test3DAO();
int updateCount = dao.update(dto);

// 리턴받은 결과값 판별
// => updateCount 가 0보다 크면 "testBean_select_detail.jsp" 페이지로 이동(URL 에 번호를 포함)
// => 아니면, 자바스크립트를 사용하여 "수정 실패!" 출력 후 이전페이지로 돌아가기
if(updateCount > 0) {
	response.sendRedirect("testBean_select_detail.jsp?no=" + no);
} else {
	%>
	<script>
		alert("정보 수정 실패!");
		history.back();
	</script>
	<%
}

%>    















