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
<p>선언문에는 public 과 같은 접근제한자와 전역변수를 적용할 수 있으며, 함수나 메서드의 정의도 가능함</p>
<p>선언문</p>
<%!
	public int num = 1;
	public String name = "";
	
	public String onAdd(int x, int y) {
		return x + " + " + y + " = " + (x + y);
	}
	
%>
<p>스크립트 릿</p>
<%
	int j = 30;
	int k = 40;
	out.print("<div class='result'>"+onAdd(j, k)+"</div>");
%>
<p>표현식</p>
<div class="result"><%=onAdd(j, k) %></div>
<%
	//String name = request.getParameter("name");			//name은 지역변수처리됨
	//if(name.equals("김기태")) {
		//num = 2000;			전역변수 num
		//j = 40;				지역변수 j
		//k = 80;				지역변수 k
	//}
%>
<%
		String path = application.getRealPath("A03Dec.jsp");		//getRealPath는 해당문서의 실제경로를 구함
		out.print(path);
%>
</body>
</html>