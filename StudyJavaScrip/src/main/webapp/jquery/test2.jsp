<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery-3.6.0.js 라이브러리 등록 -->
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// window.jQuery = jQuery = $ 형식으로 식별자가 변경되어 왔으며, $ 를 가장 많이 사용
	// jQuery 에서 문서 로딩 관련 이벤트 처리 시 load 또는 ready 이벤트를 사용
	// jQuery 에서 document 객체(HTML 문서 전체)에 대한 ready 이벤트 처리 방법
	// 1. jquery(selector).ready(함수) 형식으로 작성하는 방법
// 	function print() {
// 		alert("ready 이벤트 - 222");
// 	}
// 	jQuery(document).ready(print);
	// => 함수를 별도로 정의하고 ready() 함수 파라미터로 정의된 함수 전달하거나
	//    별도의 함수를 정의하지 않고 익명함수(anonymous function) 형태로 직접 정의 가능
// 	jQuery(document).ready(function() { // 함수의 이름이 없는 익명함수를 ready() 함수 내에 정의(1회용)
// 		alert("ready 이벤트 - 1");
// 	});

	
	// 2. $(selector).ready(함수) 형식으로 작성하는 방법
	//    => ($(selector).이벤트(함수) 형식으로 주로 다른 객체에 대한 이벤트에서 많이 사용하는 형태)
// 	$(document).ready(function() {
// 		alert("ready 이벤트 - 2");
// 	});
	
	// 3. $(함수) 형식으로 작성하는 방법(document.ready 이벤트일 경우 가장 많이 사용하는 형태)
	$(function() {
		alert("ready 이벤트 - 3");
	});
	
</script>
</head>
<body>
	<h1>test2.jsp - jQuery</h1>
</body>
</html>








