<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브 페이지1</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='header.jsp'%>
	<h1>관리자 전용 페이지</h1>
	<hr />
	<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pw = "tiger";
	String sql;

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, id, pw);
	stmt = conn.createStatement();
	sql = "select * from member";
	rs = stmt.executeQuery(sql);
	%>
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>출생년도</th>
			<th>가입일</th>
			<th>성명</th>
		</tr>
		<%
			while (rs.next()) {
			String m_id = rs.getString("userid");
			String m_pw = rs.getString("passwd");
			int m_birth = rs.getInt("birth");
			Date regDate = rs.getDate("regdate");
			String name = rs.getString("name");
		%>
		<tr>
			<td><a href="adminPageDetail.jsp?m_id=<%=m_id%>"><%=m_id%></a></td>
			<td><%=m_pw%></td>
			<td><%=m_birth%></td>
			<td><%=regDate%></td>
			<td><%=name%></td>
		</tr>
		<%
			}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
		%>
	</table>

	<!-- 푸터 -->
	<%@ include file='footer.jsp'%>
</body>
</html>