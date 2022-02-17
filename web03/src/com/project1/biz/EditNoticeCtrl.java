package com.project1.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditNoticeCtrl")
public class EditNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int n_idx = Integer.parseInt(request.getParameter("n_idx"));
		String n_id = request.getParameter("n_id");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_author = request.getParameter("n_author");
		String n_regdate = request.getParameter("n_regdate");
		int n_visited = Integer.parseInt(request.getParameter("n_visited"));		
		
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
			sql = "update notice2 set title=?, content=?, visited=? where id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, n_title);
			stmt.setString(2, n_content);
			stmt.setInt(3, n_visited);
			stmt.setString(4, n_id);
			int cnt = stmt.executeUpdate();
			if(cnt == 0) { 
				response.sendRedirect("EditNoticeFormCtrl");
			} else {
				response.sendRedirect("GetNoticeListCtrl");
			}
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}