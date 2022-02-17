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

@WebServlet("/JoinTestMemberCtrl")
public class JoinTestMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("mid");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		
		
		TestMemberVO vo = new TestMemberVO();
		vo.setMid(mid);
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPostcode(postcode);
		vo.setAddress(address);
		
		
		TestMemberDAO dao = new TestMemberDAO();
		TestMemberVO TestMember = new TestMemberVO();
		
		int cnt = dao.joinTestMember(vo);
		HttpSession session = request.getSession();
		
		if(cnt>0) {
			response.sendRedirect("login.jsp");
		}  else {
			response.sendRedirect("/testmember/joinTestMember.jsp");
		}
	}
}