package com.project1.biz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinCtrl")
public class JoinCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF=8");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("email");
		String m_question = request.getParameter("question");
		String m_answer = request.getParameter("answer");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		Connection conn = null;
		PreparedStatement stmt = null;
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="scott";
		String db_pw ="tiger";
		String sql;
		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setString(2, m_pw);
			stmt.setString(3, m_name);
			stmt.setString(4, m_email);
			stmt.setString(5, m_question);
			stmt.setString(6, m_answer);
			stmt.setString(7, address1);
			stmt.setString(8, address2);
			int r = stmt.executeUpdate();
			if(r>0) {
				response.sendRedirect("login.jsp");	
			} else {
				response.sendRedirect("joinForm.jsp");
			}
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		}
		
		
	}

}
