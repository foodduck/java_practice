package com.project1.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project1.model.NoticeVO;
import com.project1.model.Notice2VO;

@WebServlet("/DetailNoticeCtrl")
public class DetailNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String  n_id = request.getParameter("id");
		String sid = "";
		HttpSession session = request.getSession(); 
		sid = (String) session.getAttribute("id");
		if(sid==null) {
			response.sendRedirect("NoticeLstCtrl");
		}
		//연결자/상태코드/DB 접속 정보/sql 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버로딩/연결/상태정보로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from notice where n_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, n_id);
			rs = stmt.executeQuery();
			Notice2VO noti = new Notice2VO();
			if(rs.next()) { 
				noti.setId(rs.getString("id"));
				noti.setTitle(rs.getString("title"));
				noti.setContent(rs.getString("content"));
				noti.setAuthor(rs.getString("author"));
				noti.setRegdate(rs.getDate("regdate"));
				noti.setVisited(rs.getInt("visited"));
			} else {
				response.sendRedirect("index.jsp");
			}
			request.setAttribute("noti", noti);
			RequestDispatcher view = request.getRequestDispatcher("detailNotice.jsp");
			view.forward(request, response);
			rs.close();
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("e404.jsp");
		}
	}
}