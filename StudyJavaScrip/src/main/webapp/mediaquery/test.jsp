<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap{
		width: 100px;
		height : 100px;
		border: 1px solid black;
	
	}
	@media screen and (min-width: 320px) {
			#wrap{
				width: 30%;
				height : 200px;
				border: 1px solid black;
				background: red ;
			
			}
					
	}
	
	@media screen and (min-width: 768px) {
			#wrap{
				width: 60%;
				height : 200px;
				border: 1px solid black;
				background: blue;
			
			}
					
	}
	
	@media screen and (min-width: 1024px) {
			#wrap{
			
				width: 90%;
				height : 800px;
				border: 1px solid black;
				background: green ;
			
			}
					
	}

</style>
</head>
<body>
	<div id="wrap">
	
	
	</div>

</body>
</html>