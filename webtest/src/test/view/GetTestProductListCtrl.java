package test.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.biz.TestProductDAO;
import test.model.TestProductVO;

@WebServlet("/GetTestProductListCtrl")
public class GetTestProductListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		TestProductDAO dao = new TestProductDAO();
		ArrayList<TestProductVO> testProductList = dao.getTestProductList();
		request.setAttribute("testProductList", testProductList);
		RequestDispatcher view = request.getRequestDispatcher("/testproduct/getTestProductList.jsp");
		view.forward(request, response);
		
	}

}
