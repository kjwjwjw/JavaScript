
<%@page import="jsp11_board.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 아이디, 패스워드 파라미터 가져오기
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

MemberDAO dao = new MemberDAO();

// MemberDTO 객체에 id, passwd 저장 여부는 선택사항
// 1. MemberDTO 객체 사용 시
// MemberDTO member = new MemberDTO();
// member.setId(id);
// member.setPasswd(passwd);

// boolean isLoginSuccess = dao.login(member);

// 2. MemberDTO 객체 미사용 시
boolean isLoginSuccess = dao.login(id, passwd);

// 로그인 작업 수행 후 결과를 boolean 타입(isLoginSuccess) 으로 리턴받아 결과에 따른 판별 작업 수행
// 만약, 로그인 성공 시(isLoginSuccess 가 true) 세션에 아이디("sId" 속성명)를 저장 후 메인페이지로 이동
// 로그인 실패 시(isLoginSuccess 가 false) 자바스크립트를 통해 "로그인 실패" 출력 후 이전페이지로
if(isLoginSuccess) {
	// 로그인 성공 시 회원의 인증 여부를 조회하여 미인증 회원일 경우 인증 수행 메세지 출력
	boolean isAuthenticatedMember = dao.getAuthenticationStatus(id);
	
	if(isAuthenticatedMember) {
		session.setAttribute("sId", id);
		response.sendRedirect("../main.jsp");
	} else {
		%>
		<script>
			alert("회원 인증 필수!");
			history.back();
		</script>
		<%
	}

} else {
	%>
	<script>
		alert("로그인 실패!");
		history.back();
	</script>
	<%
}
%>







