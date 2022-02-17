<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project1.model.MemberVO" %> 
<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList");
	//MemberVO mem = (MemberVO) request.getAttribute("memberList");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
<h2 class="tit">회원 목록</h2>
<ul class="lst lh">
	<li class="item1">아이디 </li>
	<li class="item2">비밀번호</li>
	<li class="item3">회원명</li>
	<li class="item4">이메일</li>
	<li class="item5">질문</li>
	<li class="item6">답</li>
	<li class="item7">우편번호</li>
	<li class="item8">상세주소</li>
	<li class="item9">가입일</li>
	<li class="item10">편집</li>
</ul>
<form action="DeleteMemberCtrl" method="post" name="delForm" onsubmit="return frm_submit(this)">
<%	
	for(int i=0;i<memberList.size();i++) {
		MemberVO mem = memberList.get(i);
%>	
	<ul class="lst">
		<li class="item1"><a href="EditMemberFormCtrl?id=<%=mem.getId() %>"><%=mem.getId() %></a></li>
		<li class="item2"><%=mem.getPw() %></li>
		<li class="item3"><%=mem.getName() %></li>
		<li class="item4"><%=mem.getEmail() %></li>
		<li class="item5"><%=mem.getQuestion() %></li>
		<li class="item6"><%=mem.getAnswer() %></li>
		<li class="item7"><%=mem.getAddress1() %></li>
		<li class="item8"><%=mem.getAddress2() %></li>
		<li class="item9"><%=mem.getRegdate() %><li>
			<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=mem.getId() %>"/>
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
function frm_submit(f){ //form태그에서 보내온 데이터
	var sel = 'input[name="ck"]:checked'; // sel = document.getElementsByClass("ck_item");
	var item = document.querySelectorAll(sel);
	var cnt = item.length;
	if(cnt==0) { //선택한 체크박스가 없으면
		alert("삭제할 요소를 선택하세요."); //메시지만 의운다.
		return false;
	} else {	 //선택체크된 체크박스가 있으면
		var qt = confirm("정말로 삭제하겠습니까?"); //지우기 전에 정말로 삭제할 것인지 물어서 확인 선택시 true 반환
		if(qt) {	//qt가 true(확인 대화상자에서 확인을 누른 경우)이면 폼 데이터 전송
			f.submit();
		} else {	//qt가 false (확인 대화상자에서 취소를 누른 경우)면 아무일도 일어나지 않음
			return false;
		}
		
	}
}
	

</script>
<%@ include file="footer.jsp" %>
</body>
</html>
