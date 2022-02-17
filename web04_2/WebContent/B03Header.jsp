<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접속 헤더 정보</title>
</head>
<body>
<% 
Enumeration e = request.getHeaderNames();
while(e.hasMoreElements()) {
	String names = (String) e.nextElement();
	String values = (String) request.getHeader(names);
	out.println(names+":"+values+"<br>");
}
out.println("접속id 주소:"+request.getLocalAddr()+"<br>");
InetAddress ipaddr = InatAddress.getLocalHost();
out.println("접속id 주소:"+ipaddr+"<br>");
out.println("접속id 주소:"+ipaddr+"<br>");
out.println("접속id 주소:"+ipaddr+"<br>");
%>
</body>
</html>