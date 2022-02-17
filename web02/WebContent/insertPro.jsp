<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	//가격과 수량은 데이터베이스에 저장되려면 숫자로 저장해야하므로 형 변환이 되어야 한다.
	String p_code = request.getParameter("p_code");
	String p_name = request.getParameter("p_name");
	int p_price = Integer.parseInt(request.getParameter("p_price"));
	int p_cnt = Integer.parseInt (request.getParameter("p_cnt"));
	String p_img = request.getParameter("p_img");

	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String id ="scott";
	String pw ="tiger";
	String sql;
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		out.println(p_code+"가 입력되었습니다.");
		sql = "insert into product values (?, ?, ?, ?, ?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, p_code);
		stmt.setString(2, p_name);
		stmt.setInt(3, p_price);
		stmt.setInt(4, p_cnt);
		stmt.setString(5, p_img);
		int r = stmt.executeUpdate();
		if(r>0) {
			response.sendRedirect("index.jsp");	
		} else {
			response.sendRedirect("insertProduct.jsp");
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println("시스템 오류");
	}
	
%>