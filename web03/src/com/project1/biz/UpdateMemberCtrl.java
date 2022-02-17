package com.project1.biz;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateMemberCtrl")
public class UpdateMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_question = request.getParameter("m_question");
		String m_answer = request.getParameter("m_answer");
		String m_address1 = request.getParameter("m_address1");
		String m_address2 = request.getParameter("m_address2");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			System.out.println(m_id+"입력됨");
			sql = "update member set pw =?, name=?, email=?, question=?, answer=?, address1=?, address2=? where id =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_pw);
			stmt.setString(2, m_name);
			stmt.setString(3, m_email);
			stmt.setString(4, m_question);
			stmt.setString(5, m_answer);
			stmt.setString(6, m_address1);
			stmt.setString(7, m_address2);
			stmt.setString(8, m_id);
			int r = stmt.executeUpdate();
			if (r>0) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("myPage.jsp?m_id"+m_id);
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		}
		
	}

}
