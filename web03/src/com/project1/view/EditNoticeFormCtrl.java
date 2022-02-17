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

import com.project1.model.Notice2VO;


@WebServlet("/EditNoticeFormCtrl")
public class EditNoticeFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		String n_id = request.getParameter("id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from notice2 where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, n_id);
			rs = stmt.executeQuery();
			//ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
			Notice2VO noti = new Notice2VO();
			
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
				
				noti.setIdx(rs.getInt("idx"));
				noti.setId(rs.getString("id"));
				noti.setTitle(rs.getString("title"));
				noti.setContent(rs.getString("content"));
				noti.setAuthor(rs.getString("author"));
				noti.setRegdate(rs.getDate("regdate"));
				noti.setVisited(rs.getInt("visited"));
				//memberList.add(noti); 데이터가 1건이다.
			} else {
				response.sendRedirect("GetNoticeListCtrl");
			}
			request.setAttribute("noti", noti);
			RequestDispatcher view = request.getRequestDispatcher("editNoticeForm.jsp");
			view.forward(request, response);
			rs.close();
			conn.close();
			stmt.close();
		} catch(SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			//response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	
	}

}
