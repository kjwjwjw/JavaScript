<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		/*
		submit() 함수
		- submit 동작에 대한 이벤트 처리
		- 자바스크립트에서 submit 이벤트 처리 방법과 동일
		- form 태그를 선택자로 지정하여 submit() 함수를 호출하여
		  submit 함수 내에 익명함수를 구현하여 submit 버튼 클릭 시 수행할 동작 지정 
		*/
		$("form").submit(function() {
			// 콤보박스(select) 의 option 태그들 중 첫번째 option 태그의 selected 속성 확인
			// => '선택하세요' 항목이 선택되어 있을 경우 true, 아니면 false 리턴하기 위해 prop() 함수 활용
// 			alert($("#selectBox > option").eq(0).prop("selected"));
// 			alert($("#selectBox > option:first").prop("selected"));
// 			alert($("#selectBox > option[value=선택하세요]").prop("selected"));

// 			alert($("input[name=id]").val()); // 아이디 입력값 가져와서 출력
			
			// if문을 사용하여 '선택하세요' 항목이 선택되어 있을 경우(true) 
			// => alert() 함수를 통해 "항목 선택 필수!" 출력 후 false 값 리턴(submit 동작 취소)
			// 아니면 true 값 리턴(submit 동작 수행)
			if($("#selectBox > option").eq(0).prop("selected")) { // true 일 경우
				alert("항목 선택 필수!");
				$("#selectBox > option").eq(0).focus();
				return false;
			} else if($("input[name=id]").val() == "") {
				alert("아이디 입력 필수!");
				$("input[name=id]").focus();
				return false;
			} else if($("input[name=password]").val() == "") {
				alert("패스워드 입력 필수!");
				$("input[name=password]").focus();
				return false;
			} else { // false 일 경우
				return true;
			}
		});
	});
</script>
</head>
<body>
	<h1>jQuery/test8.jsp</h1>
	<div id="wrap">
		<form action="test8_result.jsp" method="post">
			<div id="inputBox">
				아이디 : <input type="text" name="id"><br>
				패스워드 : <input type="password" name="password">
			</div>
			<select id="selectBox" name="subject">
				<option value="선택하세요">선택하세요</option>
				<option value="자바">자바</option>
				<option value="JSP">JSP</option>
				<option value="스프링">스프링</option>
			</select>
			<br>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>














