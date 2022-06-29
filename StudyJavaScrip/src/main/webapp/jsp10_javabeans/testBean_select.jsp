
<%@page import="jsp10_javabeans.Test3DTO"%>
<%@page import="jsp10_javabeans.Test3DAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Test3DAO 클래스의 인스턴스 생성 후 select() 메서드를 호출하여 학생 목록 정보 조회 요청
// => 파라미터 : 없음   리턴타입 : java.util.ArrayList(dtoList)
Test3DAO dao = new Test3DAO();
ArrayList dtoList = dao.select();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmDelete(no) {
		if(confirm("삭제하시겠습니까?")) {
			// 삭제를 위해 testBean_delete.jsp 페이지로 이동(파라미터로 번호 전달)
			location.href = "testBean_delete.jsp?no=" + no;
		}
	}
</script>
</head>
<body>
	<h1>학생 목록 정보</h1>
	<table border="1">
		<tr>
			<th width="150">학번</th>
			<th width="150">이름</th>
<!-- 			<th width="100">나이</th> -->
<!-- 			<th width="100">성별</th> -->
			<th></th>
		</tr>	
		<%
		// 배열과 마찬가지로 ArrayList 객체의 크기(size())보다 작을동안 반복
		// => 배열은 배열명.length 속성으로 크기를 알아낼 수 있음
		for(int i = 0; i < dtoList.size(); i++) {
			// dtoList(ArrayList) 객체에는 Test3DTO 객체가 여러개 저장되어 있음
			// => ArrayList 객체의 get() 메서드를 호출하여 저장된 객체를 꺼낼 수 있음
			//    이 때, 파라미터로 객체의 인덱스 지정
			// => get() 메서드를 호출하여 리턴되는 객체를 Test3DTO 타입 변수에 저장해야함
			//    단, ArrayList 객체에 저장 시 add() 메서드는 Object 타입 파라미터를 사용하므로
			//    Test3DTO -> Object 타입으로 업캐스팅 되어있으며
			//    이를 다시 Test3DTO 타입으로 저장하려면 다운캐스팅이 필수!
// 			Test3DTO dto = dtoList.get(i); // 오류 발생! Object -> Test3DTO 타입으로 그냥 저장 불가!

			// Object 타입으로 업캐스팅 된 객체를 Object 타입 변수에 저장할 경우
// 			Object o = dtoList.get(i);
// 			o.getNo(); // 오류 발생 => 슈퍼클래스의 공통된 멤버(상속된 멤버)에만 접근 가능하기 때문
			// 즉, 서브클래스인 Test3DTO 에서 선언한 멤버에는 접근이 불가능
			
			// Object -> Test3DTO 타입으로 다운캐스팅
			Test3DTO dto = (Test3DTO)dtoList.get(i); 
			// => 다운캐스팅 후에는 참조 영역 확대로 인해 기존 객체가 가진 모든 멤버에 접근 가능해짐 
			
			// 다운캐스팅을 가장 안전하게 수행하는 방법
			// => dtoList 객체 내의 객체가 Test3DTO 타입 객체인지를 판별한 후에 다운캐스팅 수행
// 			if(dtoList.get(i) instanceof Test3DTO) {
// 				// instanceof 연산 결과가 true 일 경우 형변환이 가능한 관계이므로 안전함
// 				Test3DTO dto = (Test3DTO)dtoList.get(i);
// 			}
					
			// 테이블에 데이터 표시를 위해 td 태그 내에 Test3DTO 객체의 getXXX() 메서드를 호출하여
			// 저장되어 있는 컬럼 데이터 출력
			// => 이름에 하이퍼링크 설정(testBean_select_detail.jsp 페이지로 포워딩)
			//    파라미터로 학번(no)을 전달
			%>
			<tr>
				<td><%=dto.getNo() %></td>
				<td><a href="testBean_select_detail.jsp?no=<%=dto.getNo() %>"><%=dto.getName() %></a></td>
<%-- 				<td><%=dto.getAge() %></td> --%>
<%-- 				<td><%=dto.getGender() %></td> --%>
				<td>
					<!-- 삭제 버튼 클릭 시 testBean_delete.jsp 페이지로 이동(파라미터 : 번호) -->
<%-- 					<input type="button" value="삭제" onclick="location.href='testBean_delete.jsp?no=<%=dto.getNo()%>'"> --%>

					<!-- 삭제 버튼 클릭 시 자바스크립트를 통해 확인 후 삭제하는 경우 -->
					<!-- confirmDelete() 함수 호출 시 파라미터로 삭제할 번호 전달 -->
					<input type="button" value="삭제" onclick="confirmDelete(<%=dto.getNo()%>)">
				</td>
			</tr>	
			<%
		}
		%>
	</table>
</body>
</html>















