<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Param 데이터 받기</title>
</head>
<body>
	<h2>Param으로 보내온 데이터 받기</h2>
	<%=request.getParameter("name") %>님이 로그인 하셨습니다.<br><br>
	<a href="javascript:history.go(-1)"></a>
</body>
</html>