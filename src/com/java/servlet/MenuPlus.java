package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MenuDao;
import com.java.db.dao.ShopInfoDao;


@WebServlet("/MenuPlus")
public class MenuPlus extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	protected void action(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String m_name = request.getParameter("menu_name");
		String m_price = request.getParameter("menu_price");
		String m_intro = request.getParameter("menu_intro");
		String s_num = request.getParameter("shop_num");
		int price = Integer.parseInt(m_price);

		MenuDao dao = new MenuDao();
		dao.menu_insert(s_num, m_name, price, m_intro);

		String str = "";
		str = "<script language='javascript'>";
		str += "opener.window.location.reload();";
		str += "window.close()";
		str += "</script>";
		out.print(str);

	}
}

