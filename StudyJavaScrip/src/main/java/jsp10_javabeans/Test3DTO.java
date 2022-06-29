package jsp10_javabeans;

// test3 테이블에 사용될 데이터를 관리하는 Test3DTO 클래스 정의
public class Test3DTO {
	// test3 테이블의 각 컬럼에 대응하는 인스턴스 멤버변수 선언
	// => 외부에서 접근하지 못하도록 접근제한자를 private 으로 선언
	private int no;
	private String name;
	private int age;
	private String gender;
	
	// 생성자를 별도로 정의하지 않으면 컴파일러에 의해 기본생성자가 자동 정의됨
	// => 단, 파라미터 생성자를 정의할 경우 관례적으로 기본생성자도 정의해야함

	// private 으로 선언된 멤버변수를 대신 접근할 Getter/Setter 정의
	// => 누구나 접근 가능하도록 접근제한자를 public 으로 선언
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

}
