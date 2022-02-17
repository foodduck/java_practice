<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 추가</title>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
<h2>공지 추가</h2>
<%
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "scott";
	String db_pw = "tiger";
	String sql;
	String a1;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection(url, db_id, db_pw);
		sql = "select substr(id, 2,3) as a1 from notice2 where idx in (select max(idx) from notice2)";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		if (rs.next()) {
			int data1 = Integer.parseInt(rs.getString("a1"));
			if (data1+1<10) {
				a1 = "A00"+(data1+1);
			} else if (data1+1<100) {
				a1 = "A0"+(data1+1);
			} else {
				a1="A"+(data1+1);
			}
%>
<form action="AddNoticeCtrl" method ="post" id="frm" name="frm">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="nid">글번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_id" name="n_id" class="in_data" value="<%=a1 %>" required readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="title" >제목</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_title" name="n_title" class="in_data"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="content">글 내용</label>
				</th>
				<td class="col_data">
					<textarea id="content" name="n_content" class="in_data_area"  cols="60" rows="15" required>
					</textarea>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="author">작성자</label>
				</th>
				<td class="col_data">
					<input type="text" id="n_author" name="n_author" class="in_data" value="관리자"  required/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="btn_wrap">	
			<button type="submit" class="in_btn" onclick="">등록</button>
			<button type="reset" class="in_btn" onclick="">취소</button>
	</div>




<%		
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch(SQLException e) {
		out.println("SQL 구문 오류");
		e.printStackTrace();
	} catch(Exception e) {
		out.println("기타 오류");
		e.printStackTrace();
	}
%>

</form>
<%@ include file="footer.jsp" %>


</body>
</html>