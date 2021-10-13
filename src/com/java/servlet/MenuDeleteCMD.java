package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MenuDao;
import com.java.db.dao.ShopInfoDao;


public class MenuDeleteCMD implements MainCommand {


	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_num = request.getParameter("menu_num");
		String s_num = request.getParameter("shop_num");

		System.out.println(m_num);
		System.out.println(s_num);
		
		MenuDao dao = new MenuDao();
		dao.menu_delete(s_num, m_num);

		try {
			response.sendRedirect("shop_management.do?shop_num=" + s_num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

