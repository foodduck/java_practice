<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
<h2>제품 추가</h2>
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
		sql = "select substr(id, 2,3) as a1 from product where idx in (select max(idx) from product)";
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
<form action="AddProductCtrl" method ="post" id="frm" name="frm" onsubmit="return pCheck(this)">
	<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="nid">글번호</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_id" name="p_id" class="in_data" value="<%=a1 %>" required readonly />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="name" >이름</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_name" name="p_name" class="in_data"  required />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="description">설명</label>
				</th>
				<td class="col_data">
					<textarea id="content" name="p_description" class="in_data_area"  cols="60" rows="15" required>
					</textarea>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="standard">규격</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_standard" name="p_standard" class="in_data"  required/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="price">가격</label>
				</th>
				<td class="col_data">
					<input type="number" id="p_price" name="p_price" class="in_data"  required/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="img">이미지</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_img" name="p_img" class="in_data"  required/>
				<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="btn_wrap">	
			<button type="submit" class="in_btn" onclick="">등록</button>
			<button type="reset" class="in_btn" onclick="">취소</button>
	</div>

</form>
<script>
	function imgCheck() {
		window.open("imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 혹은 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
	</script>

		
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
<%@ include file="footer.jsp" %>


</body>
</html>