package ajax;

import java.sql.Date;

/*
 * member 테이블 정의
 * 1. 아이디 - id 컬럼(문자 16자) 주키(Primary key)로 지정
 * 2. 패스워드 - passwd 컬럼(문자 16자) null값금지(NOT NULL 제약조건)
 * 3. 이름 - name 컬럼(문자 10자) (NOT NULL 제약조건)
 * 4. 이메일 - email 컬럼(문자 50자) 중복금지(UNIQUE 제약조건), null값금지(NOT NULL 제약조건)
 * 5. 전화번호 - phone 컬럼(문자20자) 중복금지(UNIQUE 제약조건), null값금지(NOT NULL 제약조건)
 * 6. 가입일 - date 컬럼(날짜 - DATE)
 * 
  CREATE TABLE member (
  		id VARCHAR(16) PRIMARY KEY,
  		passwd VARCHAR(16) NOT NULL,
  		name VARCHAR(10) NOT NULL,
  		email VARCHAR(50) UNIQUE NOT NULL,
  		phone VARCHAR(20) UNIQUE NOT NULL,
  		date DATE
  );
 */

public class MemberDTO {
	// member 테이블 컬럼에 대응하는 멤버변수 선언
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String phone;
	private Date date;
	
	// 기본생성자
	public MemberDTO() {}

	// 파라미터 생성자
	public MemberDTO(String id, String passwd, String name, String email, String phone) {
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public MemberDTO(String id, String passwd, String name, String email, String phone, Date date) {
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.date = date;
	}

	// Getter/Setter 정의
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
