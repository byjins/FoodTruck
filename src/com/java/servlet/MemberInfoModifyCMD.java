package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberInfoDao;
import com.java.db.dao.MemberSignupDao;
import com.java.db.dao.RegularExpressionDao;
import com.java.db.dao.ShopSignupDao;
import com.java.db.dto.MemberDto;



public class MemberInfoModifyCMD implements MainCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("mid");
		String userPW = request.getParameter("userPassword"); //현재 비밀번호
		String userPWc1 = request.getParameter("userPassword1"); //변경 비밀번호
		String userPWc2 = request.getParameter("userPassword2"); //변경 비밀번호
		 
		MemberDto dto = new MemberInfoDao().info(userID);
		
		if (dto.getPw().equals(userPW)&&true == RegularExpressionDao.regularPW(userPWc1)&&userPWc1.equals(userPWc2)) {
			int result = new MemberInfoDao().update(userID, userPWc1);
			if(1==result) {
				request.getSession().setAttribute("messageType", "성공메시지");
				request.getSession().setAttribute("messageContent", "비밀번호 변경 성공!");
				response.sendRedirect("FoodTruckPage/modify.jsp");
			}else {
				request.getSession().setAttribute("messageType", "실패메시지");
				request.getSession().setAttribute("messageContent", "업데이트 실패!");
				response.sendRedirect("FoodTruckPage/modify.jsp");
			}
		} else {
			request.getSession().setAttribute("messageType", "실패메시지");
			request.getSession().setAttribute("messageContent", "현재비밀번호 및 변경비밀번호 미일치");
			response.sendRedirect("FoodTruckPage/modify.jsp");
		}
		
	}

}
