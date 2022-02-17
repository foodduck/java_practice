<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품코드 중복 확인</title>
</head>
<body>
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		String pcode = request.getParameter("pcode");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "select * from product where pronum=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, pcode);
			rs = stmt.executeQuery();
%>
<%		
		if(rs.next()) {
			out.println("<p>해당 제품코드는 사용하실 수 없는 제품코드 입니다.</p>");
		} else {
			out.println("<p>사용 가능한 제품코드 입니다.</p>");
			out.println("<a href='javascript:apply(\""+pcode+"\")'>"+pcode+" [적용]</a>");
			out.println("<p>적용을 눌러야만 입력하신 제품코드를 사용할 수 있습니다.</p>");
%>
		<script>
		function apply(p_num){
			//opener 부모창
			//opener.document.폼이름.컨트롤이름.value
			opener.document.pform.p_num.value=p_num;
			//opener.document.joinform.m_id.readonly=true;
			opener.document.pform.codeck.value="yes";
			window.close();
		}
		</script>
<%
		}
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
</body>
</html>