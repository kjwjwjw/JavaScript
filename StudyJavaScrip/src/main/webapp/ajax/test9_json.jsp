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
				url: "http://finlife.fss.or.kr/finlifeapi/companySearch.json?auth=2694bf7a09d29a31f7d889823f9ec0cd&topFinGrpNo=020000&pageNo=1",
				dataType: "json" // 응답 데이터가 JSON 형식이므로 JSON 타입 지정
			})
			.done(function(data) { 
				$("#resultArea").html("<table border='1'><tr><th colspan='6'>은행정보</th></tr></table>");
				$("#resultArea > table").append(
						"<tr><th width='50'>순위</th>" 
						+ "<th width='50'>영화명</th>" 
						+ "<th width='50'>영화명</th>" 
						+ "<th width='50'>영화명</th>" 
						+ "<th width='150'>개봉일</th>" 
						+ "<th width='100'>누적관객수</th></tr>");
			
				let result = data.result;


				// 2. 추출된 전체 조회 결과에서 항목별 추출
				// => boxofficeType, showRange, dailyBoxOfficeList
				let prdt_div = result.prdt_div;
				let total_count = result.total_count;
				let max_page_no = result.max_page_no;
				let now_page_no = result.now_page_no;
				let err_cd = result.err_cd;
				let err_msg = result.err_msg;
				let baseList = result.baseList;
// 				alert(JSON.stringify(boxofficeType) + "\n" + JSON.stringify(showRange) + "\n" + JSON.stringify(dailyBoxOfficeList))

				for(let resultrs of baseList ) {
					// JSON 객체 내의 배열에서 i번 인덱스의 객체를 통해 각 속성 값을 변수에 저장
					let dcls_month = resultrs.dcls_month;
					let fin_co_no = resultrs.fin_co_no;
					let kor_co_nm = resultrs.kor_co_nm;
					let dcls_chrg_man = resultrs.dcls_chrg_man;
					let homp_url = resultrs.homp_url;
					let cal_tel = resultrs.cal_tel;
					
					// 저장된 변수값을 차례대로 td 태그를 통해 출력하기
					$("#resultArea > table").append(
							"<tr><td>" + dcls_month + "</td>" 
							+ "<td>" + fin_co_no + "</td>"
							+ "<td>" + kor_co_nm + "</td>"
							+ "<td>" + dcls_chrg_man + "</td>"
							+ "<td>" + homp_url + "</td>" 
							+ "<td>" + cal_tel + "</td></tr>"
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
	<h1>test9_json.jsp - 은행조회</h1>
	<input type="button" value="은행 조회" id="btnOk"><br>
	<div id="resultArea"></div>
</body>
</html>












