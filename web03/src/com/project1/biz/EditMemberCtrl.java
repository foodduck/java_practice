package com.project1.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditMemberCtrl")
public class EditMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_question = request.getParameter("m_question");
		String m_answer = request.getParameter("m_answer");
		String m_address1 = request.getParameter("m_address1");
		String m_address2 = request.getParameter("m_address2");
		String m_regdate = request.getParameter("m_regdate");
		
		
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
			sql = "update member set name=?, email=?, question=?, answer=?, address1=?, address2=? where id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, m_name);
			stmt.setString(2, m_email);
			stmt.setString(3, m_question);
			stmt.setString(4, m_answer);
			stmt.setString(5, m_address1);
			stmt.setString(6, m_address2);
			stmt.setString(7, m_id);
			int cnt = stmt.executeUpdate();
			if(cnt == 0) { 
				response.sendRedirect("EditMemberFormCtrl");
			} else {
				response.sendRedirect("GetMemberListCtrl");
			}
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}