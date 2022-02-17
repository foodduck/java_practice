<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	int qty = Integer.parseInt(request.getParameter("qty"));
	String email = request.getParameter("email");
	String url = request.getParameter("url");
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	String baseball = request.getParameter("baseball");
	String base = request.getParameter("base");
	//다중 데이터만 getParameterValues 를 이용하여 String 배열로 전달
	String four[] = request.getParameterValues("four");
	String five[] = request.getParameterValues("four");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><%=address %></p>
<p><%=qty %></p>
<p><%=date %></p>
<% 
for (int i=0; i<four.length(); i++) {
	out.println("i: "+four[i]);
}

%>










</body>
</html>