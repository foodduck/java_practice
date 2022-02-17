<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송 데이터 폼</title>
</head>
<body>
	<h2>jsp 액션 태그의 param 활용 폼</h2>
	<form action="C04BoardParam.jsp" method="post">
	아이디: <input type="text" name="id" />
	비밀번호: <input type="password" name ="pw" />
	사용자 모드<br>
	<input type="radio" name ="loginType" value="user" checked/>일반사용자<br>
	<input type="radio" name ="loginType" value="manager" />일반사용자<br>
	<input type="submit" value="로그인">
	</form>
</body>
</html>