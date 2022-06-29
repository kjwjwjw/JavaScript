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
		DOM 객체에 대한 탐색 및 접근을 통해 조작하는 공통적인 이벤트
		=> on("이벤트명", "함수") 형식을 사용
		
		1. 클릭 동작에 대한 이벤트 : on("click", 함수)
		- 특정 대상 클릭 시 동작하는 이벤트
		- $("선택자").click(함수) 이벤트와 동일함
		- 클릭 대상에 제한 없음(버튼 외에 어떤 요소도 사용 가능)
		*/
		
		// 확인 버튼에 click 이벤트 연결
		// 1) click() 함수 사용 시
// 		$("#btnOk").click(function() {
// 			alert("확인 버튼 클릭! - click()");
// 		});
		
		// 2) on() 함수 사용 시
		$("#btnOk").on("click", function() {
// 			alert("확인 버튼 클릭! - on()");

			// 아이디, 패스워드 값을 textarea 에 출력
			var id = $("input[name=id]").val();
			var password = $("input[name=password]").val();
			var subject = $("#selectBox > option:selected").val();
			$("#resultArea").html(
				"아이디 : " + id + "\n" +
				"패스워드 : " + password + "\n" + 
				"선택과목 : " + subject
			);
		});
		
		// 버튼 외의 항목도 클릭 이벤트 처리 가능
		$("#clickDiv").on("click", function() {
			alert("div 태그 클릭됨!");
		});
		
		// 아이디 입력란에 키보드를 눌러 데이터 입력 시 처리 이벤트 - "keyup"
		$("input[name=id]").on("keyup", function() {
			var id = $("input[name=id]").val();
			$("#spanId").html(id);
		});
		
		// 특정 요소에 포커스가 주어질 때(focus)와 포커스가 해제될 때(blur) 동작하는 이벤트
// 		$("#resultArea").on("focus", function() {
// 			$("#resultArea").html("textarea focus in").css("background", "skyblue");
// 		});
		
// 		$("#resultArea").on("blur", function() {
// 			$("#resultArea").html("textarea focus out").css("background", "white");
// 		});
		
		// 복수개의 이벤트를 하나의 함수로 처리할 경우(이벤트명을 차례대로 기술 - 공백으로 구분)
// 		$("#resultArea").on("focus blur", function() {
// 			$("#resultArea").html("포커스 상태 변경");
// 		});
		
		// 복수개의 이벤트를 각각의 함수로 처리할 경우(on() 함수 내에서 {이벤트명:함수()} 형태로 작성
		$("#resultArea").on({
			// 이벤트명: function() {수행할 동작},
			// 이벤트명: function() {수행할 동작}...
			focus: function() {
				$("#resultArea").html("textarea focus in").css("background", "skyblue");
			},
			blur: function() {
				$("#resultArea").html("textarea focus out").css("background", "white");
			},
			mouseenter: function() {
				$("#resultArea").html("textarea mouse enter").css("background", "orange");
			},
			mouseleave: function() {
				$("#resultArea").html("textarea mouse leave").css("background", "yellow");
			}
		});
		
		// off() 함수를 사용하면 등록된 이벤트 제거 가능(= binding 된 이벤트를 unbinding)
		// => $("선택자").off("이벤트명")
		// 버튼 클릭 시 확인 버튼 동작을 수행하지 못하도록 이벤트 제거
		$("#btnStopEvent").on("click", function() {
			$("#btnOk").off("click").val("버튼 클릭 이벤트 해제됨");
		});
		
	});
</script>
</head>
<body>
	<h1>jQuery/test8.jsp</h1>
	<div id="wrap">
		<div id="inputBox">
			아이디 : <input type="text" name="id"><span id="spanId"></span><br>
			패스워드 : <input type="password" name="password">
		</div>
		<select id="selectBox" name="subject">
			<option value="선택하세요">선택하세요</option>
			<option value="자바">자바</option>
			<option value="JSP">JSP</option>
			<option value="스프링">스프링</option>
		</select>
		<br>
		<textarea id="resultArea" rows="5"></textarea>
		<br>
		<input type="button" value="확인" id="btnOk">
		<input type="button" value="취소" id="btnCancel">
		<input type="button" value="확인 버튼 클릭 기능 중지" id="btnStopEvent">
	</div>
	====<div id="clickDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>====
</body>
</html>











