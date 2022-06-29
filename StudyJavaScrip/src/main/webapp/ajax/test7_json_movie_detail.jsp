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
// 		alert("영화 코드 : " + ${param.movieCd});
		
		
			$.ajax({
				type: "GET",
				// 실제 영화 정보 API URL 을 사용하여 요청할 경우
				url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=${param.movieCd}",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
// 				alert(JSON.stringify(data));
				$("#resultArea").html("<table border='1'><tr><th colspan='4'>영화 상세정보</th></tr></table>");
				$("#resultArea > table").append(
						"<tr><th width='500'>영화명</th>" 
						+ "<th width='150'>개봉일</th>" 
						+ "<th width='150'>감독</th>" 
						+ "<th width='150'>출연진</th></tr>");
				
				// 영화 상제 정보 전체 파싱 후 각 데이터 추출
				let movieInfo = data.movieInfoResult.movieInfo; // 하위 객체 직접 추출 가능
// 				alert(JSON.stringify(movieInfo));
				
				// 영화 상세 정보 추출
// 				let movieNm = movieInfo.movieNm;
// 				let movieNmEn = movieInfo.movieNmEn;
				let movieNm = movieInfo.movieNm + "(" + movieInfo.movieNmEn + ")";
				let openDt = movieInfo.openDt;
				
				// 영화 감독은 복수개의 객체일 수 있으므로 배열로 제공됨
				let directors = ""; // 초기값으로 널스트링 저장 필수!
				for(let director of movieInfo.directors) {
					directors += director.peopleNm + " ";
				}
				
				// 영화 배우는 복수개의 객체일 수 있으므로 배열로 제공됨
				let actors = ""; // 초기값으로 널스트링 저장 필수!
				for(let actor of movieInfo.actors) {
					actors += actor.peopleNm + " ";
				}
				
				$("#resultArea > table").append(
						"<tr><td>" + movieNm + "</td>" 
						+ "<td>" + openDt + "</td>" 
						+ "<td>" + directors + "</td>" 
						+ "<td>" + actors + "</td></tr>");
				
			})
			.fail(function() {
				// 요청 실패 시 자동으로 호출되는 함수 정의
				$("#resultArea").html("요청 실패");
			});
		
	});
</script>
</head>
<body>
	<h1>test8_json.jsp - 일간 박스오피스 순위</h1>
	
	<div id="resultArea"></div>
</body>
</html>












