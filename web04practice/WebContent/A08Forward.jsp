<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html; charset=UTF-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	
	int tot = kor + eng;
	double avg = (float) tot /2;
	
	request.setAttribute("name", name);
	request.setAttribute("kor", kor);
	request.setAttribute("eng", eng);
	request.setAttribute("tot", tot);
	request.setAttribute("avg", avg);
	//전송 객체에 데이터를 저장
	
	RequestDispatcher view = request.getRequestDispatcher("A08Result.jsp");  //데이터 보내질 곳을 지정
	view.forward(request, response);		//데이터 전송	
%>