<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name =  (String)pageContext.getAttribute("name");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A09includeFile</title>
</head>
<body>
	<h3>포함되는 파일의 출력 내용</h3>
	<div>
	name: <%=name %><br>
	hame2 = ${name }<br>
	</div>
</body>
</html>