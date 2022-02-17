<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
//로그인 화면에서 넘어온 파라미터 받아오기
//로그인한 아이디가 관리자인 경우
response.setContentType("text/html; charset=UTF-8");
String uid = request.getParameter("id");
String upw = request.getParameter("password");
String name = "";
if(uid.equals("admin") && upw.equals("1234")){
	name = "관리자";
	session.setAttribute("id",uid);
	session.setAttribute("name","관리자");
%>    
	<h3>로그인 완료</h3>
	<div>안녕하세요 <%=name %>님</div>
	<div><a href="A07logout.jsp">로그아웃</a></div>
	<!-- 로그아웃 링크를 클릭하면, 로그아웃 처리되고, login.jsp로 이동 -->
<%
} else { //만약 일치하지 않으면, 다시 login.jsp로 이동 
		response.sendRedirect("./html/login.jsp");
}
%>
</body>
</html>