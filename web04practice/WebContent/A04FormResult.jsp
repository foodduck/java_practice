<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	// String qty = request.getParameter("qty");
	// double qtyInt = Double.parseDouble(qty);
	int qty = Integer.parseInt(request.getParameter("qty"));
	String email = request.getParameter("email");
	String url = request.getParameter("url");
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	String baseball = request.getParameter("baseball");
	String base = request.getParameter("base");		// select
	
	// 다중 데이터만 getParameterValues => String 배열로 전달
	String[] four = request.getParameterValues("four");
	String[] five = request.getParameterValues("five");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form 데이터 받아오기</title>
</head>
<body>
<div class="result">
		Name: <%=name %><br>
		ID: <%=id %><br>
		PW: <%=password %><br>
		qty: <%=qty * 100 %><br>
		email: <%=email %><br>
		url: <%=url %><br>
		date: <%=date %><br>
		comment: <%=comment %><br>
		baseball: <%=baseball %><br>
		base: <%=base %><br>
		<br>
		Four: 
<%
	for(int i = 0; i < four.length; i++) {
		out.println("[" + i + "]: " + four[i] + ", ");
	}
%>
		<br>
		Five: 
<%
	for(int i = 0; i < five.length; i++) {
%>
		[<%=i %>]: <%=five[i] %>
<%
	}
%>	
</div>
</body>
</html>