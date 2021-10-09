package com.java.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberInfoDao;
import com.java.db.dao.SManagerInfoDao;

public class FindIdCMD implements MainCommand {
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		MemberInfoDao mdao = new MemberInfoDao();
		SManagerInfoDao sdao = new SManagerInfoDao();
		
		if(name!=null&&phone!=null) {
			String mid = mdao.mfindID(name, phone);
			String sid = sdao.sfindID(name, phone);  
			
			if (sid != null && mid == null) {
				response.sendRedirect("idCheckView.do?id=" + sid);
			} else if (mid != null && sid == null) {
				response.sendRedirect("idCheckView.do?id=" + mid);
			} else if (mid == null && mid == null) {
				response.sendRedirect("idcheckView.do");
			}
		}else {
			response.sendRedirect("findId.do");
		}
	}
		
	}
