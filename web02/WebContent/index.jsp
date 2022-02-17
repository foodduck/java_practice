<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <link rel="stylesheet"href="./css/reset.css">
    <link rel="stylesheet"href="./css/main.css">
    <link rel="stylesheet"href="./css/common.css">
<%   
		String uid = (String) session.getAttribute("id");
		if (uid!=null) {
%>
<!-- top navigation bar-->
	<nav class="tnb">
		<ul>
			<li><a href="logout.jsp">로그아웃</a></li>
			<li><a href="">정보수정</a></li>
			<li><a href="">사이트맵</a></li>
			
		</ul>
	</nav>
	<!-- global navigation bar-->
	<nav class="gnb">
		<ul>
			<li><a href="product.jsp">제품정보</a></li>
			<li><a href="commmunity.jsp">게시판</a></li>
			<li><a href="company.jsp">회사소개</a></li>
			<li><a href="">메뉴4</a></li>
			<li><a href="">메뉴5</a></li>
		</ul>
	</nav>
<%
		} else {
%>
<!-- top navigation bar-->
	<nav class="tnb">
		<ul>
			<li><a href="login.html">로그인</a></li>
			<li><a href="agreement.jsp">회원가입</a></li>
			<li><a href="">사이트맵</a></li>
		</ul>
	</nav>
	<!-- global navigation bar-->
	<nav class="gnb">
		<ul>
			<li><a href="product.jsp">제품정보</a></li>
			<li><a href="commmunity.jsp">게시판</a></li>
			<li><a href="company.jsp">회사소개</a></li>
			<li><a href="">메뉴4</a></li>
			<li><a href="">메뉴5</a></li>
		</ul>
	</nav>
<%
		}
%>
<body>
	
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
		sql = "select * from product order by proNum desc";
		rs = stmt.executeQuery(sql);
%>
	<section class="content" style="background-color: #f1f1f1;">
        <figure class="vs">
            <img src="http://placehold.it/1200x400/333" alt="비주얼 배너">
        </figure>
        <h2 class="con_tit">상품 목록</h2>
        <article class="art01">
            <ul>
<%	
		while (rs.next()) {
			String proNum = rs.getString("proNum");
			String proName = rs.getString("proName");
			int proPrice = rs.getInt("proPrice");
			int proCnt = rs.getInt("proCnt");
			String proImg = rs.getString("proImg");
			if(proImg==null) {
				proImg = "./img/noimg.png";
			}
%>
                <li>
                    <img src="<%=proImg %>" alt="<%=proNum %>">
                    <h3 class="pro_tit"><%=proName %></h3>
                    <p class="pro_com"><%=proPrice %>
                   	 남은 수량: <%=proCnt %></p>
                </li>
<%
		}
		rs.close();
		stmt.close();
		conn.close();
%>
            </ul>
        </article>
    </section>
	<!-- 푸터 -->
	<%@ include file='footer.jsp' %>
</body>
</html>