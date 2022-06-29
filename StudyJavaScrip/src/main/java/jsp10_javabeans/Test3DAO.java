package jsp10_javabeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Test3DAO {
	
	// ----------------------- 기초 설명을 위한 주석 포함 -------------------------
	// 회원 추가 작업을 수행하는 insert() 메서드 정의
	// => 파라미터 : 회원 정보가 저장된 Test3DTO 객체(dto), 리턴타입 : int
//	public int insert(Test3DTO dto) {
//		int insertCount = 0;
//		
//		// finally 블록에서 close() 메서드를 호출하여 자원을 반환하기 위해서는
//		// try 블록 바깥(위)쪽에서 Connection, PreparedStatement 등의 변수 선언 필요
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			// ----------------------------------------------------------------
//			// 모듈화 없이 JDBC 연결(1단계 & 2단계)을 수행할 경우
////			String driver = "com.mysql.jdbc.Driver";
////			String url = "jdbc:mysql://localhost:3306/study_jsp3";
////			String user = "root";
////			String password = "1234";
//			
//			// 1단계. 드라이버 클래스 로드
////			Class.forName(driver);
//			
//			// 2단계. DB 연결
////			Connection con = DriverManager.getConnection(url, user, password);
//			// ----------------------------------------------------------------
//			// 모듈화를 통해 JDBC 연결(1단계 & 2단계)을 JdbcUtil 클래스 내에서 수행하고
//			// 연결 성공 시 리턴되는 Connection 객체를 리턴받아 DB 작업을 수행할 경우
//			// 1. JdbcUtil 클래스 인스턴스 생성
////			JdbcUtil jdbcUtil = new JdbcUtil();
//			// 2. JdbcUtil 인스턴스의 getConnection() 메서드를 호출하여 
//			//    DB 접속을 수행하고 성공 시 Connection 객체 리턴받기
////			Connection con = jdbcUtil.getConnection();
//			
//			// JdbcUtil 클래스 인스턴스 생성없이 클래스명만으로 접근하여 메서드 호출할 경우
//			// => JdbcUtil 클래스의 메서드들을 static 메서드로 선언해야함
////			Connection con = JdbcUtil.getConnection();
//			con = JdbcUtil.getConnection();
//			// ----------------------------------------------------------------
//			// 3단계. SQL 구문 작성 및 전달
//			String sql = "INSERT INTO test3 VALUES(?,?,?,?)";
////			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt = con.prepareStatement(sql);
//			
//			// 만능문자(?) 파라미터 데이터 교체
//			// => 현재 메서드(insert()) 호출 시 전달받은 Test3DTO 객체로부터 데이터 꺼내기
//			pstmt.setInt(1, dto.getNo());
//			pstmt.setString(2, dto.getName());
//			pstmt.setInt(3, dto.getAge());
//			pstmt.setString(4, dto.getGender());
//			
//			// 4단계. SQL 구문 실행 및 결과 처리
//			insertCount = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// 예외 발생 시(SQLException) 실행될 코드들의 위치(예외 미발생 시 실행되지 않음)
//			e.printStackTrace(); // 예외 발생 정보를 추적하여 모든 내용을 콘솔에 출력해줌
////			System.out.println(e.getMessage()); // 예외 발생 메세지를 리턴받아 콘솔에 직접 출력
//			System.out.println("SQL 구문 오류 발생! - insert()");
//		} finally {
//			// 예외 발생 여부와 관계없이 실행될 코드들의 위치
//			// => 주로, 데이터베이스 작업 시 데이터베이스 관련 자원들을 반환하는 코드를 기술
//			// => Connection, PreparedStatement, ResultSet 등 DB 자원을 관리하는 객체의
//			//    close() 메서드를 호출하여 자원을 반환
//			//    단, 자원 반환 순서는 객체 생성 순서의 역순으로 반환해야함
////			pstmt.close(); // 반환할 자원이 없을 경우 SQLException 발생할 수 있음
////			con.close(); 
//			
//			// 반환할 자원이 존재할 경우(= null 이 아닐 경우)에만 자원반환 수행
////			if(pstmt != null) {
////				try {
////					pstmt.close();
////				} catch (SQLException e) {
////					e.printStackTrace();
////				}
////			}
//			
////			if(con != null) {
////				try {
////					con.close();
////				} catch (SQLException e) {
////					e.printStackTrace();
////				}
////			}
//			
//			// JdbcUtil 클래스 내에 오버로딩 된 close() 메서드(static 메서드)를 호출하여
//			// Connection 및 PreparedStatement 객체 반환(= 역순으로 반환)
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(con);
//			
//		}
//		
//		return insertCount;
//	}
	// --------------------------------------------------------------------------------
	// 회원 추가 작업을 수행하는 insert() 메서드 정의
	// => 파라미터 : 회원 정보가 저장된 Test3DTO 객체(dto), 리턴타입 : int
	public int insert(Test3DTO dto) {
		int insertCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			String sql = "INSERT INTO test3 VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getAge());
			pstmt.setString(4, dto.getGender());
			
			// 4단계. SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - insert()");
		} finally {
			// DB 자원 반환 - JdbcUtil 클래스의 static 메서드 close() 호출(오버로딩) - 역순으로
			// => 예외 발생 여부와 관계없이 수행하기 위해 finally 블록에서 호출
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
		// => testBean_insert_pro.jsp 페이지의 int insertCount = dao.insert(dto); 코드로 돌아감
	}
	
	// 회원 정보 조회하여 리턴하는 select() 메서드 정의
	public ArrayList select() {
//		System.out.println("Test3DAO - select()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 전체 레코드(전체 회원 목록 정보)를 저장하는데 사용될 java.util.ArrayList 타입 변수 선언
		ArrayList dtoList = null;
		
		try {
			// 1단계 & 2단계 - JdbcUtil 클래스의 getConnection() 메서드 호출
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => test3 테이블의 모든 레코드 조회
			String sql = "SELECT * FROM test3";
			pstmt = con.prepareStatement(sql);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			// 전체 레코드를 저장하기 위해 ArrayList 객체 생성
			// 주의! 반복문을 통해 Test3DTO 객체를 차례대로 저장해야하므로
			// 반복문보다 윗쪽(반복문의 바깥)에서 생성해야함
			dtoList = new ArrayList();
			
			// while 문을 사용하여 ResultSet 객체의 다음 레코드가 존재할 동안 반복
			while(rs.next()) { // 커서를 다음 레코드로 이동시켰을 때 존재할 경우 true 리턴됨
				// ResultSet 객체에 저장되어 있는 테이블 정보를 가공하여 외부로 리턴할 객체 생성
				// 1) 1개 레코드 정보를 저장하기 위한 DTO(Test3DTO) 객체 생성
				Test3DTO dto = new Test3DTO();
				
				// 2) Test3DTO 객체에 ResultSet 객체로부터 꺼낸 데이터 저장
				//    => ResultSet 객체의 getXXX() 메서드를 호출하여 데이터를 꺼내고(XXX : 타입명)
				//       Test3DTO 객체의 setXXX() 메서드를 호출하여 데이터 저장(XXX : 변수명)
				// 2-1) ResultSet 객체의 getInt() 메서드를 호출하여 번호를 꺼내고
				//      Test3DTO 객체의 setNo() 메서드를 호출하여 꺼낸 번호를 저장하기
				dto.setNo(rs.getInt("no"));
				// 2-2) 이름 : rs.getString(), dto.setName()
				dto.setName(rs.getString("name"));
				// 2-3) 나이 : rs.getInt(), dto.setAge()
				dto.setAge(rs.getInt("age"));
				// 2-4) 성별 : rs.getString(), dto.setGender()
				dto.setGender(rs.getString("gender"));
				
				// 3) 복수개의 Test3DTO 객체를 하나로 묶기 위해 ArrayList 객체 생성 후
				//    ArrayList 객체에 Test3DTO 객체를 차례대로 추가
				//    => ArrayList 객체의 add() 메서드를 호출하여 파라미터로 DTO 객체 전달
//				Object o = dto; // Test3DTO -> Object 타입으로 업캐스팅 발생
				dtoList.add(dto); // Test3DTO -> Object 타입으로 업캐스팅 발생
				// 이 과정을 반복하면 test3 테이블의 모든 레코드가 
				// Test3DTO 객체에 하나씩 저장되고, Test3DTO 객체를 차례대로 ArrayList 에 저장하게됨
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - select()");
		} finally {
			// DB 자원 반환(Connection, PreparedStatement, ResultSet => 역순)
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		// 전체 레코드가 저장된 ArrayList 객체 리턴
		return dtoList;
		
	}
	
	public Test3DTO selectDetail(int no) {
		Test3DTO dto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1단계 & 2단계
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => test3 테이블의 번호(no)에 해당하는 레코드 조회
			String sql = "SELECT * FROM test3 WHERE no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			// 반복 작업이 아니므로 while문 대신 if문 사용 가능
			if(rs.next()) {
				// 조회 결과(번호, 이름, 나이, 성별)를 Test3DTO 객체에 저장
				dto = new Test3DTO();
				dto.setNo(rs.getInt("no")); // 파라미터로 전달받았으므로 생략 가능
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - selectDetail()");
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		// 1개 레코드가 저장된 Test3DTO 객체 리턴
		return dto;
	}
	
	
	public int update(Test3DTO dto) {
		int updateCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => 번호에 해당하는 레코드의 이름, 나이, 성별을 수정(UPDATE)
			String sql = "UPDATE test3 SET name=?,age=?,gender=? WHERE no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getAge());
			pstmt.setString(3, dto.getGender());
			pstmt.setInt(4, dto.getNo());
			
			// 4단계. SQL 구문 실행 및 결과 처리
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - selectDetail()");
		} finally {
			// 자원 반환
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
//	public int delete(Test3DTO dto) { }
	
	public int delete(int no) { 
		int deleteCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => 번호에 해당하는 레코드 삭제(DELETE)
			String sql = "DELETE FROM test3 WHERE no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - delete()");
		} finally {
			// 자원 반환
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return deleteCount;
	}
	
}
















