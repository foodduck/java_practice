<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="b" scope="request" class="com.academy.model.Board1VO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 액션태그: useBean, forward 연습</title>
</head>
<body>
	아이디:<%=b.getId() %><br>
	비밀번호:<%=b.getPw() %><br>
	제목:<%=b.getTitle() %><br>
	내용:<%=b.getContent() %><br>
	
</body>
</html>