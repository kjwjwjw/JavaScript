
<%@page import="jsp11_board.BoardDAO"%>
<%@page import="jsp11_board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// writePro.jsp 페이지에서 보여줄(표시할) 웹페이지가 없다면 <HTML> 태그 불필요(삭제 가능)
// POST 방식 한글 처리
request.setCharacterEncoding("UTF-8");

// write_form.jsp 페이지로부터 전달받은 폼파라미터(작성자, 비밀번호, 제목, 내용)을 가져와서
// 변수에 저장 후 출력
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

// 폼파라미터 데이터를 하나의 객체로 다루기 위해 BoardDTO 객체 생성 후 저장
// BoardDTO board = new BoardDTO();
// board.setName(name);
// board.setPass(pass);
// board.setSubject(subject);
// board.setContent(content);
// => 만약 파라미터 생성자가 정의되어 있을 경우 생성자를 통해 데이터 전달
BoardDTO board = new BoardDTO(name, pass, subject, content);

// BoardDAO 객체 생성 후 insert() 메서드를 호출하여 글쓰기 작업 요청
// => 파라미터 : BoardDTO 객체(board)    리턴타입 : int(insertCount)
BoardDAO dao = new BoardDAO();
int insertCount = dao.insert(board);

// 글쓰기 작업 요청 결과에 따른 판별
// => 글쓰기 성공 시 "list.jsp" 페이지로 포워딩
// => 글쓰기 실패 시 자바스크립트를 사용하여 "글쓰기 실패!" 출력 후 이전 페이지로 돌아가기 
if(insertCount > 0) { // 성공 시
	response.sendRedirect("list.jsp");
} else { // 실패 시
	%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
	<%
}
%>







