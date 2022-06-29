package ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	// 회원 가입을 수행하는 insert() 메서드 정의
	// => 파라미터 : MemberDTO 객체(member), 리턴타입 : int(insertCount)
	public int insert(MemberDTO member) {
		int insertCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => MemberDTO 객체에 저장된 아이디, 패스워드 이름, 이메일, 전화번호를 추가하고
			//    가입일(date)의 경우 데이터베이스에서 제공되는 now() 함수 사용하여 자동 생성
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			
			// 4단계. SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - insert()");
		} finally {
			// DB 자원 반환
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 로그인 작업 수행 후 결과를 boolean 타입으로 리턴하는 login() 메서드 정의
	public boolean login(String id, String passwd) {
		// 로그인 결과를 저장할 변수 isLoginSuccess 선언
		boolean isLoginSuccess = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// => member 테이블의 id 컬럼 조회(단, id 와 passwd 가 일치하는 레코드 조회)
			String sql = "SELECT id FROM member WHERE id=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			// 조회 결과가 존재할 경우(= rs.next() 가 true 일 경우)
			// isLoginSuccess 변수값을 true 로 변경
			if(rs.next()) {
				isLoginSuccess = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - login()");
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isLoginSuccess;
	}
	
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			// JdbcUtil 클래스의 getConnection() 메서드를 호출하여 Connection 객체 가져오기
			con = JdbcUtil.getConnection();
			
			// 3단계. SQL 구문 작성 및 전달
			// id 가 일치하는 레코드 조회
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 레코드(아이디)가 존재할 경우 아이디가 중복이므로 isDuplicate 을 false 로 변경
			if(rs.next()) {
				isDuplicate = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isDuplicate;
	}
	
}
















