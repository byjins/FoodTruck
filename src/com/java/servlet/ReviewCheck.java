package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.db.dao.ReviewDao;

/**
 * Servlet implementation class ReviewCheck
 */
@WebServlet("/ReviewCheck")
public class ReviewCheck extends HttpServlet {

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}
	
	protected void action(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		ReviewDao dao = new ReviewDao();
		
		String id = (String)session.getAttribute("member_id");
		String comment = request.getParameter("comment");
		String rating = request.getParameter("rating");
		String num = request.getParameter("shop_num");
		Double score = Double.parseDouble(rating);
		
		
		dao.insert_review(id, num, comment, score);
		
		try {
			response.sendRedirect("FoodTruckPage/shop_info.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
