package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.CustomVO;

@WebServlet("/B07GetJavaDataCtrl")
public class B07GetJavaDataCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] name = {"김기태", "곽규석", "신수진"};
		
		ArrayList<String> list = new ArrayList<>();
		list.add("망고");
		list.add("딸기");
		list.add("체리");
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("kim", 29);
		map.put("lee", 28);
		map.put("myoeng", 21);
		
		CustomVO vo = new CustomVO();
		vo.setCusid("kkt");
		vo.setCusname("김기택");
		vo.setCusemail("kkt@haha.com");
		
		request.setAttribute("name", name);
		request.setAttribute("list", list);
		request.setAttribute("map", map);
		request.setAttribute("vo", vo);
		
		RequestDispatcher view = request.getRequestDispatcher("B07GetJavaData.jsp");
		view.forward(request, response);
	}
}