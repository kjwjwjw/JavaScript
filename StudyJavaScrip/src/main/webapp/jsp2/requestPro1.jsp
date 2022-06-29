<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro1.jsp - request 객체 처리 예제</h1>
	<%
	/*
	requestForm1.jsp 페이지에서 데이터 입력 후 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 모두 내장 객체인 request 객체에 저장되며
	지정된 웹페이지 또는 파일(requestPro1.jsp)로 이동하면서 request 객체(데이터 포함)도 함께 전달됨
	=> 요청 관련 모든 정보는 request 객체가 관리(= 자동으로 생성되는 객체 = 내장 객체)
	=> request 객체의 변수 또는 메서드를 통해 요청 정보 사용 가능
	   (request.변수명 또는 request.메서드명())
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명");  =>  단일 항목 파라미터 가져오기(String 타입 리턴)
	   2) request.getParameterValues("파라미터명");  =>  복수 항목 파라미터 가져오기(String[] 타입 리턴)
	=> 주의! 전달받은 파라미터가 존재하지 않을 경우(= 지정한 파라미터명이 없을 경우)
	   null 값이 리턴되고, 파라미터명은 존재하지만 데이터가 없을 경우 널스트링("") 값이 리턴됨
	   (단, 일반 파라미터의 경우 데이터 미입력 시 널스트링이 전달되지만
		라디오버튼, 체크박스 등은 데이터 미입력 시 파라미터 자체가 전달되지 않으므로 null 값 전달됨)
	   특히, 체크박스는 배열 형태로 접근하므로 null 값을 통해 배열에 접근하려하면
	   NullPointerException 이라는 예외(= 오류)가 발생하여 코드 실행이 불가능해짐
	*/
	
	// -------------------------------------------------------------------------------
	// 만약, requestForm1.jsp 페이지에서 POST 방식으로 요청(method="post")했을 경우
	// 파라미터로 전달되는 데이터 중 한글 데이터가 포함되어 있으면 깨질 수 있다!
	// 따라서, 응답페이지(ex. requestPro1.jsp 페이지)에서 별도의 한글 처리가 필요함
	// => request 객체의 setCharacterEncoding() 메서드를 호출하여 "UTF-8" 타입 지정
	request.setCharacterEncoding("UTF-8"); // 유니코드 방식(UTF-8)으로 변경
	// => 반드시 한글 파라미터 가져오기 전 인코딩 타입 변경을 먼저 수행해야한다!
	// -------------------------------------------------------------------------------
	// 1. 폼 파라미터 중 파라미터명(name 속성값)이 "name" 인 파라미터의 데이터 가져오기
	// => String 타입 변수 strName 에 저장
	String strName = request.getParameter("name");
	// 스크립틀릿 내에서 변수에 저장된 데이터를 웹페이지에 출력할 경우 out.print() 메서드 사용
// 	out.println("이름 : " + strName + "<br>");
	
	// 2. 폼 파라미터 중 파라미터명(name 속성값)이 "age" 인 파라미터의 데이터 가져오기
	String strAge = request.getParameter("age");
// 	out.println("나이 : " + strAge + "<br>");
	
	// 3. 폼 파라미터 중 파라미터명(name 속성값)이 "gender" 인 파라미터의 데이터 가져오기
	String strGender = request.getParameter("gender");
// 	out.println("성별 : " + strGender + "<br>");

	// 4. 폼 파라미터 중 파라미터명(name 속성값)이 "hobby" 인 파라미터의 데이터 가져오기
	// => 주의! checkbox 처럼 복수개의 데이터가 하나의 파라미터명으로 전달될 경우
	//    getParameter() 메서드를 사용하면 하나의(첫번째) 데이터만 가져올 수 있음
	// => 따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	//    복수개의 데이터를 String[] 타입으로 리턴받아 처리해야함
// 	String strHobby = request.getParameter("hobby");
// 	out.println("취미 : " + strHobby + "<br>"); // 복수개 체크 시에도 하나의 값만 출력됨
	
	// 파라미터명이 "hobby" 인 취미를 가져와서 String[] 타입 strHobbies 에 저장
	String[] strHobbies = request.getParameterValues("hobby");
// 	out.println(strHobbies); // 주의! 미체크 시 null 값이 전달될 수 있음

	// 배열의 첫번째 데이터 출력
// 	out.println("취미 : " + strHobbies[0] + "<br>");
	// => null 값이 전달된 경우 배열 인덱스 접근이 불가능하므로 오류가 발생할 수 있음!
	%>
	<table border="1">
		<tr>
			<td>이름</td><td><%=strName %></td>
		</tr>
		<tr>
			<td>나이</td><td><%=strAge %></td>
		</tr>
		<tr>
			<td>성별</td><td><%=strGender %></td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<!-- strHobbies 배열 내의 인덱스가 고정(0 ~ 2번)이 아니므로 무조건 접근 시 오류 -->
<%-- 				<%=strHobbies[0] %>, <%=strHobbies[1] %>, <%=strHobbies[2] %> --%>

				<!-- 자바 코드 for문을 활용하여 배열 내의 모든 인덱스 차례대로 접근해야함 -->
				<!-- 주의! null 값이 전달될 경우 length 속성 접근 시에도 오류 발생! -->
				<!-- 따라서, if문을 사용하여 배열이 null 이 아닐 때만 반복문 사용 -->
				<%
				if(strHobbies != null) {
					for(int i = 0; i < strHobbies.length; i++) {
						out.println(strHobbies[i]);
					}
				} else {
// 					out.println("없음");
				%>
					<!-- 자바스크립트를 사용하여 "취미 선택 필수!" 출력 후 이전페이지로 돌아가기 -->
					<script type="text/javascript">
						alert("취미 선택 필수!");
						history.back();
					</script>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</body>
</html>















