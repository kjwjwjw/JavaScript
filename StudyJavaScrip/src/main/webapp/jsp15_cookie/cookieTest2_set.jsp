<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie cookie = new Cookie("language", request.getParameter("lang"));
cookie.setMaxAge(60*60*24);
response.addCookie(cookie);
response.sendRedirect("cookieTest2.jsp");
%>