package com.project1.biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.model.MemberVO;


@WebServlet("/DeleteMemberCtrl")
public class DeleteMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ck = request.getParameterValues("ck");
		//PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt=null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			for(int i=0;i<ck.length;i++) {
				sql = "delete from member where id =?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, ck[i]);
				int r = stmt.executeUpdate();
				if(r>0) {
					
					System.out.println(r+" 건의 항목을 삭제했습니다.");
					response.sendRedirect("GetMemberListCtrl");
				} else {
					
					System.out.println("삭제 실패");
					response.sendRedirect("GetMemberListCtrl");
				}
			}
		
			stmt.close();
			conn.close();
		} catch(SQLException e){
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		}
	}

}
