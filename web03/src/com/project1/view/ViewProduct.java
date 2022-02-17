package com.project1.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.model.ProductVO;


@WebServlet("/ViewProduct")
public class ViewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		sql = "select * from product";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		ArrayList<ProductVO> proList = new ArrayList<ProductVO>();
		if (rs.next()) {
			String p_id = rs.getString("id");
			String p_name = rs.getString("name");
			String p_description = rs.getString("description");
			String p_standard = rs.getString("standard");
			int p_price = rs.getInt("price");
			String p_img = rs.getString("img");
			ProductVO pdt = new ProductVO();
			pdt.setId(p_id);
			pdt.setName(p_name);
			pdt.setDescription(p_description);
			pdt.setStandard(p_standard);
			pdt.setPrice(p_price);
			proList.add(pdt);
			
			
		}
		request.setAttribute("proList", proList);
		RequestDispatcher view = request.getRequestDispatcher("");
		rs.close();
		stmt.close();
		conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
