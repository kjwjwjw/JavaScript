<%@page import="ajax.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// check_id.jsp 페이지로부터 전달받은 id 가져와서 변수에 저장 후
// MemberDAO 객체의 checkId() 메서드를 호출하여 아이디 중복 여부 확인 작업 요청
// => 파라미터 : 아이디(id)     리턴타입 : boolean(isDuplicate)
	String id = request.getParameter("id");

	MemberDAO member = new MemberDAO();
	boolean isDuplicate = member.checkId(id);
	
	if(isDuplicate) {
		out.println("이미 사용중인 아이디");
	} else {
		out.println(" 사용 가능한 아이디");
	 } 
	
%>















