<%@page import="jsp16_oracle_jdbc.EmployeesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp16_oracle_jdbc.EmployeesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {
		text-align: center;
	}
</style>
</head>
<body>
	<h1>직원 리스트</h1>
	<%
	EmployeesDAO dao = new EmployeesDAO();
	ArrayList<ArrayList> employeesInfo = dao.getEmployeesList();
	
	// 컬럼명 목록 꺼내서 저장
	ArrayList<String> columnNameList = employeesInfo.get(0);
	// 직원 목록 꺼내서 저장
	ArrayList<EmployeesBean> employeesList = employeesInfo.get(1);
	%>
	<table border="1">
		<tr>
			<%for(String columnName : columnNameList) { %>
				<th><%=columnName %></th>
			<%} %>
		</tr>
		<%for(EmployeesBean employee : employeesList) { %>
			<tr>
				<td><%=employee.getEmployee_id() %></td>
				<td><%=employee.getFirst_name() %></td>
				<td><%=employee.getLast_name() %></td>
				<td><%=employee.getEmail() %></td>
				<td><%=employee.getPhone_number() %></td>
				<td><%=employee.getHire_date() %></td>
				<td><%=employee.getJob_id() %></td>
				<td><%=employee.getSalary() %></td>
				<td><%=employee.getCommission_pct() %>%</td>
				<td><%=employee.getManager_id() %></td>
				<td><%=employee.getDepartment_id() %></td>
			</tr>
		<%} %>
	</table>
</body>
</html>



















