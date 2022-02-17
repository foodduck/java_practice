<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="b" class="com.academy.model.Board1VO"/>
<jsp:setProperty name ="b" property="*"/>
<jsp:setProperty name ="b" property="pw" value="<%=b.getId() %>"/>
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
	<h2>액션 태그를 활용하여 전송받은 데이터를 setProperty 와 getProperty 로 주고 받아 표현</h2>
	
		<table class="tb">
			<tr>
				<th>아이디</th>
				<td>
					<jsp:getProperty name ="b" property="id"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<jsp:getProperty name ="b" property="pw"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<jsp:getProperty name ="b" property="title"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<jsp:getProperty name ="b" property="content"/>
				</td>
			</tr>
		
		</table>
</body>
</html>