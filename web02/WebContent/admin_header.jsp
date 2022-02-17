<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a_id = (String) session.getAttribute("a_id");
	if(a_id!=null) {
		//관리자로 로그인 정보가 있으면 "admin님"으로 출력
		out.println("<h3>"+a_id+"님</h3>");
	} else {
		//관리자가 아니면 다시 관리자 로그인 페이지로 이동
		response.sendRedirect("admin_login.html");
	}
%>
<header>
	<a href="index.jsp" class="logo">
		<img src="http://placehold.it/100x48/333" alt="로고" />
	</a>
	<nav class="gnb">
		<ul>
			<li><a href="memberList.jsp">회원관리</a></li>
			<li><a href="productList.jsp">제품목록</a></li>
			<li><a href="">공지사항 관리</a></li>
			<li><a href="">갤러리 관리</a></li>
			<li><a href="">메뉴5</a></li>
		</ul>
	</nav>
	<nav class="tnb">
		<ul>
			<li><a href="admin_logout.jsp">관리자 로그아웃</a></li>
			<li><a href="">상단2</a></li>
			<li><a href="">상단3</a></li>
		</ul>
	</nav>
</header>