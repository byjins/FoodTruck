package com.java.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.ShopInfoDao;
import com.java.db.dto.ShopInfoDto;


@WebServlet("/IndexOptionValue")
public class IndexOptionValue extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String val = request.getParameter("val");		
		
		ArrayList<ShopInfoDto> dtos = new ArrayList<ShopInfoDto>();
		ShopInfoDao dao = new ShopInfoDao();
		
		dtos = dao.shopvalSelect(val);

		
		
		
		System.out.println("서블릿에서~ "+ dtos);
		request.setAttribute("dtos", dtos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("FoodTruckPage/index.jsp");
		dispatcher.forward(request, response);
		
	}
}