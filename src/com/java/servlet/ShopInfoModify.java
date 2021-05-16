package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.RegularExpressionDao;
import com.java.db.dao.SManagerInfoDao;
import com.java.db.dao.ShopInfoDao;
import com.java.db.dto.SManagerInfoDto;

/**
 * Servlet implementation class ShopInfoModify
 */
@WebServlet("/ShopInfoModify")
public class ShopInfoModify extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String shopID = request.getParameter("sid");
		String shopPW = request.getParameter("shopPassword"); //현재 비밀번호
		String shopPWc1 = request.getParameter("shopPassword1"); //변경 비밀번호
		String shopPWc2 = request.getParameter("shopPassword2");
				
				
		SManagerInfoDto dto = new SManagerInfoDao().info(shopID);
		
		if (dto.getPw().equals(shopPW)&&true == RegularExpressionDao.regularPW(shopPWc1)&&shopPWc1.equals(shopPWc2)) {
			int result = new SManagerInfoDao().update(shopID, shopPWc1);
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
