<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	/*
	css("속성명", "값") 형식으로 호출 시 해당 속성값을 변경할 수 있으며
	css("속성명") 형식으로 호출 시 해당 속성에 대한 속성값을 가져올 수 있다
	=> 단, 해당 선택자 요소가 복수개일 경우 가장 첫번째 요소에 대한 값만 가져옴
	*/
	$(function() {
		// h3 태그 중 마지막 요소의 color 속성값을 red 로 변경
		$("h3:last").css("color", "red");
		
		var h3Color = $("h3").css("color"); // 첫번째 h3 태그의 color 속성값을 가져와서 저장
// 		alert(h3Color); // rgb(0, 0, 0) 출력됨 => BLACK 색상값
		
		// h3 태그 중 첫번째 요소의 color 속성값을 blue 로 변경 후 값 출력
		$("h3:first").css("color", "blue");
// 		alert($("h3").css("color"));

		// css() 함수 내에서 구현되는 익명 함수
		// => $("선택자").css("속성명", function() {})
		// 1) $("선택자").css("속성명", function(index) {}) 
		//    => 해당 선택자에 대한 지정된 속성값에 반복 접근
		//       (index 파라미터로 요소의 인덱스가 자동 전달됨)
// 		$("h3").css("color", function(index) {
// 			alert(index); // h3 태그에 차례대로 접근하면서 해당 요소의 인덱스(0, 1, 2) 출력
// 		});
		
		// 2) $("선택자").css("속성명", function(index, value) {}) 
		//    => 해당 선택자에 대한 지정된 속성값에 반복 접근
		//       첫번째 파라미터(index) : 해당 요소의 인덱스(0부터 시작) 차례대로 전달(= 1씩 증가)
		//       두번째 파라미터(value) : 각 인덱스에 해당하는 요소의 지정된 속성값 차례대로 전달
// 		$("h3").css("color", function(index, value) {
// 			alert(index + ", " + value);
// 		});
		
		// -----------------------------------------------------------
		var colorValue = ["green", "magenta", "skyblue"]; // 글자 색상을 저장하는 배열 생성
		var backgroundColorValue = ["yellow", "black", "red"]; // 배경 색상을 저장하는 배열 생성
		
// 		$("h3").css("color", function(index) {
// 			// 익명함수 내에서 return 문을 사용하여 특정 값 리턴 시 해당 요소의 속성값 변경 가능
// // 			return "blue"; // 모든 h3 태그의 color 속성값을 "blue" 로 변경

// 			// colorValue 배열 내에 저장된 색상을 index 를 활용하여 접근한 뒤 각 요소의 색상 변경
// 			return colorValue[index]; // index 값이 0, 1, 2 가 전달되므로 배열의 인덱스로 활용 가능
// 			// => 결과적으로 제목1, 제목2, 제목3 에 해당하는 h3 태그의 color 속성이
// 			//               green  magenta skyblue 값으로 차례대로 변경됨
// 		});
		
		// css() 함수를 호출하여 "h3" 태그의 "background" 속성값을 배열 값을 사용하여 변경
// 		$("h3").css("background", function(index) {
// 			return backgroundColorValue[index];
// 		});
		
		// 동일한 대상에 복수개의 속성을 변경하는 경우
		// $("선택자").css({속성1:함수(index) {}, 속성2:함수(index) {}});
		$("h3").css({
			// 변경할 속성명:함수(){} 형태로 구현하며, 각 속성은 콤마(,)로 구분
			color:function(index) {
				return colorValue[index];
			},
			background:function(index) {
				return backgroundColorValue[index];
			}
		});
		
	});
</script>
<style type="text/css">
	h3 {
		
	}
</style>
</head>
<body>
	<h1>jQuery/test4.jsp</h1>
	<h3>제목1</h3>
	<h3>제목2</h3>
	<h3>제목3</h3>
</body>
</html>