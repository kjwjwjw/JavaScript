<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h1>includeTest3.jsp - 메인(템플릿)페이지</h1>
	<table border="1">
		<tr>
			<td colspan="2" width="1200" height="150">
				<%-- 테이블 상단에 include_top.jsp 페이지 포함시키기 --%>
				<%-- 단, 포함할 페이지에 id 파라미터로 "admin" 값 전달하기 --%>
				<%-- include_top.jsp 페이지에서 id 파라미터 가져와서 출력하기 --%>
				<jsp:include page="include_top.jsp">
					<jsp:param name="id" value="admin"/>
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td width="200" height="400">
				<%-- 테이블 좌측에 include_left.jsp 페이지 포함시키기 --%>
				<jsp:include page="include_left.jsp" />
			</td>
			<td width="1000" height="400">
				<h3>includeTest3.jsp 본문</h3>
			</td>
		</tr>
		<tr>
			<td colspan="2" width="1200" height="150">
				<%-- 테이블 하단에 include_bottom.jsp 페이지 포함시키기 --%>
				<jsp:include page="include_bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>






















