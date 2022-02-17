package sec1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(id.equals("admin") && pw.equals("1234")) {
			out.println("관리자 로그인 성공~!");
		} else {
			out.println("관리자 로그인 실패~!");
		}
	}
}
