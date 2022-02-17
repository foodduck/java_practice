<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
if (id!=null && password!=null) {
	session.setAttribute("id",id);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>안녕하세요, <%=session.getAttribute(id) %> 님</h2>
<a href="logout.jsp">로그아웃 하시겠습니까?</a>
</body>
</html>