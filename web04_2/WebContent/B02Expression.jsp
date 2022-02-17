<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; UTF-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:<%=name %><br><!-- 표현식 getParameter를 인식-->
	아이디:${id }<br><!-- 표현언어 우선순위가 있다.-->
	
</body>
</html>