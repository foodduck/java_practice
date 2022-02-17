<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그의 param</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String loginType = request.getParameter("loginType");
	
	if(loginType.equals("user")) {
%>
	<jsp:forward page="param_recieve.jsp">
<%-- 		<jsp:param name="name" value="<%=URLEncoder.encode('일반고객', 'UTF-8') %>" /> --%>
		<jsp:param name="name" value="일반고객" />
	</jsp:forward>
<%		
	} else {
%>
	<jsp:forward page="param_reciever.jsp">
		<jsp:param name="name" value="관리자" />
	</jsp:forward>
<%
	}
%>
</body>
</html>