<%@page import="jsp14_java_mail.GoogleSMTPAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String sender = request.getParameter("sender");
String receiver = request.getParameter("receiver");
String title = request.getParameter("title");
String content = request.getParameter("content");


try {
	// -------- 메일 전송에 필요한 설정 작업 ---------
	// 메일 전송 프로토콜 :SMTP(Simple Mail Transport Protocol)
	Properties properties = System.getProperties();

	// TLS 인증 관련 설정
	properties.put("mail.smtp.starttls.enable", "true");
	properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
	// 메일 전송에 사용할 메일서버 지정(Gmail, 네이버, 네이트, 아웃룩 등)
	properties.put("mail.smtp.host", "smtp.gmail.com"); // 구글(Gmail) 메일 발송 서버 주소 지정
	properties.put("mail.smtp.auth", "true"); // 인증 여부 설정(로그인 필요 시)
	properties.put("mail.smtp.port", "587"); // 메일 전송에 사용될 서비스 포트 설정

	// 메일 서버에 대한 인증 정보를 관리하는 사용자 정의 클래스의 인스턴스 생성(GoogleSMTPAuthenticator)의 인스턴스 생성 
	Authenticator authenticator = new GoogleSMTPAuthenticator(request); // 업캐스팅 
	// 만약,외부파일로부터 아이디,패스워드
	
	// 자바 메일의 기본 전송 단위를 javax.mail.Session 객체 단위로 관리
	// => Session 클래스의 getDefaultInstance() 메서드를 호출하여파라미터로

	// (주의! 변수명은 session 외의 다른 이름 사용필수! => HttpSession 내장객체 변수명이 존재함)
	Session mailSession = Session.getDefaultInstance(properties, authenticator);

	// Message 정보를 관리할 javax.mail.internet.MimeMessage 객체 생성
	// => MimeMessage 객체를 사용하여 전송할 메일에 대한 정보 설정 가능
	Message mailMessage = new MimeMessage(mailSession);

	// 전송할 메일에 대한 정보 설정
	// 1. 발신자 정보 설정(발신자 정보를 관리하기 위한 InternetAddress 객체 생성)
	// => 단, 스팸 메일 정책으로 인해 상용 메일 사이트(구글 등)는 발신자 주소 변경불가능
	Address sender_address = new InternetAddress(sender, "아이티윌"); // 두번째 파라미터는 변경 가능

	// 2. 수신자 정보 설정
	Address receiver_address = new InternetAddress(receiver);

	// 3. Message 객체를 통해 전송할 메세지정보 설정
	// 1) 메일 헤더 정보 설정
	mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
	// 2) 발신자 정보 설정
	mailMessage.setFrom(sender_address);
	// 3) 수신자 정보 설정 (RecipientType의 TO 상수와 수신자 주소전달)
	mailMessage.addRecipient(RecipientType.TO, receiver_address);

	// 4) 메일 제목 설정
	mailMessage.setSubject(title);

	// 5) 메일 본문 설정
	mailMessage.setContent(content, "text/html; charset=UTF-8");

	// 6) 메일 전송 날짜 정보 설정(java.util.Date 객체를 활용)
	mailMessage.setSentDate(new Date());

	// 4. 메일 전송

	Transport.send(mailMessage);
	out.println("<h3>메일이 정상적으로 전송되었습니다!</h3>");
} catch (Exception e) {
	e.printStackTrace();
	out.println("<h3>SMTP 서버 설정 또는 서비스 문제 발생!</h3>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>