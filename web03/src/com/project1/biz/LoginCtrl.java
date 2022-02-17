package com.project1.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String id ="scott";
		String pw ="tiger";
		String sql;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			//out.println(m_id+"가 입력되었습니다.");
			sql = "select * from member where id=? and pw=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setString(2, m_pw);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				session.setAttribute("m_id", rs.getString("id"));
				session.setAttribute("m_pw", rs.getString("pw"));
				response.sendRedirect("index.jsp");
				rs.close();
				stmt.close();
				conn.close();
			} else {
				response.sendRedirect("login.html");
			}
		} catch(SQLException e) {
			//out.println("SQL구문 오류");
			e.printStackTrace();
		} catch(Exception e) {
			//out.println("시스템 오류");
			e.printStackTrace();
		}
	}
}
