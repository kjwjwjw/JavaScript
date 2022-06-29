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
				url: "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20210503",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
				$("#resultArea").html("<table border='1'><tr><th colspan='4'>일별 박스오피스</th></tr></table>");
				$("#resultArea > table").append(
						"<tr><th width='50'>순위</th>" 
						+ "<th width='500'>영화명</th>" 
						+ "<th width='150'>개봉일</th>" 
						+ "<th width='100'>누적관객수</th></tr>");
				
				// json_data7.txt 의 박스오피스 일부 정보를 추출하여 출력
				// => 파라미터로 전달받은 data 변수가 JSON 객체(박스오피스 정보)를 저장하고 있으므로
				//    별도의 파싱 등이 추가로 불필요하며 즉시 JSON 객체 형태에서 가공 가능
				
				// 영화 일별 박스 오피스 정보 전체 파싱 후 각 데이터 추출
				// => 객체(data)명.키 의 형태로 접근하여 추출"C:/Users/ITWILL/Desktop/test7_json.jsp"
				// 1. 전체 조회 결과에 해당하는 "boxOfficeResult" 키(Key) 추출
				let boxOfficeResult = data.boxOfficeResult;
// 				alert(JSON.stringify(boxOfficeResult));

				// 2. 추출된 전체 조회 결과에서 항목별 추출
				// => boxofficeType, showRange, dailyBoxOfficeList
				let boxofficeType = boxOfficeResult.boxofficeType;
				let showRange = boxOfficeResult.showRange;
				let dailyBoxOfficeList = boxOfficeResult.dailyBoxOfficeList;
// 				alert(JSON.stringify(boxofficeType) + "\n" + JSON.stringify(showRange) + "\n" + JSON.stringify(dailyBoxOfficeList))

				// 3. dailyBoxOfficeList 객체에 저장되어 있는 박스오피스 목록(영화 목록) 데이터 추출
				// => 배열([]) 형태의 객체이므로 배열 접근 방법을 통해 접근
// 				for(let i = 0; i < dailyBoxOfficeList.length; i++) {
// 					// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
// 					let rnum = dailyBoxOfficeList[i].rnum;
// 					let rank = dailyBoxOfficeList[i].rank;
// 					let movieNm = dailyBoxOfficeList[i].movieNm;
// 					let openDt = dailyBoxOfficeList[i].openDt;
// 					let audiAcc = dailyBoxOfficeList[i].audiAcc;
					
// 					// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
// 					$("#resultArea > table").append(
// 							"<tr><td>" + rank + "</td>" 
// 							+ "<td>" + movieNm + "</td>"
// 							+ "<td>" + openDt + "</td>" 
// 							+ "<td>" + audiAcc + "명</td></tr>"
// 					);
// 				}
				
				for(let boxOffice of dailyBoxOfficeList ) {
					// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
					let rnum = boxOffice.rnum;
					let rank = boxOffice.rank;
					let movieNm = boxOffice.movieNm;
					let openDt = boxOffice.openDt;
					let audiAcc = boxOffice.audiAcc;
					let movieCd = boxOffice.movieCd
					// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
					$("#resultArea > table").append(
							"<tr><td>" + rank + "</td>" 
							+ "<td><a href='test7_json_movie_detail.jsp?movieCd=" + movieCd +"'>" +  movieNm + "</a></td>"
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
	<h1>test7_json.jsp - 일간 박스오피스 순위</h1>
	<input type="button" value="박스오피스 조회" id="btnOk"><br>
	<div id="resultArea"></div>
</body>
</html>












