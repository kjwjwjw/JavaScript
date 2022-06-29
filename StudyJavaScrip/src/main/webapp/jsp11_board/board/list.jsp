
<%@page import="jsp11_board.BoardDTO"%>
<%@page import="jsp11_board.BoardDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// BoardDAO 객체의 selectList() 메서드를 호출하여 전체 레코드 조회 요청
// => 파라미터 : 없음    리턴타입 : List(boardList)
BoardDAO dao = new BoardDAO();
// List boardList = dao.selectList();

// 컬렉션 객체들(List 등)은 선언 및 객체 생성 시 제네릭타입으로 저장되는 데이터의 타입 지정 가능함
// => 컬렉션클래스명 뒤에 <> 기호 사이에 저장될 객체의 타입을 지정 가능
//    ex) List 객체에 저장될 데이터가 BoardDTO 타입일 경우 List<BoardDTO> 형태로 명시
List<BoardDTO> boardList = dao.selectList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글목록</h1>
	<table border="1">
		<tr>
			<th width="150">작성자</th>
			<th width="300">제목</th>
			<th width="500">내용</th>
		</tr>
		<%
		// List 객체 크기만큼 for문을 사용하여 반복
		for(int i = 0; i < boardList.size(); i++) {
			// ArrayList(boardList) 객체에서 1개 레코드를 저장한 BoardDTO 객체 꺼내기
			// => ArrayList 객체의 get() 메서드를 호출하여 인덱스 지정
// 			BoardDTO board = (BoardDTO)boardList.get(i); // 다운캐스팅 필수!
			// --------------------------------------------------------------------------
			// List 객체에 제네릭 타입으로 BoardDTO 타입을 선언한 경우
			// Object 타입으로 업캐스팅 된 객체가 아닌 BoardDTO 객체 그대로 저장되어 있으므로
			// 꺼낸 후 다운캐스팅이 불필요하다!
			BoardDTO board = boardList.get(i);
			%>
			<tr>
				<td><%=board.getName() %></td>
				<td><%=board.getSubject() %></td>
				<td><%=board.getContent() %></td>
			</tr>
			<%	
		}
		%>
	</table>
</body>
</html>













