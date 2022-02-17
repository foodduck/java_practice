<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품수정</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	<h1>상품 정보 수정</h1>
	<!-- 상품 등록 폼 -->
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	String p_num = request.getParameter("p_num");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from product where pronum=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, p_num);
		rs = stmt.executeQuery();

		if(rs.next()) {
			String p_name = rs.getString("proname");		
			int p_price = rs.getInt("proprice");
			int p_cnt = rs.getInt("procnt");
			String p_img = rs.getString("proimg");
%>
	<form action="updateProductPro.jsp" class="frm" method="post" name="pform" onsubmit="return pCheck(this)">
		<table>
			<tr>
				<th class="item_name">
					<label for="p_num">상품코드</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_num" id="p_num" class="in_data" value="<%=p_num %>" readonly />
					<input type="button" value="제품코드 체크" class="in_btn" onclick="codeCheck()" />
					<input type="hidden" value="" name="codeck" id="codeck" />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_name">상품명</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_name" id="p_name" class="in_data" value="<%=p_name %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_price">가격</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_price" id="p_price" class="in_data" value="<%=p_price %>"  required />
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_cnt">수량</label>
				</th>
				<td class="item_val">
					<input type="number" name="p_cnt" id="p_cnt" class="in_data" value="<%=p_cnt %>"   required/>
				</td>
			</tr>
			<tr>
				<th class="item_name">
					<label for="p_img">이미지</label>
				</th>
				<td class="item_val">
					<input type="text" name="p_img" id="p_img" class="in_data" value="<%=p_img %>"/>
					<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="제품정보수정" class="in_btn"/></td>
				<td><input type="reset" value="취소" class="in_btn"/></td>
			</tr>
		</table>
	</form>
	<script>
	function imgCheck() {
		window.open("imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function codeCheck() {
		window.open("codeCheckForm.jsp", "codeuploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 혹은 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
	</script>	
	<!-- 푸터 -->
	<%			
		}
			out.println("작업이 올바르게 처리되었습니다.");
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		}
%>
	<%@ include file="admin_footer.jsp" %>
</body>
</html>