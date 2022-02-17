<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String) request.getAttribute("name");
	int kor = (int) request.getAttribute("kor");
	int eng = (int) request.getAttribute("eng");
	int tot = (int) request.getAttribute("tot");
	double avg = (double) request.getAttribute("avg");
%>
<div>
	<%=name %>님<br>
	${name } 님<br>
	국어 점수 : ${kor }점<br>
	영어 점수 : ${eng }점<br>
	총점 : ${tot }점<br>
	평균 : ${avg }점<br>
</div>