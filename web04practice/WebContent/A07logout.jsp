<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String uid = (String) session.getAttribute("id");
		if(uid!=null){
			session.invalidate();
		}
		response.sendRedirect("./html/login.jsp");
%>
<%
	//form 태그 -> POST, GET -> getParameter A->B	보내는곳->받는곳 데이터가 유효
	//보내는 곳 :form요소
	//받는 곳 : form 태그 action속성에 기재된 문서 - page Scope
	//session -> Browser Scope
	//보내는 곳 form요소 없음
	//받는 곳 : Dispatcher(forward) - page Scope
	//보내는 곳 form요소 없음
	//받는 곳 : application객체로 전달 - application Scope 
%>