package com.project1.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddProductCtrl")
public class AddProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//보내온 데이터 받을 변수
		String  p_id = request.getParameter("p_id");
		String  p_name = request.getParameter("p_name");
		String  p_description = request.getParameter("p_description");
		String  p_standard = request.getParameter("p_standard");
		int p_price =Integer.parseInt(request.getParameter("p_price"));
		String p_img = request.getParameter("p_img");
		if (p_img=="") {
			p_img="./img/noimg.jpg";
		}
		Connection conn = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버 로딩/연결/상태코드 연결/SQL문 실행
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "insert into product values (?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p_id);
			stmt.setString(2, p_name);
			stmt.setString(3, p_description);
			stmt.setString(4, p_standard);
			stmt.setInt(5, p_price);
			stmt.setString(6, p_img);
			int r = stmt.executeUpdate();
			if(r!=0) {
				response.sendRedirect("GetProductListCtrl");
			} else {
				response.sendRedirect("addProductForm.jsp");
			}
			//구성요소 닫기
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}