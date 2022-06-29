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
// 		$("#btnOk").on("click" , function() {
// 			// 폼 파라미터를 test2_result.jsp
			
// 			$.ajax({
// 				type: "GET" , 
// 				url: "test3_result.jsp" ,
// 				data : {
				
// 					id : $("#id").val() ,
// 					passwd : $("#passwd").val() 
// 				} ,
// 				dataType : "text" ,
// 				success : function(msg) { 
// 					$("#resultArea").html(msg); 
// 				}		
// 			});
// 		});
		
		$("#passwd").on("blur" , function() {
			// 폼 파라미터를 test2_result.jsp
			
			$.ajax({
				type: "GET",
				url: "test3_result.jsp",
				data: sendData,
				dataType: "text",
				success: function(msg) { // 요청에 대한 처리 성공 시
					$("#resultArea").html(msg);
				},
				error: function(xhr, textStatus, errorThrown) { // 요청에 대한 처리 실패 시(에러)
					$("#resultArea").html(
							"xhr = " + xhr + "<br>"
							+ "textStatus = " + textStatus + "<br>"
							+ "errorThrown = " + errorThrown);
				}
			});

			});
		});
	});

</script>
</head>
<body>
	<h1> AJAX - test3.jsp </h1>
	<form>
		<table border="1">
			<tr>
				<td>아이디</td><td><input type="text" name="id" id="id" ></td>
				</tr>
				<tr>
				<td>패스워드</td><td><input type="password" name="passwd" id="passwd" ></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="button" value="확인" id="btnOk"></td>
			</tr>
		</table>
	</form>
	<div id="resultArea"></div>

</body>
</html>