package jsp11_board;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

// 메일 서버 인증을 위해 javax.mail.Authenticator 클래스를 상속받는 서브클래스 정의
public class GoogleSMTPAuthenticator extends Authenticator {
	// 인증 정보(아이디, 패스워드)를 관리할 PasswordAuthentication 클래스 타입 변수
	PasswordAuthentication passwordAuthentication;

	
	
	// 기븐 생성자 정의
//	public GoogleSMTPAuthenticator() {
//		
////		passwordAuthentication = new PasswordAuthentication("계정명" ,"비밀번호" );
////		passwordAuthentication = new PasswordAuthentication("junwoo960214" ,"pzuekbbmokjrhpbw" );
//		
//		// 아이디, 패스워드 외부 파일로부터 읽어들여 사용할 경우
//		// => java.util.Properties 클래스 활용
//		
//	}
	
	public GoogleSMTPAuthenticator(HttpServletRequest request) throws Exception {
		Properties properties = new Properties();
		
		ServletContext context = request.getServletContext(); // 톰캣 객체 가져오기
		String realPath = context.getRealPath("WEB-INF"); // 루트의 WEB-INF 폴더의 실제 경로 알아내기
//		System.out.println(realPath);
		// => 파라미터로 FileReader 객체 생성하여 파일이 위치한 경로를 전달
		properties.load(new FileReader(realPath+ "/application-data.properties"));
		
		// 3. 읽어들인 파일로부터 원하는 키를 사용하여 데이터 가져오기
		// => Properties 객체의 getProperty() 메서드를 호출하여 키를 파라미터로 전달
		String id = properties.getProperty("id");
		String passwd = properties.getProperty("passwd");
//		System.out.println(id+ "," + passwd);
		
		// 4. PasswordAuthentication 객체 생성(파라미터로 읽어들인 정보 전달)
		passwordAuthentication = new PasswordAuthentication(id, passwd );
		
	}
	
	// 인증 정보를 외부러 리턴하는 getPasswordAuthentication() 메서드 오버라이딩
	// => 주의! 변수명이 달라질 수 있으므로 Getter 메서드를 정의하는 것은 좋지 않다!
	GenerateAuthenticationCode genCode = new GenerateAuthenticationCode();
	String code = genCode.getAutenticationCode();

	
@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
	
}
