<%@page import="jsp11_board.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// URL 을 통해 전달받은 아이디 인증코드 가져오기
String id = request.getParameter("id");
String code = request.getParameter("code");

MemberDAO dao = new MemberDAO();

int result = dao.selectAuthInfo(id, code);

// 0: 인증 실패 / -1: 인증 실패 / 1: 인증 성공
String msg= "";
if(result == 0){
	msg = "인증실패";
} else if (result == -1) {
	msg = "인증 실패(인증 정보가 존재하지 않음)";
} else if (result == 1) {
	msg = "인증성공";
	dao.changeAuthStatus(id);
	
	
	// 인증 성공 시 MemberDAO 객체의 changeAuthStatus() 메서드를  호출
	//  member 테이블의 auth_status 컬람값을 "Y" 로 변경하고
	// member_auth_info 테이블의 아이디와 인증코드 레코드 삭제하기
}
%>
<script>
	alert("<%=msg%>");
	location.href="../main.jsp";
</script>
<%


%>