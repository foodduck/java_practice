package com.project1.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditProductCtrl")
public class EditProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String p_id = request.getParameter("p_id");
		String p_name = request.getParameter("p_name");
		String p_description = request.getParameter("p_description");
		String p_standard = request.getParameter("p_standard");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		String p_img = request.getParameter("p_img");		
		
		//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "update product set name=?, description=?, standard=?, price=?, img=? where id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, p_name);
			stmt.setString(2, p_description);
			stmt.setString(3, p_standard);
			stmt.setInt(4, p_price);
			stmt.setString(5, p_img);
			stmt.setString(6, p_id);
			int cnt = stmt.executeUpdate();
			if(cnt == 0) { 
				response.sendRedirect("EditProductFormCtrl");
			} else {
				response.sendRedirect("GetProductListCtrl");
			}
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}