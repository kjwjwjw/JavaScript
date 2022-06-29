<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function plusQty() {
// 		var qty = document.fr.qty.value;
		
		var qtyElem = document.fr.qty;
		var qty = qtyElem.value;
		// 폼 데이터 접근하여 value 값 가져오면 string 타입이므로 연산 시 정수형으로 변환 필요
		qtyElem.value = Number(qty) + 1; // 1만큼 증가시킨 값을 다시 표시
	}
	
	function minusQty() {
		var qtyElem = document.fr.qty;
		var qty = qtyElem.value;
		
		// 현재 수량이 1보다 클 경우에만 감소
		if(qty > 1) {
			qtyElem.value = Number(qty) - 1; // 1만큼 감소시킨 값을 다시 표시
		}
	}
</script>
</head>
<body>
	<h1>sessionTest3.jsp</h1>
	<form action="sessionTest3_set.jsp" name="fr">
		<input type="hidden" name="product_id" value="펭수1">
		<table border="1">
			<tr>
				<td><img src="1.jpg" width="200" height="200"></td>
				<td>상품 설명입니다</td>
			</tr>
			<tr>
				<td colspan="2">
					수량 : <input type="text" name="qty" value="1">
					<input type="button" value="▲" onclick="plusQty()">
					<input type="button" value="▼" onclick="minusQty()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="장바구니담기">
					<input type="button" value="즉시주문">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>











