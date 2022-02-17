<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String name = null;
	String[] color = {"red","blue","green"};
	Map map = new HashMap();
	map.put("name1", color[0]);
	map.put("name2", color[1]);
	map.put("name3", color[2]);
	
	request.setAttribute("name", name);
	request.setAttribute("color", color);
	request.setAttribute("map", map);
%>
</body>
</html>