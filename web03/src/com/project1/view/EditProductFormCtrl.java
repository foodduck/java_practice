package com.project1.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.model.ProductVO;


@WebServlet("/EditProductFormCtrl")
public class EditProductFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		String p_id = request.getParameter("id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from product where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p_id);
			rs = stmt.executeQuery();
			//ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
			ProductVO pdt = new ProductVO();
			if(rs.next()) {
//				String u_id = rs.getString("id");
//				String u_pw = rs.getString("pw");
//				String u_name = rs.getString("name");
//				String u_email = rs.getString("email");
//				String u_question = rs.getString("question");
//				String u_answer = rs.getString("answer");
//				String u_address1 = rs.getString("address1");
//				String u_address2 = rs.getString("address2");
//				Date u_regdate = rs.getDate("regdate");
				
				pdt.setId(rs.getString("id"));
				pdt.setName(rs.getString("name"));
				pdt.setDescription(rs.getString("description"));
				pdt.setStandard(rs.getString("standard"));
				pdt.setPrice(rs.getInt("price"));
				pdt.setImg(rs.getString("img"));
				//memberList.add(pdt); ???????????? 1?????????.
			} else {
				response.sendRedirect("GetProductListCtrl");
			}
			request.setAttribute("pdt", pdt);
			RequestDispatcher view = request.getRequestDispatcher("editProductForm.jsp");
			view.forward(request, response);
			rs.close();
			conn.close();
			stmt.close();
		} catch(SQLException e) {
			System.out.println("SQL ?????? ??????");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("?????? ??????");
			//response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	
	}

}
