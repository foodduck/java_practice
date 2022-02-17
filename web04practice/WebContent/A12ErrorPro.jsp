<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "ErrorPage.jsp" %>
<!-- 페이지 디렉티브에 에러 페이지를 지정할 수도 있다. -->
<%
int num = Integer.parseInt(request.getParameter("name"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
</head>
<body>
	<p>에러를 발생시키기</p>
</body>
</html>