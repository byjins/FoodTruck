package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberSignupDao;
import com.java.db.dao.ShopSignupDao;

public class ShopRegisterCheckCMD implements MainCommand {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String shopid = request.getParameter("shopID");
		String shopphone = request.getParameter("shopPhone");
		String shopnum = request.getParameter("shopNum");
		
		int result = new MemberSignupDao().idCheck(shopid);
		if(shopid!=null && 1==result) {
			response.getWriter().write(new ShopSignupDao().shopIdCheck(shopid)+"");
		}
		
		if(shopphone!=null) {response.getWriter().write(new ShopSignupDao().shopPhoneCheck(shopphone)+"");
		}
		if(shopnum!=null&&1==new ShopSignupDao().shopNumCheck(shopnum)&&1==new ShopSignupDao().shopinfoNumCheck(shopnum)) {
			response.getWriter().write(new ShopSignupDao().shopNumCheck(shopnum)+"");
		}
		
	}
}
