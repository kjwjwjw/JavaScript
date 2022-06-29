<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest3_get.jsp - 장바구니 목록</h1>
	<%
	// 세션 객체에 저장된 product_id, qty 속성을 가져와서 변수에 저장
	String product_id = (String)session.getAttribute("product_id");
	String qty = (String)session.getAttribute("qty");
	%>
	<table border="1">
		<tr>
			<td>상품명</td>
			<td><%=product_id %></td>
		</tr>
		<tr>
			<td>수량</td>
			<td><%=qty %></td>
		</tr>
	</table>
</body>
</html>