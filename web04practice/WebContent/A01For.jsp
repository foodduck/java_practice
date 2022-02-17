<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 : 자바프로그램 코드를 웹 문서에서 사용하려고 할 경우</title>
<style>
.lst { clear:both; list-style:none; }
.lst li { float:left; margin-right:20px;; }
.result { clear:both; font-size:68px; font-style:italic; color:red; }
</style>
</head>
<body>
<h1>1-100까지의 합을 계산하여 출력</h1>
<div class="content">
<ul class='lst'>
<%
		//스크립트릿의 반복 실행문 - 1~100의 4의 배수의 합계 출력
		//4, 8,.....100
		//결과 : XXXX
		//출력 태그 구조 <ul class='lst'><li>4</li><li>8</li>....<li>100</li></ul><p class='result'>XXXX</p>
		int hap = 0;
		for(int a=0;a<=100;a+=4) {
			hap+=a;
%>
	<li><%=a %></li>
<%			
		}
%>
</ul>
<p class="result">결과 : <%=hap %></p>
<%
out.print("<p class='result'>결과 : "+hap+"</p>");
%>
<%-- 				표현식(expression) : <%= %> 			--%>
<%-- 				<% 스크립트릿(scriptlet) %> 		--%>
</div>
</body>
</html>