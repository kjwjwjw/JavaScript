<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 버튼 등의 특정 대상에 대한 이벤트(기본적인 이벤트)
		// => $("선택자").click(function() {});
		
		// 버튼 중 첫번째 버튼에 대한 이벤트 처리
// 		$("input[type=button]:first").click(function() {
// 			alert("시계표시 버튼 클릭됨!");
// 		});
		
		/*
		[ 특정 요소에 대한 조작 함수 ]
		1. html()
		   - HTML 문서 내에서 지정된 범위(선택자)안의 모든 요소를 가져오거나 추가하는 함수
		   - 해당 요소 내의 태그까지 모두 가져오며, 주석도 포함됨
		2. text()
		   - HTML 문서 내에서 지정된 범위(선택자)안의 모든 텍스트를 가져오거나 추가하는 함수
		   - html() 함수와 달리 태그를 제외한 텍스트만 가져옴
		   - 단, 브라우저마다 줄바꿈이나 공백 등이 달라질 수 있음
		3. empty()
		   - 지정된 선택자 내의 요소 제거
		4. remove()
		   - 지정된 선택자 내의 요소와 선택자 자체도 제거
		*/
		
		// 첫번째 h3 태그의 요소(태그안에 포함된 내용) 가져와서 출력
// 		var h3Element = $("h3").html(); // "제목1" 텍스트 가져오기
// 		alert(h3Element);
		
		// id 선택자 h3_2 요소 내용 가져와서 출력
// 		var h3Element = $("#h3_2").html(); 
// 		alert(h3Element);
		// => 제목2&nbsp;<span>제목2-1</span>&nbsp;<span>제목2-2</span>
		
		// id 선택자 h3_2 요소 텍스트 가져와서 출력(공백 적용됨)
// 		var h3Element = $("#h3_2").text(); 
// 		alert(h3Element);
		// => 제목2 제목2-1 제목2-2
		
		// -------------------------------------------------------------
		// html() 함수를 호출하여 #h3_1 선택자의 요소 내용을 변경(태그 적용됨)
		// => 자바스크립트 기본 : document.getElementById("id선택자명").innerHTML = 변경할 값
		//    jQuery : $("id선택자명").html(변경할값);
		$("#h3_1").html("<i>html() 함수로 변경한 제목1</i>");
		
		// text() 함수를 호출하여 #h3_2 선택자의 요소 내용을 변경(태그도 텍스트로 취급됨)
		$("#h3_2").text("<i>html() 함수로 변경한 제목1</i>");
		// -------------------------------------------------------------
		// html() 함수 등도 함수 내부에 익명함수 구현을 통해 요소 반복 가능
		// => $("선택자").html(function()) {}
		// => $("선택자").html(function(index)) {}
		// => $("선택자").html(function(index, oldHtml)) {}
		
		// 모든 h3 태그의 요소 확인
// 		$("h3").html(function(index, oldHtml) {
// 			alert(index + " : " + oldHtml); // 각 인덱스에 해당하는 번호와 요소 내용 차례대로 출력
// 		});
		
		// 모든 h3 태그의 요소 변경
		$("h3").html(function(index, oldHtml) {
			return index + "번 요소 : " + oldHtml;
		});
		// --------------------------------------------------
		// empty() 함수를 사용하여 선택자 h3_2 내의 요소 제거
// 		$("#h3_2").empty();
		
		// remove() 함수를 사용하여 선택자 h3_2 내의 요소 및 선택자 자체 모두 제거
		$("#h3_2").remove();
		
		// id 선택자 ta 항목(textarea) 내부에 id 선택자 wrap 항목의 모든 요소(태그 포함) 출력
// 		var wrapElement = $("wrap").html();
// 		$("ta").html(wrapElement);
		$("#ta").html($("#wrap").html());
	});
	
	// 서버 현재 시각을 "시:분:초" 형식으로 리턴하는 함수 정의
	function getTime() {
		var now = new Date(); // Fri Apr 08 2022 12:08:21 GMT+0900 (한국 표준시) 형식
		// 임의로 표시되는 형식을 변경하기 위해서 각 데이터를 따로 가져와야함
		var hour = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();
		
		return hour + "시 " + min + "분 " + sec + "초";
	}
	
	$(function() {
		// setInterval() 함수 내에서 반복되는 작업에 대해 중지 신호로 사용할 변수 선언
		var isStop = false; // true 일 경우 중지 신호, false 일 경우 동작 신호
		
		// btnShowClock 버튼 클릭 시 timer 요소 내부 항목 표시
		$("#btnShowClock").click(function() {
			
			
			// isStop 변수값을 false 로 초기화(나중에 중지된 후 다시 시작을 위해)
			isStop = false;
			
			// id 선택자 timer 요소 내부에 getTime() 함수 리턴값을 표시
			$("#timer").html("<h3>" + getTime() + "</h3>");
			
			// 표시된 시각 정보를 1초마다 갱신
			// => setInterval() 함수 필요
			// < 기본 문법 > setInterval(f, ms)
			// => setInterval(function() {수행할 작업}, 갱신간격);
			setInterval(function() {
				// 갱신 조건 : 타이머 중지 신호(isStop)이 false 일 때
				// 중지 조건 : 타이머 중지 신호(isStop)이 true 일 때 => clearInterval() 함수 필요
				if(!isStop) { // 갱신
					$("#timer").html("<h3>" + getTime() + "</h3>");
				} else { // 중지
					// setInterval() 함수를 통해 반복되는 작업 중지 시 clearInterval() 함수 호출
					// => setInterval() 함수 내에서 clearInterval() 함수 파라미터로
					//    this 지정 시 setInterval() 함수에 구현된 익명객체 자체를 전달 = 자기 자신 중지
					clearInterval(this);
				}
			}, 1000); // 1000ms = 1000밀리초 = 1초
			
		});
		
		// btnStopClock 버튼 클릭 시 timer 반복 중지 신호 전달
		$("#btnStopClock").click(function() {
			// 타이머 중단을 위해 isStop 변수값을 true 로 변경
			isStop = true;
		});
		
		// btnHideClock 버튼 클릭 시 timer 요소 내부 항목 제거
		$("#btnHideClock").click(function() {
			// timer 선택자 태그 자체는 남겨두기 위해 empty() 함수 사용하여 제거
			$("#timer").empty();
		});
	});
</script>
</head>
<body>
	<h1>jQuery/test5.jsp</h1>
	<div id="wrap">
		<!-- 제목을 출력하는 공간 -->
		<h3 id="h3_1">제목1</h3>
		<h3 id="h3_2">제목2&nbsp;<span>제목2-1</span>&nbsp;<span>제목2-2</span></h3>
		<h3 id="h3_3">제목3</h3>
	</div>
	<textarea id="ta" rows="5" cols="50"></textarea>
	<hr>
	<input type="button" value="시계 표시" id="btnShowClock">
	<input type="button" value="시계 정지" id="btnStopClock">
	<input type="button" value="시계 제거" id="btnHideClock">
	<div id="timer">
	<!-- 시계가 표시될 공간 -->
	</div>
</body>
</html>