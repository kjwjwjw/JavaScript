package jsp11_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	// 글쓰기 작업을 수행할 insert() 메서드 정의
	// => 파라미터 : BoardDTO 객체(board)    리턴타입 : int(insertCount)
	public int insert(BoardDTO board) {
		int insertCount = 0;
		
		// board 테이블에 레코드 추가
		// => 추가 결과를 insertCount 에 저장 후 리턴
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			String sql = "INSERT INTO board VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getPass());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			
			// 4단계. SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - insert()");
			e.printStackTrace();
		} finally {
			// DB 자원 반환
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 전체 레코드를 조회하는 selectList() 메서드 정의
	// => 파라미터 : 없음    리턴타입 : List(boardList) => 제네릭타입 BoardDTO 지정
	public List<BoardDTO> selectList() {
		// List 타입 변수 선언 시 제네릭타입으로 BoardDTO 타입을 지정할 경우
		// 해당 객체의 메서드에 사용되는 Object 타입은 모두 BoardDTO 타입으로 변경됨
		List<BoardDTO> boardList = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			String sql = "SELECT * FROM board";
			pstmt = con.prepareStatement(sql);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 반복문 수행 전 모든 레코드를 저장할 ArrayList 객체 생성
			// => 객체 생성 시 제네릭 타입 지정 가능
			boardList = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
//				String name = rs.getString("name");
//				String pass = rs.getString("pass");
//				String subject = rs.getString("subject");
//				String content = rs.getString("content");
//				System.out.println(name + ", " + pass + ", " + subject + ", " + content);
				
				// 1개 레코드에 해당하는 데이터를 BoardDTO 객체에 저장
				BoardDTO board = new BoardDTO();
				board.setName(rs.getString("name"));
//				board.setPass(rs.getString("pass")); // 패스워드는 불필요하므로 제외
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				
				// 모든 레코드를 저장하는 ArrayList 객체에 1개 레코드를 저장한 BoardDTO 객체 추가
				// 만약, 제네릭타입으로 BoardDTO 타입을 선언했을 경우
				// add() 메서드의 파라미터 타입이 Object 가 아닌 BoardDTO 타입으로 사용됨
				// => 즉, Object 타입이 아닌 자기 자신이므로 업캐스팅이 일어나지 않는다!
				boardList.add(board);
				// 제네릭 타입에 맞지 않는 타입은 사용 불가능
//				boardList.add("홍길동");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectList()");
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return boardList;
	}
	
	
}















