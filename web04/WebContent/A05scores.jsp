<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	response.setContentType("text/html; charset=UTF-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평균까지 구하기</title>
</head>
<body>
<%double avg = kor+eng;%>
<h2><%=name %> 님</h2>
<div class="score">
<p>국어 점수:<%=kor %></p>
<p>영어 점수:<%=eng %></p>
<p>국어 점수:<%=kor+eng %></p>
<p>평균:<%=avg %></p>
</div>
</body>
</html>