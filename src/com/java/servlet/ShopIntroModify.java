package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.ShopInfoDao;

/**
 * Servlet implementation class ShopIntroModify
 */
@WebServlet("/ShopIntroModify")
public class ShopIntroModify extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}
	protected void action(HttpServletRequest request, HttpServletResponse response) {
		
		String s_intro = request.getParameter("introarea");
		String s_num = request.getParameter("shop_num");
		
		
		ShopInfoDao dao = new ShopInfoDao();
		dao.shop_update(s_num, s_intro);
		
		try {
			response.sendRedirect("FoodTruckPage/shop_management.jsp?shop_num=" + s_num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}