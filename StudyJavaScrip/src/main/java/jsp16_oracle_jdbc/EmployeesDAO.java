package jsp16_oracle_jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeesDAO {
	
	public ArrayList<ArrayList> getEmployeesList() {
		// 1단계 & 2단계 작업을 수행할 getConnection() 메서드 호출
		Connection con = JdbcUtil.getConnection();
		
		// 컬럼명 목록과 직원 목록을 함께 저장할 ArrayList 객체 생성
		ArrayList<ArrayList> employeesInfo = new ArrayList<ArrayList>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// employees 테이블 전체 조회 후 ArrayList 객체에 직원 목록 저장
			String sql = "SELECT * FROM employees";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<EmployeesBean> employeesList = new ArrayList<EmployeesBean>();
			
			while(rs.next()) {
				EmployeesBean emp = new EmployeesBean();
				emp.setEmployee_id(rs.getInt(1));
				emp.setFirst_name(rs.getString(2));
				emp.setLast_name(rs.getString(3));
				emp.setEmail(rs.getString(4));
				emp.setPhone_number(rs.getString(5));
				emp.setHire_date(rs.getDate(6));
				emp.setJob_id(rs.getString(7));
				emp.setSalary(rs.getInt(8));
				emp.setCommission_pct(rs.getDouble(9));
				emp.setManager_id(rs.getInt(10));
				emp.setDepartment_id(rs.getInt(11));
				
//				System.out.println(emp);
				
				employeesList.add(emp);
			}
			// --------------------------------------------------------------------------------
			// 조회된 테이블 정보에 대한 부가정보(= 메타데이터) 확인
			// ResultSet 객체의 getMetaData() 메서드를 호출하여 ResultSetMetaData 객체 리턴받기
			ResultSetMetaData rsmd = rs.getMetaData();
//			System.out.println("전체 컬럼 갯수 : " + rsmd.getColumnCount());
			
			// 컬럼 갯수만큼 for문을 통해 반복하면서 컬럼 정보에 접근(컬럼명, 타입 등)
			// => 주의! 배열과 달리 컬럼인덱스는 1부터 시작하므로 1 ~ 카운트까지 반복
			// => 조회된 컬럼명을 columnNameList 객체에 저장(ArrayList 타입)
			ArrayList<String> columnNameList = new ArrayList<String>();
			for(int i = 1; i <= rsmd.getColumnCount(); i++) {
				// getColumnName() 또는 getColumnLable() 메서드를 통해 컬럼명 가져오기
//				System.out.println(rsmd.getColumnName(i) + ", " + rsmd.getColumnLabel(i));
				
				// getColumnType() 메서드는 데이터타입값(코드값)을 가져오며
				// getColumnTypeName() 메서드는 테이터타입이름을 가져옴
//				System.out.println(rsmd.getColumnType(i) + ", " + rsmd.getColumnTypeName(i));
//				System.out.println(rsmd.getColumnTypeName(i) + ", " + rsmd.getColumnDisplaySize(i));
				
				columnNameList.add(rsmd.getColumnName(i));
			}
			// --------------------------------------------------------------------------------
			// 컬럼명목록과 직원목록을 다시 ArrayList 객체(employeesInfo) 에 저장
			employeesInfo.add(columnNameList);
			employeesInfo.add(employeesList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return employeesInfo;
	}
	
}















