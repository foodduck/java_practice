<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("name", "page");
	request.setAttribute("name", "request");
	session.setAttribute("name", "sesssion");
	application.setAttribute("name", "application");
	
	System.out.println("A11Scope1.jsp");
	System.out.println("페이지 객체의 속성 : "+pageContext.getAttribute("name"));
	System.out.println("요청자의 속성 : "+request.getAttribute("name"));
	System.out.println("세션의 속성 : "+session.getAttribute("name"));
	System.out.println("애플리케이션의 속성 : "+application.getAttribute("name"));
	request.getRequestDispatcher("A11Scope2.jsp").forward(request, response);
%>
