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
1. eq(인덱스)
   - 선택자를 포함하여 형제자매 요소 탐색
   - 파라미터로 전달하는 인덱스 값은 0부터 시작하며, 인덱스에 해당하는 순서에 위치한 요소 리턴
   - 음수값 전달 시 뒤에서부터 탐색

2. attr("HTML속성명")
   - 선택자의 지정된 속성 값을 가져오거나 추가
   - HTML 태그 속성값 자체를 가져오며 상태에 따라 변하지 않음
   ex) 체크박스 checked="checked" 속성값을 가져올 때 활용(단, 체크 상태가 변해도 checked 값 전달됨)
   
3. prop("Javascript속성명")
   - 선택자의 지정된 속성 값에 대한 상태를 가져오거나 추가
   - 속성값 자체를 다루지 않고 해당 속성에 대한 상태(true/false) 리턴
   - attr() 함수와 유사하나 HTML 태그의 상태에 따라 결과값이 변함(자바스크립트의 상태 사용)
   ex) 체크박스 checked="checked" 속성값을 가져올 때 활용
       => 단, 체크박스 체크 시 true, 체크 해제 시 fals e리턴
   
4. is()
   - 선택자 입력 값과 관련된 상태 확인 후 일치 여부(true/false) 리턴
   - 선택자의 실행 결과가 태그 확인용
   - prop() 함수 리턴값을 boolean 타입으로 비교하는 것과 동일
*/
	$(function() {
// 		$("input[type=button]").click(function() {
// 			alert("버튼 클릭!");
// 		});

		// 가상선택자를 사용하여 버튼 클릭 이벤트 등록 시 => $(":button") 활용
		$(":button").click(function() {
			// 선택자 요소에 eq() 함수를 사용하여 지정된 요소들 중 인덱스에 해당하는 순서의 요소 지정
			// => 요소 지정 후 attr() 또는 prop() 함수를 사용하여 해당 요소의 속성에 접근
			// 홍길동에 해당하는 두번째 체크박스(1번 인덱스)에 대한 값 확인
			var attr1 = $("input[type=checkbox]").eq(1).attr("checked");
			// => 실제 체크 여부와 관계없이 HTML 속성에 checked="checked" 이므로 항상 checked 리턴
			var prop1 = $("input[type=checkbox]").eq(1).prop("checked");
			// => 체크 상태에 따라 true 또는 false 가 바뀌어 리턴
			
			// 이순신에 해당하는 세번째 체크박스(2번 인덱스)에 대한 값 확인
			var attr2 = $("input[type=checkbox]").eq(2).attr("checked");
			// => 체크박스 태그 내에 checked 속성이 명시되어 있지 않으므로 undefined 리턴
			var prop2 = $("input[type=checkbox]").eq(2).prop("checked");
			// => 체크 상태에 따라 true 또는 false 가 바뀌어 리턴
			
			// 두번째, 세번째 체크박스(1번, 2번 인덱스)에 대한 checked 속성값 상태 확인
			var is1 = $("input[type=checkbox]").eq(1).is(":checked");
			// => 체크박스 태그 내에 checked 속성이 명시되어 있지 않으므로 undefined 리턴
			var is2 = $("input[type=checkbox]").eq(2).is(":checked");
			// => 체크 상태에 따라 true 또는 false 가 바뀌어 리턴
			
			// 값 확인을 위해 id 선택자 result 영역에 표시
			$("#result").html(
				"attr1 = " + attr1 + ", prop1 = " + prop1 + "<br>" + 
				"attr2 = " + attr2 + ", prop2 = " + prop2 + "<br>" +
				"is1 = " + is1 + ", is2 = " + is2 + "<br>"
			);
			
		});
	});
</script>
</head>
<body>
	<h1>jQuery/test7.jsp</h1>
	<table border="1">
        <tr>
            <th><input type="checkbox" id="allCheck"></th>
            <th>번호</th>
            <th>이름</th>
        </tr>
        <tr>
            <td><input type="checkbox" id="check1" name="check" checked="checked" value="1"></td>
            <td>1</td>
            <td>홍길동</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="2"></td>
            <td>2</td>
            <td>이순신</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="3"></td>
            <td>3</td>
            <td>강감찬</td>
        </tr>
        <tr>
        	<td colspan="3">
        		<input type="button" value="확인"><br>
        		<div id="result">결과 확인 위치</div>
        	</td>
        </tr>
    </table>
</body>
</html>














