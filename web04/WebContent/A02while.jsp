<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
<ul>
<%

int i =1;
int j =0;
int sum = 0;
	while(i<10) {
		i++;
		while (j<10) {
			j++;
%>	
			<li><%=i %>"+"*"+"<%=j %>"+"="+"<%=i*j %></li>
<% 			
		}
	}
%>
</ul>
</body>
</html>