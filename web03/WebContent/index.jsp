<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./css/reset.css">
<style>

</style>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
 	<meta name="title" content="자동차 페이지">
    <meta name="keywords" content="자동차">
    <meta name="description" content="1119 수업내용">
    <meta name="author" content="곽규석">
    <link rel="shortcut icon" href="./ico/samfavicon.ico" sizes="48x48"/>
    
    
<link rel="stylesheet" href="./css/ban.css">
<style>

</style>
</head>
<body>
<div class="container">
<%@ include file="header.jsp" %>
<div class="content">
	<figure><img src="" alt="최근게시글보기" /></figure>
	<div class="notice">
	<!-- 최근 공지사항글 3개 -->
	<ul>
	<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, id, pw);
	sql = "select * from (select * from notice order by idx desc) where rownum <=3";
	stmt = conn.prepareStatement(sql);
	rs = stmt.executeQuery(sql);
	int n=0;
	while(rs.next()) {
	
		n++;
	%>
	<li><a href="noticeList.jsp"></a>
	
	
	<%
	}
	%>
	</ul>

	</div>
	<div class="product">
	<!-- 최근 제품 6개 -->
	<ul>
	<%
	int m=0;
	while(rs.next()) {
		m++;
	%>
	<li><a href=""></a></li>
	
	
	<%
	}
	rs.close();
	stmt.close();
	conn.close();	
	} catch (SQLException e) {
		out.println("SQL 구문 오류");
	} catch (Exception e) {
		
	}
	%>
	</ul>
	</div>
</div>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>