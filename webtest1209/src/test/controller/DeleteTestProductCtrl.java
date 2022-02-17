package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.biz.TestProductDAO;
import test.model.TestProductVO;


@WebServlet("/DeleteTestProductCtrl")
public class DeleteTestProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int cnt =0;
		TestProductVO vo = new TestProductVO();
		vo.setIdx(idx);
		
		TestProductDAO dao = new TestProductDAO();
		cnt = dao.deleteTestProduct(vo);
		if(cnt>0) {
			response.sendRedirect("GetTestProductListCtrl");
		}
	}

}
