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
[ 특정 요소에 대한 조작 함수 - 2 ]
1. append()
   - 지정한 내용을 선택자 내부의 '끝 부분'에 추가
   - appendTo() 함수와 문장 구조의 차이만 다르고 기능은 동일
   - $("선택자").append("추가할내용")
     $("추가할내용").appendTo("선택자")
2. prepend()
   - 지정한 내용을 선택자 내부의 '첫 부분'에 추가
   - prependTo() 함수와 문장 구조의 차이만 다르고 기능은 동일
   - $("선택자").prepend("추가할내용")
     $("추가할내용").prependTo("선택자")
3. after()
   - 지정한 내용을 선택자 요소의 '뒤'에 삽입
   - insertAfter() 함수와 문장 구조의 차이만 다르고 기능은 동일
   - $("선택자").after("삽입할내용")
     $("삽입할내용").insertAfter("선택자")
4. before()
   - 지정한 내용을 선택자 요소의 '앞'에 삽입
   - insertBefore() 함수와 문장 구조의 차이만 다르고 기능은 동일
   - $("선택자").before("삽입할내용")
     $("삽입할내용").insertBefore("선택자")
*/
	$(function() {
		$("#wrap_append").append("<div>append() 로 삽입한 div 태그</div>");
		// => #wrap_append 영역 [내부]의 가장 마지막 요소로 삽입
// 		$("<div>appendTo() 로 삽입한 div 태그</div>").appendTo("#wrap_append");

		$("#wrap_prepend").prepend("<div>prepend() 로 삽입한 div 태그</div>");
		// => #wrap_prepend 영역 [내부]의 가장 처음 요소로 삽입
// 		$("<div>prependTo() 로 삽입한 div 태그</div>").prependTo("#wrap_prepend");
		
		$("#wrap_after").after("<div>after() 로 삽입한 div 태그</div>");
		// => #wrap_after 영역 [외부] 기준으로 뒤에 삽입
// 		$("<div>insertAfter() 로 삽입한 div 태그</div>").insertAfter("#wrap_after");
		
		$("#wrap_before").before("<div>before() 로 삽입한 div 태그</div>");
		// => #wrap_before 영역 [외부] 기준으로 앞에 삽입
// 		$("<div>insertBefore() 로 삽입한 div 태그</div>").insertBefore("#wrap_before");
		
		// 결과 확인을 위해 textarea(#ta) 에 id 선택자 wrap 의 내용을 모두 출력(html() 또는 val())
		$("#ta").val($("#wrap").html());
	});

</script>
</head>
<body>
	<h1>jQuery/test6.jsp</h1>
	<div id="wrap">
		<div id="wrap_append">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
		<hr>
		<div id="wrap_prepend">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
		<hr>
		<div id="wrap_after">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
		<hr>
		<div id="wrap_before">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
	</div>	
	<!-- 결과 확인을 위한 태그 출력용 textarea -->
	<textarea id="ta" rows="20" cols="100"></textarea>
</body>
</html>