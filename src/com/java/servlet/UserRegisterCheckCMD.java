package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberSignupDao;
import com.java.db.dao.ShopSignupDao;

public class UserRegisterCheckCMD implements MainCommand {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userid = request.getParameter("userID");
		String userphone = request.getParameter("userPhone");
		
		int result = new ShopSignupDao().shopIdCheck(userid);
		
		if(userid!=null&&1==result) {response.getWriter().write(new MemberSignupDao().idCheck(userid)+"");}
		if(userphone!=null) {response.getWriter().write(new MemberSignupDao().phoneCheck(userphone)+"");}
	}
}
