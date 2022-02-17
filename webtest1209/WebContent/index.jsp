<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%   
		String mid = (String) session.getAttribute("mid");
		if (mid=="admin") {
%>
			<%@ include file="adminHeader.jsp" %>
<%
		} else if (mid!=null){
%>
			<%@ include file="logonHeader.jsp" %>
<%
		} else {
%>
			<%@ include file="header.jsp" %>
<%
		}
%>

	
<%@include file= "footer.jsp" %>
</body>
</html>