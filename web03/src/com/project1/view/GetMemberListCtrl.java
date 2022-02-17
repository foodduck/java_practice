package com.project1.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project1.model.MemberVO;

@WebServlet("/GetMemberListCtrl")
public class GetMemberListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "scott";
		String db_pw = "tiger";
		String sql;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			sql = "select * from member";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();	
			//select로 검색한 데이터를 저장한 공간 마련
			while(rs.next()) {
				String u_id = rs.getString("id");
				String u_pw = rs.getString("pw");
				String u_name = rs.getString("name");
				String u_email = rs.getString("email");
				String u_question = rs.getString("question");
				String u_answer = rs.getString("answer");
				String u_address1 = rs.getString("address1");
				String u_address2 = rs.getString("address2");
				Date u_regdate = rs.getDate("regdate");
				MemberVO mem = new MemberVO();	// 한 회원의 컬럼 데이터를 VO에 담는다.
				mem.setId(u_id);
				mem.setPw(u_pw);
				mem.setName(u_name);
				mem.setEmail(u_email);
				mem.setQuestion(u_question);
				mem.setAnswer(u_answer);
				mem.setAddress1(u_address1);
				mem.setAddress2(u_address2);
				mem.setRegdate(u_regdate);
				
				//mem.setYesno(rs.getString("yesno"));
				memberList.add(mem);	//VO에 담긴 여러 건의 데이터들를 List에 담는다. 
			}
			request.setAttribute("memberList", memberList);		//보내질 List 데이터를 지정
			RequestDispatcher view = request.getRequestDispatcher("getMemberList.jsp");  //보내질 곳 지정 
			view.forward(request, response);	//지정한 URL로 데이터를 송신
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			response.sendRedirect("e404.jsp");
			e.printStackTrace();
		}
	}
}