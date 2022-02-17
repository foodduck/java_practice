<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.project1.model.MemberVO" %>
<%
	MemberVO mem = (MemberVO) request.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<style>
	.tit { text-align:center; }
	.btn_wrap .in_btn:hover { background-color:black; font-color:white; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn {width: 150px; font-color:white; }
</style>
<body>
<h2 class="tit">회원정보 수정</h2>
<form action ="EditMemberCtrl" method="post" id ="frm" name="frm">
<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="id">아이디</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_id" name="m_id" class="in_data" value="<%=mem.getId() %>" readonly required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="pw" >비밀번호</label>
				</th>
				<td class="col_data">
					<input type="password" id="m_pw" name="m_pw" class="in_data" value="<%=mem.getPw() %>" readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="name">회원명</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_name" name="m_name" class="in_data" value="<%=mem.getName() %>" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="email">이메일</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_email" name="m_email" class="in_data" value="<%=mem.getEmail() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="question">질문</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_question" name="m_question" class="in_data" value="<%=mem.getQuestion() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="answer">답</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_answer" name="m_answer" class="in_data" value="<%=mem.getAnswer() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="address1">우편번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_address1" name="m_address1" class="in_data" value="<%=mem.getAddress1() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="address2">주소</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_address2" name="m_address2" class="in_data" value="<%=mem.getAddress2() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="regdate">가입일</label>
				</th>
				<td class="col_data">
					<input type="text" id="m_regdate" name="m_regdate" class="in_data" value="<%=mem.getRegdate() %>" readonly />
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