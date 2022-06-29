
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터로 전달받은 번호 가져오기
int no = Integer.parseInt(request.getParameter("no"));

// Test3DAO 인스턴스 생성 후 delete() 메서드 호출하여 회원 정보 삭제 작업 요청
// => 파라미터 : 번호(no)     리턴타입 : int(deleteCount)
Test3DAO dao = new Test3DAO();
int deleteCount = dao.delete(no);

// Test3DTO dto = new Test3DTO();
// dto.setNo(no);
// int deleteCount = dao.delete(dto);

// 리턴받은 결과값 판별
// => deleteCount 가 0보다 크면 "testBean_select.jsp" 페이지로 이동
// => 아니면, 자바스크립트를 사용하여 "삭제 실패!" 출력 후 이전페이지로 돌아가기
if(deleteCount > 0) {
	response.sendRedirect("testBean_select.jsp");
} else {
	%>
	<script>
		alert("정보 삭제 실패!");
		history.back();
	</script>
	<%
}
%>










