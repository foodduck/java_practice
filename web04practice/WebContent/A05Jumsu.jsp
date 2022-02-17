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
<title>데이터를 받아 처리하여 점수 결과 표시</title>
</head>
<body>
	<h3>점수 결과</h3>
	<div>
		<%=name %>님<br>
		국어 점수 : <%=kor %>점<br>
		영어 점수 : <%=eng %>점<br>
		총점 : <%=kor+eng %>점<br>
		<%
			double avg = (float) (kor+eng) / 2;
		%>
		평균 : <%=avg %>점<br>
	</div>
</body>
</html>