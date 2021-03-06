package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// JDBC 활용 시 데이터베이스 접근 관련 작업을 수행하는 용도의 클래스 정의
// => DB 접속, DB 자원 반환, 커밋 또는 롤백 작업 등을 수행
public class JdbcUtil {
	// 1. DB 접속을 수행하는 getConnection() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : java.sql.Connection
	// => DB 접속을 수행하여 접속 성공 시 접속 정보를 객체로 관리하는 Connection 타입 객체를 외부로 리턴
	public Connection getConnection() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp3";
		String user = "root";
		String password = "1234";
		
		// java.sql.Connection 타입 객체를 저장할 변수 선언
		Connection con = null;
		
		try { // 예외(= 오류)가 발생할 것으로 예상되는 코드들을 모아놓는 곳(= 예외가 발생하는지를 탐지하는 곳)
			// 1단계. JDBC 드라이버 클래스 로드
			Class.forName(driver); 
			// 드라이버 클래스 위치가 잘못되었을 경우 ClassNotFoundException 예외 발생할 수 있음
			// => 따라서, try ~ catch 블록을 사용하여 catch 블록에서 ClassNotFoundException 발생에 대한 대비책을 세워야함 
			// => try 블록 내에서 현재 예외 위치 아래쪽의 코드 실행이 중지되고 catch (ClassNotFoundException e) {} 부분으로 흐름이 이동함
			
			// 2단계. DB 접속
			con = DriverManager.getConnection(url, user, password);
			// DB 접속이 실패했을 경우 SQLException 예외 발생할 수 있음
			// => 따라서, try ~ catch 블록을 사용하여 catch 블록에서 SQLException 발생에 대한 대비책을 세워야함
			// => DB 접속 정보(URL, 계정명, 패스워드) 중 하나라도 잘못되면 문제가 발생하므로 처리 필요
			// => 현재 예외가 발생하는 위치 아래쪽의 코드 실행이 중지되고 catch (SQLException e) {} 부분으로 흐름이 이동함
		} catch (ClassNotFoundException e) {
			// 드라이버 클래스 위치가 잘못되었을 경우 자동으로 실행되는 코드 위치
			e.printStackTrace();
			System.out.println("드라이버 로드 실패!");
		} catch (SQLException e) {
			// DB 접속이 불가능할 경우(정보가 틀렸을 경우) 자동으로 실행되는 코드 위치
			e.printStackTrace();
			System.out.println("DB 접속 실패!");
		}
		
		// Connection 객체 리턴
		return con;
		
	}
}















