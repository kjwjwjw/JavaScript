
<%@page import="jsp11_board.MemberDAO"%>
<%@page import="jsp11_board.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식 한글 처리
request.setCharacterEncoding("UTF-8");

// 폼 파라미터 가져오기
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

// 데이터를 MemberDTO 객체에 저장
// MemberDTO member = new MemberDTO();
// member.setId(id);
// member.setPasswd(passwd);
// member.setName(name);
// member.setEmail(email);
// member.setPhone(phone);

// 만약, 파라미터 생성자를 정의했을 경우(생성자 파라미터에 저장할 데이터 전달)
MemberDTO member = new MemberDTO(id, passwd, name, email, phone);

// MemberDAO 클래스 객체 생성 후 insert() 메서드 호출
// => 파라미터 : MemberDTO 객체(member), 리턴타입 : int(insertCount)
MemberDAO dao = new MemberDAO();
int insertCount = dao.insert(member);

// insertCount 가 0보다 크면 main.jsp 페이지로 이동하고
// 아니면, 자바스크립트를 통해 "회원 가입 실패!" 출력 후 이전페이지로 돌아가기
if(insertCount > 0) {
	// 절대경로로 지정할 경우
	// request.getContextPath() 메서드(프로젝트명까지의 경로 리턴)를 활용하여 이동 경로 설정
// 	response.sendRedirect(request.getContextPath()); // http://localhost:8080/StudyJSP/
// 	response.sendRedirect(request.getContextPath() + "/jsp11_board/main.jsp");

	// 상대경로로 지정할 경우
// 	response.sendRedirect("../main.jsp");
	// -------------------------------------------------------
	// 회원 가입 성공 시 인증 메일 발송을 위한 send_autentication_code.jsp 페이지로 이동
	response.sendRedirect("send_authentication_code.jsp?id=" + id + "&email=" + email);
} else {
	%>
	<script>
		alert("회원 가입 실패!");
		history.back();
	</script>
	<%
}

%>    

















