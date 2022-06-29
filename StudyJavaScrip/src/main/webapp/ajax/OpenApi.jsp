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
				url: "http://finlife.fss.or.kr/finlifeapi/companySearch.json?auth=8c865a2b68268afb6b372118e59c51d9&topFinGrpNo=020000&pageNo=1",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
				$("#resultArea").html("<table border='1'><tr><th colspan='3'>OpenApi</th></tr></table>");
				$("#resultArea > table").append(
						"<tr><th width='50'>인증키</th>" 
						+ "<th width='50'>은행</th>" 
						+ "<th width='50'>페이지번호</th>" 
								+"</tr>");
				
				
				
						let result = data.result;
//		 				alert(JSON.stringify(boxOfficeResult));

						// 2. 추출된 전체 조회 결과에서 항목별 추출
						// => boxofficeType, showRange, dailyBoxOfficeList
						let boxofficeType = result.prdt_div;
						let showRange = result.total_count;
						let max_page_no = result.max_page_no;
						let now_page_no = result.now_page_no;
						let err_cd = result.err_cd;
						let err_msg = result.err_msg;
						

						// for...of 문 사용 시
						for(let boxOffice of dailyBoxOfficeList) {
							// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
							let rnum = boxOffice.rnum;
							let rank = boxOffice.rank;
							let movieNm = boxOffice.movieNm;
							let openDt = boxOffice.openDt;
							let audiAcc = boxOffice.audiAcc;
							let movieCd = boxOffice.movieCd;
							
							// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
							$("#resultArea > table").append(
									"<tr><td>" + rank + "</td>" 
									+ "<td><a href='test7_json_movie_detail.jsp?movieCd=" + movieCd + "'>" + movieNm + "</a></td>"
									+ "<td>" + openDt + "</td>" 
									+ "<td>" + audiAcc + "명</td></tr>"
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
			<h1>test8_json.jsp - 일간 박스오피스 순위</h1>
			<input type="date" id="date">
			<input type="button" value="박스오피스 조회" id="btnOk"><br>
			<div id="resultArea"></div>
		</body>
		</html>










