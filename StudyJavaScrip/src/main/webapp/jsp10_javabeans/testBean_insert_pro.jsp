
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@page import="jsp10_javabeans.Test3DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// testBean_insert_form.jsp 페이지로부터 전달받은 폼 파라미터를 가져와서 변수에 저장 후
	// test4DAO 클래스 인스턴스를 생성하여 메서드를 통해 INSERT 작업을 수행
	// 번호, 이름, 나이, 성별 파라미터 가져오기
	// => 주의! 한글 데이터가 포함되므로 UTF-8 설정 필수!
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no")); // String -> int 변환 필수
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age")); // String -> int 변환 필수
	String gender = request.getParameter("gender");
	
	// 작업에 사용될 데이터를 관리하는 Test3DTO 객체(dto) 생성 후 폼파라미터 데이터를 저장
	Test3DTO dto = new Test3DTO();
	// Setter 호출하여 데이터 저장
	dto.setNo(no);
	dto.setName(name);
	dto.setAge(age);
	dto.setGender(gender);
	
// 	Test3DTO dto = new Test3DTO();
// 	// Setter 호출하여 데이터 저장(별도의 변수 없이 값을 직접 전달)
// 	dto.setNo(Integer.parseInt(request.getParameter("no"))); // String -> int 변환 필수
// 	dto.setName(request.getParameter("name"));
// 	dto.setAge(Integer.parseInt(request.getParameter("age"))); // String -> int 변환 필수
// 	dto.setGender(request.getParameter("gender"));
	
	// 데이터 작업을 수행하기 위한 Test3DAO 객체를 생성한 후 
	// insert() 메서드를 호출하여 작업에 필요한 데이터 전달 후 int 타입 리턴값 리턴받아 저장(insertCount)
	Test3DAO dao = new Test3DAO();
	int insertCount = dao.insert(dto);
	
	// 작업 완료 후 실패 시 자바스크립트를 사용하여 "추가 실패!" 메세지 출력하고 이전페이지로 돌아가기
	// 아니면, testBean_select.jsp 페이지로 포워딩
	if(insertCount > 0) { // 성공 시
		// testBean_select.jsp 페이지로 포워딩
		response.sendRedirect("testBean_select.jsp");
	} else { // 실패 시
		// 자바스크립트로 오류메세지 출력 후 이전페이지로 돌아가기
		%>
		<script type="text/javascript">
			alert("회원 추가 실패!");
			history.back();
		</script>
		<%
	}
	%>
</body>
</html>
















