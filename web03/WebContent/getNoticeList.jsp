<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>    
<%@ page import="java.sql.*"%>
<%@ page import="com.project1.model.Notice2VO" %>
<%
	//GetNoticeCtrl에서 보내온 데이터를 받기
	ArrayList<Notice2VO> noticeList = (ArrayList<Notice2VO>) request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
<h2 class="tit">공지 목록</h2>
<ul class="lst lh">
	<li class="item1">아이디</li>
	<li class="item2">글번호</li>
	<li class="item3">제목</li>
	<li class="item4">내용</li>
	<li class="item5">글쓴이</li>
	<li class="item6">등록일자</li>
	<li class="item7">조회수</li>
	<li class="item8">편집</li>
</ul>
<form action="DeleteNoticeCtrl" method="post" name="delForm" onsubmit="return frm_submit(this)">
<%	
	for(int i=0;i<noticeList.size();i++){
		Notice2VO noti = noticeList.get(i);
%>	
	<ul class="lst">
		<li class="item1"><a href="EditNoticeFormCtrl?id=<%=noti.getId() %>"><%=noti.getId() %></a></li>
		<li class="item2"><%=noti.getIdx() %></li>
		<li class="item3"><%=noti.getTitle() %></li>
		<li class="item4"><%=noti.getContent() %></li>
		<li class="item5"><%=noti.getAuthor() %></li>
		<li class="item6"><%=noti.getRegdate() %></li>
		<li class="item7"><%=noti.getVisited() %><li>
			<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=noti.getId() %>"/>
		</li>
	</ul>
<%
	}
%>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">삭제</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
<script>
function frm_submit(){
	var sel = 'input[name="ck"]:checked';
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if(cnt==0) {
		alert("삭제할 요소를 선택하세요.");
		return false;
	} else {
		var qt = confirm("정말로 삭제하겠습니까?");
		if(qt) {
			f.submit();
		} else {
			return false;
		}
	}
}
</script>
<%@ include file="footer.jsp" %>
</body>
</html>
