<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "김기태");
	session.setAttribute("name","이근희");
	application.setAttribute("name", "김대호");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Data Form</title>
</head>
<body>
	<h2>EL Data Form</h2>
	<form action="B06ELParam.jsp" method="post">
		아이디 : <input type="text" name="id"/><br><br><br>
		당신은 어떤 스포츠를 좋아하십니까?<br> 
		축구 : <input type="checkbox" name="sports" value="축구"/><br>
		배구 : <input type="checkbox" name="sports" value="배구"/><br>
		야구 : <input type="checkbox" name="sports" value="야구"/><br>
		농구 : <input type="checkbox" name="sports" value="농구"/><br>
		<br>
		<input type="submit" value="확인"/>
		<input type="reset" value="취소"/>
	</form>
</body>
</html>