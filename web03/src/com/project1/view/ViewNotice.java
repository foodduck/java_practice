package com.project1.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.model.Notice2VO;
@WebServlet("/ViewNotice")
public class ViewNotice extends HttpServlet {
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
		sql = "select * from notice";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		ArrayList<Notice2VO> noticeList = new ArrayList<Notice2VO>();
		
		if(rs.next()) {
			int n_idx = rs.getInt("idx");
			String n_id = rs.getString("id");
			String n_title = rs.getString("title");
			String n_content = rs.getString("content");
			String n_author = rs.getString("author");
			Date n_regdate = rs.getDate("regdate");
			int n_visited = rs.getInt("visited");
			Notice2VO noti = new Notice2VO();
			noti.setIdx(n_idx);
			noti.setId(n_id);
			noti.setTitle(n_title);
			noti.setContent(n_content);
			noti.setAuthor(n_author);
			noti.setRegdate(n_regdate);
			noti.setVisited(n_visited);
			
			noticeList.add(noti);
		}
		request.setAttribute("noticeList", noticeList);
		RequestDispatcher view = request.getRequestDispatcher("");
		view.forward(request, response);
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
