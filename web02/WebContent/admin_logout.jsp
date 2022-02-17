<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
	String uid = (String) session.getAttribute("id");  //세션객체의 값은 객체이므로 캐스팅이 필요함
	if(uid!=null){
		session.removeAttribute("id");	//세션객체에 저장된 id속성 값을 지우기
		session.removeAttribute("pw"); //세션객체에 저장된 id속성 값을 지우기
		//session.invalidate();  //세션 초기화
	}
	response.sendRedirect("admin.jsp");	//로그아웃 후에 관리자페이지(admin.jsp)로 이동
%>