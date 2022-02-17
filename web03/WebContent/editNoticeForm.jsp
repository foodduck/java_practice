<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.project1.model.Notice2VO" %>
<%
	Notice2VO noti = (Notice2VO) request.getAttribute("noti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
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
<body>
<h2 class="tit">공지 수정</h2>
<form action ="EditNoticeCtrl" method="post" id ="frm" name="frm">
<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="idx">번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_idx" name="n_idx" class="in_data" value="<%=noti.getIdx() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="id" >아이디</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_id" name="n_id" class="in_data" value="<%=noti.getId() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="title">제목</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_title" name="n_title" class="in_data" value="<%=noti.getTitle() %>" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="content">내용</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_content" name="n_content" class="in_data" value="<%=noti.getContent() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">글쓴이</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_author" name="n_author" class="in_data" value="<%=noti.getAuthor() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="regdate">등록일</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_regdate" name="n_regdate" class="in_data" value="<%=noti.getRegdate() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="visited">조회수</label>
				</th>
				<td class="col_data">
					<input type="number" id="n_visited" name="n_visited" class="in_data" value="<%=noti.getVisited() %>"/>
				</td>
			</tr>
			
			
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>	
</form>
</body>
</html>