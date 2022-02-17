package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.biz.TestMemberDAO;
import test.model.TestMemberVO;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("mid");
		String pw = request.getParameter("pw");
		
		TestMemberVO vo = new TestMemberVO();
		vo.setMid(mid);
		vo.setPw(pw);
		
		TestMemberVO tm = new TestMemberVO();
		TestMemberDAO dao = new TestMemberDAO();
		tm = dao.loginTestMember(vo);
		HttpSession session = request.getSession();
		
		if (tm!=null) {
			session.setAttribute(mid, tm.getMid());
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("join.jsp");
		}
	}
}
