<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="b" scope="request" class="com.academy.model.Board1VO" />
<%
b.setId("kks");
b.setPw("1234");
b.setTitle("Good day 오늘");
b.setContent("1214 자바 웹 서버페이지에서 jsp 액션 태그를 배우는 날");
%>
<jsp:forward page="C01board1UseBean.jsp"/>