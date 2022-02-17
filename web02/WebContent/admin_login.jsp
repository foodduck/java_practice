<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String a_id = request.getParameter("a_id");
	String a_pw = request.getParameter("a_pw");
	if(a_id.equals("admin")){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			out.println(a_id+"가 입력되었습니다.");
			sql = "select * from admin where id=? and pw=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, a_id);
			stmt.setString(2, a_pw);
			rs = stmt.executeQuery();
			
			if(rs.next()) {	//반환된 결과가 있으면, 관리자(admin)으로 세션을 생성해줌
				session.setAttribute("a_id", rs.getString("id"));		//session.setAttribute("세션속성명", 값또는변수); 
				session.setAttribute("a_pw", rs.getString("pw"));  //setAttribute()는 세션을 생성해주는 세션객체의 메서드임
				response.sendRedirect("admin.jsp");
				//세션은 브라우저가 닫힐 때 까지 서버에 정보가 되며, 브라우저가 닫히면 자동 소멸됨
				rs.close();
				stmt.close();
				conn.close();	
			} else {
				response.sendRedirect("admin_login.html");
			}
	} catch(Exception e) {
		out.println("시스템에 오류가 있습니다.");
	}	
	} else {
		response.sendRedirect("index.jsp");
	}
%>    