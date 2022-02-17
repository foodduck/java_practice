package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.biz.TestProductDAO;
import test.model.TestProductVO;

@WebServlet("/InsertTestProductCtrl")
public class InsertTestProductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pcode = request.getParameter("pcode");
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		String standard = request.getParameter("standard");
		String description = request.getParameter("description");
		
		
		TestProductVO vo = new TestProductVO();
		vo.setPcode(pcode);
		vo.setPname(pname);
		vo.setPrice(price);
		vo.setStandard(standard);
		vo.setDescription(description);
		
		
		TestProductDAO dao = new TestProductDAO();
		int r = dao.insertTestProduct(vo);
		
		if(r != 0) {
			response.sendRedirect("GetProductListCtrl");
		} else {
			response.sendRedirect("GetProductListCtrl");
		} 
	}

}
