<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A11Scope2.jsp</title>
</head>
<body>
	페이지의 속성:<%=pageContext.getAttribute("name") %><br>
	요청자의 속성:<%=request.getAttribute("name") %><br>
	세션의 속성:<%=session.getAttribute("name") %><br>
	애플리케이션의 속성:<%=application.getAttribute("name") %><br>
	<a href="A11Scope3.jsp">세 번째 페이지의 전송결과</a>
</body>
</html>