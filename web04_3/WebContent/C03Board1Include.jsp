<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name="곽";
	//String name=request.getParameter("name2");
	String pageName1 = "header.jsp";
	String pageName2 = "footer.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 액션태그의 include 및 param 전송</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="<%=pageName1 %>" flush="false"/>
	<br>param은 보낼 데이터를 지정한다.<br>
<%-- 	<jsp:param name ="name" value="kim" /> 	--%>	
	<jsp:include page="<%=pageName2 %>" flush="false"/>
	<a href="include.jsp?name=<%=name %>">데이터 전송</a>
</body>
</html>