package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberSignupDao;

@WebServlet("/UserRegisterCheckServlet")
public class UserRegisterCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userid = request.getParameter("userID");
		String userphone = request.getParameter("userPhone");
		if(userid==null) {
			
		}else {
			response.getWriter().write(new MemberSignupDao().idCheck(userid)+"");
		}
		
		if(userphone==null) {
		}else {
			response.getWriter().write(new MemberSignupDao().phoneCheck(userphone)+"");
		}
	}
}
