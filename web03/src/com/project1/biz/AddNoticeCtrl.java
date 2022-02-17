package com.project1.biz;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddNoticeCtrl")
public class AddNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//보내온 데이터 받을 변수
		String  n_id = request.getParameter("n_id");
		String  n_title = request.getParameter("n_title");
		String  n_content = request.getParameter("n_content");
		String  n_author = request.getParameter("n_author");
		
		//컨넥터/상태코드/DB 연결 변수/기타 변수 선언
		Connection con = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			//드라이버 로딩/연결/상태코드 연결/SQL문 실행
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
			sql = "insert into notice2 values (aaa.NEXTVAL, ?, ?, ?, ?, sysdate, 0)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, n_id);
			stmt.setString(2, n_title);
			stmt.setString(3, n_content);
			stmt.setString(4, n_author);
			int r = stmt.executeUpdate();
			if(r!=0) {
				response.sendRedirect("GetNoticeListCtrl");
			} else {
				response.sendRedirect("addNoticeForm.jsp");
			}
			//구성요소 닫기
			stmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}