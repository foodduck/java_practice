<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html; charset=UTF-8");
 	pageContext.setAttribute("name", "김태민");
 	
 	String[] sports = request.getParameterValues("sports");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL의 Param</title>
</head>
<body>
	<h3>전역변수(initParam)</h3>
	이름 : ${initParam.testParamName } = <%=application.getInitParameter("testParamName") %><br>
	나이 : ${initParam.testParamAge } = <%=application.getInitParameter("testParamAge") %><br>
	<br>
	<h3>요청자(request)</h3>
	요청 URI : ${pageContext.request.requestURI } = <%=request.getRequestURI() %><br><br>
	<h3>스코프 객체</h3>
	현재 페이지의 이름 : ${pageScope.name } = <%=pageContext.getAttribute("name") %>
	요청자의 이름 : ${requestScope.name } = <%=request.getAttribute("name") %><br>
	세션의 이름 : ${sessionScope.name } = <%=session.getAttribute("name") %>	
	애플리케이션의 이름 : ${applicationScope.name } = <%=application.getAttribute("name") %>
	<br />
	<h3>헤더 정보(Header Value)</h3>
	헤더 정보 : ${header.host } = <%=request.getHeader("host") %><br>
	<%-- 헤더 정보2 : ${headerValues.cookie } = <%request.getHeaders("cookie") %>  --%> 
	<h3>매개전달(Parameter)</h3>
	아이디 : ${param.id } = <%=request.getParameter("id") %><br>
	선택한 운동<br>
	첫 번째 운동 : ${paramValues.sports[0] } = <%=sports[0] %><br>
	두 번째 운동 : ${paramValues.sports[1] } = <%=sports[1] %><br>
	세 번째 운동 : ${paramValues.sports[2] } = <%=sports[2] %><br>	
	네 번째 운동 : ${paramValues.sports[3] } = <%=sports[3] %><br>
</body>
</html>