<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 이 곳은 JSP 선언문(Declaration)으로 JSP 파일 전체(전역)에서 접근 가능한
// 멤버변수 및 메서드를 선언하는 곳입니다.
// => 자바 클래스 내의 멤버레벨(클래스 내부, 메서드 외부)에 변수 및 메서드가 위치하는 것과 동일
// 1. 멤버변수 선언
String str1 = "멤버(전역) 변수입니다.";
// 2. 메서드 정의
public void method1() {
	System.out.println("선언문의 method1() 메서드 호출됨!");
}

public String method2() {
	// "method2() 메서드의 리턴값" 문자열을 외부로 리턴
	return "method2() 메서드의 리턴값";
}
%>  
<%! String str2 = "두번째 멤버(전역) 변수입니다."; %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test03.jsp</h1>
	<%--
	표현식 <%= %>
	- 선언문 또는 스크립틀릿에서 선언된 변수에 접근하여 값을 출력하거나
	  메서드 호출 후 리턴되는 값을 전달받아 출력할 수 있다!
	- 자바 코드의 System.out.print() 메서드와 동일한 코드로 동작함
	  (단, System.out.print() 메서드는 이클립스의 콘솔에 데이터가 출력되지만
	   표현식은 웹페이지에 출력하므로 out.print() 메서드와 동일한 역할 수행) 
	--%>
	<h3>멤버변수 str1 = <%=str1 %></h3>
	<h3>method2() 메서드 호출 결과 : <%=method2() %></h3>
	
	<%-- 스크립틀릿 내에서 선언된 로컬변수보다 윗쪽(앞쪽)에서 로컬변수 접근 불가 --%>
<%-- 	<h3>로컬변수 str3 = <%=str3 %></h3> --%>
	
	<%--
	스크립틀릿 <% %>
	- 자바 문장을 그대로 표현 가능한 블럭
	- 스크립틀릿 내부는 자바에서 메서드 내부와 동일한 위치로 취급됨
	  => 메서드 내에서 수행 가능한 작업들을 코드로 기술 가능
	  => 자동 생성된 서블릿 클래스 내의 jsp_service() 메서드 내에 해당 코드가 모두 포함됨
	- 스크립틀릿 내에서 선언되는 변수는 로컬(지역) 변수로 취급되며
	  또한, 메서드는 정의할 수 없다!
	--%>
	<%
	// 이 곳은 스크립틀릿 내부입니다.
	// 변수 선언도 가능하며, 해당 변수는 로컬 변수로 취급됨
	String str3 = "로컬(지역) 변수입니다.";
	
	// 다른 메서드를 호출하거나, 객체 생성 등의 다양한 작업이 가능함
	method1();
	
	System.out.println("이 문장은 이클립스의 콘솔창에 출력됨");
	
	// 만약, 스크립틀릿 내에서 웹페이지(HTML 문서, JSP 문서) 내에 데이터를 표시하고 싶을 경우
	// out.println() 또는 out.print() 메서드를 사용하여 출력(출력 데이터에 문자열로 태그 사용 가능)
	// => HTML 태그보다 자바 데이터가 많을 경우 주로 사용
	// => out.println() 메서드와 out.print() 메서드 모두 줄바꿈은 일어나지 않음
	out.println("<b>스크립틀릿 내에서 출력한 데이터</b>");
	out.print("out.print() 로 출력한 데이터");
	out.print("out.print() 로 출력한 데이터");
	
	// 스크립틀릿 내에서는 메서드 정의 불가(= 자바의 메서드 내에서도 메서드 정의 불가능)
// 	public void method3() {} // 컴파일 에러 발생!
	%>
	
	<%-- 로컬변수는 반드시 변수 선언보다 아래쪽에서만 접근 가능 --%>
	<h3>로컬변수 str3 = <%=str3 %></h3>
	
	<%-- 선언문보다 윗쪽에서 멤버변수에 접근하더라도 접근 가능 --%>
	<h3>멤버변수 str4(선언문보다 위) = <%=str4 %></h3>
	
	<%!String str4 = "멤버변수 str4"; %>
	<h3>멤버변수 str4(선언문보다 아래) = <%=str4 %></h3>
</body>
</html>


















