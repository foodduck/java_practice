<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = application.getInitParameter("adminId");
	String pw = application.getInitParameter("adminPw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A10Gloval variable</title>
</head>
<body>
<div>
	관리자 아이디: <%=id %><br>
</div>
</body>
</html>