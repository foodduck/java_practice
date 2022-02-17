<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문(Declare)</title>
</head>
<body>
<h2>선언문(Declaration Programming)</h2>
<p>선언문에는 public과 같은 접근제한자를 적용할 수 있음</p>
<%!
	public int num = 1;
	public String name = "";
	public String onAdd(int x, int y) {
		return x+"+"+"y"+"="+(x+y);
	}
%>

</body>
</html>