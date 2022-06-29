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
		$("table").css("width", "300px").css("text-align", "center");
		
		// on("change", 함수)
		// => 특정 대상의 '상태가 변하면' 동작하는 이벤트
		
		// each() 함수
		// => 지정된 대상에 대한 반복 접근 수행하는 함수
		// => 함수 내부에 익명함수 구현을 통해 인덱스와 요소를 전달받을 수 있음
		//    $("선택자").each(function(index, item) {})
		//    => 각 요소에 접근하여 해당 요소의 인덱스와 요소 자체를 전달받음
		
		// #allCheck 체크박스 체크 상태에 따라 다른 체크박스 체크 또는 해제
		$("#allCheck").on("change", function() {
			// 전체선택 체크박스에 대한 체크 상태 판별(prop() 또는 is() 활용 => true/false 리턴)
			if($("#allCheck").is(":checked")) { // $("#allCheck").prop("checked") 동일함
// 				alert("전체선택 체크됨!");
				// 체크박스에 대한 전체 요소 반복 - each() 함수 활용
				$(":checkbox").each(function(index, item) {
// 					alert(index + " : " + $(item).prop("checked"));
					// 전체선택 체크박스를 제외한 나머지 체크박스를 체크(= 체크상태를 true 로 변경)
					// => prop() 함수의 파라미터로 "속성명" 과 함께 값을 전달 시 속성값 변경 가능
					// index 값이 0 보다 클 경우에만 체크 수행(전체선택 제외시킴)
					if(index > 0) {
						$(item).prop("checked", true);
					}
				});
			} else {
// 				alert("전체선택 체크 해제됨!");
				// 체크박스 전체를 체크 해제
				$(":checkbox").each(function(index, item) {
					$(item).prop("checked", false);
				});
			}
		});
		
		// -----------------------------------------------------------
		// selectBox 콤보박스의 change 이벤트 바인딩
		$("#selectBox").on("change", function() {
			alert("selectBox 변경됨! - " + $("#selectBox").val());
		});
		
		// searchType 콤보박스의 change 이벤트 바인딩
		$("#searchType").on("change", function() {
			alert("searchType 변경됨! - " + $("#searchType").val());
		});
		
		// searchKeyword 인풋박스의 change 이벤트
		// => 데이터 입력받는 인풋박스의 change 이벤트는 입력이 끝난 후 포커스 해제될 때 동작
		//    (= blur 이벤트와 유사하지만, 내용 변경이 있을 때만 동작함)
		$("#searchKeyword").on("change", function() {
			alert("searchKeyword 변경됨! - " + $("#searchKeyword").val());
		});
		
	});
</script>
</head>
<body>
	<h1>jQuery/test10.jsp</h1>
	<table border="1">
		<tr>
			<td colspan="3">
				<select id="selectBox" name="target">
					<option value="전체">전체</option>
					<option value="VIP">VIP</option>
					<option value="일반">일반</option>
				</select>
			</td>
		</tr>
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
				<select id="searchType" name="searchType">
					<option value="name">이름</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" id="searchKeyword" name="search" placeholder="검색어 입력">
			</td>
		</tr>
    </table>
</body>
</html>














