<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp" %>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		String m_id = request.getParameter("m_id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(m_id+"가 입력되었습니다.");
			//sql = "select * from member where userid=?";
			sql = "select * from member where userid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			rs = stmt.executeQuery();
%>
	<h1>회원 상세 보기</h1>
	<hr />
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>아이디</th><th>비밀번호</th>
			<th>출생년도</th><th>가입일</th>
			<th>성명</th><th>포인트</th>
			<th>방문횟수</th><th>정회원유무</th>
		</tr>
<%		
		if(rs.next()) {
%>			
		<tr>
			<td><%=rs.getString("userid") %></td>
			<td><%=rs.getString("passwd") %></td>
			<td><%=rs.getInt("birth") %></td>
			<td><%=rs.getDate("regdate") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getInt("point") %></td>
			<td><%=rs.getInt("visits") %></td>
			<td><%=rs.getString("yesno") %></td>
		</tr>
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
</table>	
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>