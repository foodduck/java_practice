<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
    ArrayList<String> list = request.getParameterValues<list>();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>컨트롤러에서 보내온 데이터 가져오기</h2>
<ul class="list">
<% 
	for(int i=0; i<3;i++) {
%>
	<li>${list.get(i) }</li>
<%
	}
%>
</ul>
<h3>list값 가져오기</h3>
<ul class="list">
<% 
	for(int i=0; i<list.size();i++) {
%>
	<li>${list.get(i) }</li>
<%
	}
%>
</ul>
<h3>map값 가져오기</h3>
<ul class="list">
<% 
	for(String irum:map.keyset()) {
%>
	<li>${name }:${map.get(irum) }</li>
<%
	}
%>
</ul>
<h3>map값 가져오기: iterator()</h3>
<ul class="list">


</ul>
</body>
</html>