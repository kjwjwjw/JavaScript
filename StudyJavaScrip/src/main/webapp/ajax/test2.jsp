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
		$("#btnOk").on("click" , function() {
			// 폼 파라미터를 test2_result.jsp
			
			$.ajax({
				type: "GET" , 
				url: "test2_result.jsp" ,
				data : {
				
					id : $("#id").val() ,
					passwd : $("#passwd").val() 
				} ,
				dataType : "text" ,
				success : function(msg) { 
					$("#resultArea").html(msg); 
				}		
			});
		});
	});

</script>
</head>
<body>
	<h1> AJAX - test2.jsp </h1>
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