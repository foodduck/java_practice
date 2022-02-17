<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>    
<%@ page import="java.sql.*"%>
<%@ page import="com.project1.model.ProductVO" %>
<%
	//GetNoticeCtrl에서 보내온 데이터를 받기
	ArrayList<ProductVO> noticeList = (ArrayList<ProductVO>) request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
<style>
	.tit { text-align:center; }
	.lst { list-style:none; clear:both; width:1050px; margin:0 auto; font-size:8pt;}
	.btn_wrap .in_btn:hover { background-color:black; font-color:white; }
	.lst li { float:left; width:100px; line-height:36px; line-height:12px; padding: 2px;}
	.lst.lh { border-top:3px solid #333; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn {width: 150px; font-color:white; }
	#ck {width:50px; height:50px;}
</style>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
<h2 class="tit">제품 목록</h2>
<ul class="lst lh">
	<li class="item1">아이디</li>
	<li class="item2">이름</li>
	<li class="item3">설명</li>
	<li class="item4">규격</li>
	<li class="item5">가격</li>
	<li class="item6">이미지</li>
</ul>

<%	
	for(int i=0;i<noticeList.size();i++){
		ProductVO noti = noticeList.get(i);
%>	
	<ul class="lst">
		<li class="item2"><%=noti.getId() %></li>
		<li class="item1"><%=noti.getName() %></li>
		<li class="item3"><%=noti.getDescription() %></li>
		<li class="item4"><%=noti.getStandard() %></li>
		<li class="item5"><%=noti.getPrice() %></li>
		<li class="item6"><%=noti.getImg() %></li>
			
	</ul>
<%
	}
%>
    

</form>

<%@ include file="footer.jsp" %>
</body>
</html>
