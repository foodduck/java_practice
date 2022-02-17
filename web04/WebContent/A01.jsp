<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿</title>
</head>
<body>
<h1>1~100까지의 합</h1>
<div class="content">
<ul>
<%
int sum = 0;
for (int i=0; i<=100; i+=4) {
	sum = sum+i;
%>
	<li><%=sum %></li>
<%
}
%>
</ul>
<p>합계: <%=sum %></p>
</div>
</body>
</html>