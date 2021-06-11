package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MenuDao;
import com.java.db.dao.ShopInfoDao;


@WebServlet("/MenuDelete")
public class MenuDelete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	protected void action(HttpServletRequest request, HttpServletResponse response) {
		String m_num = request.getParameter("menu_num");
		String s_num = request.getParameter("shop_num");

		System.out.println(m_num);
		System.out.println(s_num);
		
		MenuDao dao = new MenuDao();
		dao.menu_delete(s_num, m_num);

		try {
			response.sendRedirect("FoodTruckPage/shop_management.jsp?shop_num=" + s_num);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}

