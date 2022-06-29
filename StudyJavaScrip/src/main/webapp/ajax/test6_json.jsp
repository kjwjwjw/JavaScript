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
		$("#btnOk").on("click", function() {
			// json_data.txt 파일을 사용하여 AJAX 에서 JSON 객체 데이터 요청하기
			$.ajax({
				type: "GET",
				url: "json_data6.txt",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
				$("#resultArea").html("<table border='1'><tr><th colspan='4'>일별 박스오피스</th></tr></table>");
				$("#resultArea > table").append(
						
						 "<tr><th width='50'>순위</th>"
						+ "<th width='500'>영화명</th>"
						+ "<th width='150'>개봉일</th>"
			,			+ "<th width='100'>누적관객수</th></tr>")
						
				for(let i=0 ; i< data.length ;i++) {
					
					let rank =data[i].rank;
					let movieNm = data[i].movieNm;
					let openDt = data[i].openDt;
					let audiCnt =  data[i].audiCnt;
					
					$("#resultArea > table").append(
							
							 "<tr><td>" + rank + "</td>" 
							+ "<td>" + movieNm + "</td>" 
							+ "<td>" + openDt + "</td>" 
							+ "<td>" + audiCnt + "</td></tr>"
					);
				}
			})
			.fail(function() {
				// 요청 실패 시 자동으로 호출되는 함수 정의
				$("#resultArea").html("요청 실패");
			});
		});
	});
	
</script>
</head>
<body>
	<h1>test6_json.jsp - 일간 박스오피스 순위</h1>
	<input type="button" value="박스오피스 조회" id="btnOk"><br>
	<div id="resultArea"></div>
</body>
</html>












