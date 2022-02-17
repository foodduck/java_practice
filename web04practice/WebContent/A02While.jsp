<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 - while문을 활용한 구구단 출력</title>
<style>
.tit { text-align: center; }
.content { width: 810px; margin: 0 auto; }
.col { float:left; width: 100px; }
.col .tit { color:red; }
.row { list-style:none; padding: 0; margin: 0;  border-right:1px dotted deeppink; margin-left:15px; }
.col:last-child .row { border:0; }
.row li { clear:both; width:100px; font-size:16px; line-height: 30px; }
</style>
</head>
<body>
<h3 class="tit">중첩 while문을 이용한 구구단 출력</h3>
<div class="content">
<%
	int su;
	int dan = 2; 
	while(dan<=9) {
		su=1;
%>
<div class="col"> 
	<h3 class="tit"><%=dan %>단</h3>
	<ul class="row">
<%
		while(su<=9) {
%>
		<li><%=dan %> * <%=su %> = <%=dan*su %></li>
<%			
			++su;
		}
%>
	</ul>
</div>
<%
		dan++;
	}
%>
</div>
</body>
</html>