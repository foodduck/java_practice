<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품목록보기</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
	
	<!--  회원목록  -->
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		stmt = conn.createStatement();
		sql = "select * from product";
		rs = stmt.executeQuery(sql);
%>
    <h2>제품목록</h2>
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>제품코드</th><th>제품명</th>
			<th>제품가격</th><th>수량</th><th>제품이미지</th>
			<th>편집 또는 삭제</th>
		</tr>
<%		
		while(rs.next()) {
			String p_num = rs.getString("proNum");
			String p_name = rs.getString("proName");
			int p_price = rs.getInt("proPrice");
			int p_cnt = rs.getInt("proCnt");
			String p_img = rs.getString("proImg");
%>
		<tr>
			<td><a href="updateProduct.jsp?p_num=<%=p_num %>"><%=p_num %></a></td>
			<td><%=p_name %></td>
			<td><%=p_price %></td>
			<td><%=p_cnt %></td>
			<td><img src='./img/<%=p_img %>'  alt='자동차' /></td>
			<td><a href="deleteProductPro.jsp?p_num=<%=p_num %>">삭제</a>	</td>
		</tr>
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
</table>	

	
	<!-- 푸터 -->
	<%@ include file="admin_footer.jsp" %>
</body>
</html>