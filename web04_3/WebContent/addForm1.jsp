<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 전송 폼</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>액션 태그를 활용한 데이터 전송 폼</h2>
	<form action="C02board1property.jsp">
		<table class="tb">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pw" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="content" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td colspan="2">
					<input type="submit" value="올리기"/>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>