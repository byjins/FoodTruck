package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.db.dao.SManagerInfoDao;
import com.java.db.dao.ShopGeolocationDao;
import com.java.db.dto.SManagerInfoDto;


public class ShopCloseCMD implements MainCommand {

		@Override
		public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String sId = (String) session.getAttribute("shop_id");//사업자 세션 받아욤

			String num = null;
			System.out.println("/세션값 : " + sId);
			double areaX = 0.0;
			double areaY = 0.0;

			SManagerInfoDto smDto = new SManagerInfoDto();
			SManagerInfoDao smDao = new SManagerInfoDao();

			smDto = smDao.info(sId);

			num = smDto.getNum().toString();

			ShopGeolocationDao SgDao = new ShopGeolocationDao();
			
			SgDao.updateDao(0.0, 0.0, num, 0);
			
			response.sendRedirect("index.jsp");
		}
		
}
