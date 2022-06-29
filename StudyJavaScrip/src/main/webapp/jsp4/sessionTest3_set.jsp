<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest3_set.jsp</h1>
	<%
	// sessionTest3.jsp 페이지로부터 전달받은 파라미터(product_id, qty)값을
	// 변수에 저장한 후 출력하기
	String product_id = request.getParameter("product_id");
	String qty = request.getParameter("qty");
	
	// 세션 객체에 장바구니 항목을 추가
	// 속성명 "product_id" 와 "qty" 에 각 변수값을 저장
	session.setAttribute("product_id", product_id);
	session.setAttribute("qty", qty);
	%>
	<h3>장바구니 추가가 완료되었습니다.</h3>
	<table border="1">
		<tr>
			<td>상품명</td>
			<td><%=product_id %></td>
		</tr>
		<tr>
			<td>수량</td>
			<td><%=qty %></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="장바구니목록" onclick="location.href='sessionTest3_get.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>











