package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.db.dao.ReviewDao;


public class ReviewCheckCMD implements MainCommand {


	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ReviewDao dao = new ReviewDao();
		
		String id = (String)session.getAttribute("member_id");
		String comment = request.getParameter("comment");
		String rating = request.getParameter("rating");
		String num = request.getParameter("shop_num");
		Double score = Double.parseDouble(rating);
		
		
		dao.insert_review(id, num, comment, score);
		
		try {
			response.sendRedirect("FoodTruckPage/shop_info.jsp?shop_num=" + num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
