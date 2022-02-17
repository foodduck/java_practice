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

@WebServlet("/GetProductListCtrl")
public class GetProductListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from product order by id";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<ProductVO> prolist = new ArrayList<ProductVO>();
			
			while(rs.next()) {
				String p_id = rs.getString("id");
				String p_name = rs.getString("name");
				String p_description = rs.getString("description");
				String p_standard = rs.getString("standard");
				int p_price = rs.getInt("price");
				String p_img = rs.getString("img");
				
				ProductVO pv = new ProductVO();
				
				pv.setId(p_id);
				pv.setName(p_name);
				pv.setDescription(p_description);
				pv.setStandard(p_standard);
				pv.setPrice(p_price);
				pv.setImg(p_img);
				prolist.add(pv);
			}
			
			request.setAttribute("prolist", prolist);
			RequestDispatcher rdp = request.getRequestDispatcher("getProductList.jsp");
			rdp.forward(request,response);
			rs.close();
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("기타 예외");
		}
	}

}
