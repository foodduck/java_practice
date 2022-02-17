<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A11Scope3.jsp</title>
</head>
<body>
	페이지의 속성:<%=pageContext.getAttribute("name") %><br>
	<!-- page scope: 현재 페이지에서만 값이 유효하다. -->
	요청자의 속성:<%=request.getAttribute("name") %><br>
	<!-- request scope: 요청한 페이지에서만 값이 유효하다. -->
	세션의 속성:<%=session.getAttribute("name") %><br>
	<!-- session scope: 세션값이 유지되는 동안 값이 유효하다. -->
	애플리케이션의 속성:<%=application.getAttribute("name") %><br>
	<!-- application scope: 서버가 구동되는 동안 값이 유효하다. -->
	전역변수의 속성:<%=application.getInitParameter("name") %><br>
	<!-- application scope: 서버가 구동되는 동안 값이 유효하다. -->
</body>
</html>