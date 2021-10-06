package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberSignupDao;
import com.java.db.dao.RegularExpressionDao;
import com.java.db.dao.ShopSignupDao;


public class ShopRegisterCMD implements MainCommand {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String shopnum = request.getParameter("shopNum");
		String shopv = request.getParameter("shopval");
		String shopid = request.getParameter("shopID");
		String password1 = request.getParameter("shopPassword1");
		String password2 = request.getParameter("shopPassword2");
		String shopPhone = request.getParameter("shopPhone");
		String managername = request.getParameter("managersName");
		String shopadress = null;

		String shopval = shopv;
		
		if(shopnum ==null||shopnum.equals("")||shopid ==null||shopid.equals("")||password1==null||password1.equals("")
				||password2 ==null||password2.equals("")||managername==null||managername.equals("")||
						shopPhone ==null||shopPhone.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
			response.sendRedirect("FoodTruckPage/signup_shop.jsp");
			return;
		}
		if(!password1.equals(password2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다");
			response.sendRedirect("FoodTruckPage/signup_shop.jsp");
			return;
		}
		
		
		if (true == RegularExpressionDao.regularID(shopid) && true == RegularExpressionDao.regularPW(password1)
				&& true == RegularExpressionDao.regularName(managername)
				&& true == RegularExpressionDao.regularPhone(shopPhone)) {
			int phoneresult = new ShopSignupDao().shopPhoneCheck(shopPhone);
			int shopidresult = new ShopSignupDao().shopIdCheck(shopid);
			int memberidresult = new MemberSignupDao().idCheck(shopid);
			int numresult = new ShopSignupDao().shopNumCheck(shopnum);
			int numinforesult = new ShopSignupDao().shopinfoNumCheck(shopnum);
			String shopname = new ShopSignupDao().shopinfoName(shopnum);
			//String 
			if (1 == phoneresult && 1 == shopidresult && 1==numresult && 1==numinforesult&&null!=shopname&&1==memberidresult) {
				if(false==shopval.equals("없음")) {
					int result = new ShopSignupDao().shopmanagerInsert(shopnum, shopval, shopid, password1, shopname,shopadress,shopPhone,managername);
					int inforesult = new ShopSignupDao().shoppinfoInsert(shopnum);
					if (1 == result&&1==inforesult) {
						request.getSession().setAttribute("messageType", "성공메시지");
						request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다!");
						response.sendRedirect("FoodTruckPage/signup_shop.jsp");
						return;
					} else {
						request.getSession().setAttribute("messageType", "오류 메시지");
						request.getSession().setAttribute("messageContent", "이미 존재하는 회원 또는 사용중인 전화번호입니다!");
						response.sendRedirect("FoodTruckPage/signup_shop.jsp");
						return;
					}
				}else {
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "분류를 선택해주세요!");
					response.sendRedirect("FoodTruckPage/signup_shop.jsp");
					return;
				}
			} else {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원 또는 사용중인 전화번호입니다!");
				response.sendRedirect("FoodTruckPage/signup_shop.jsp");
				return;
			}
		} else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "회원정보를 제대로 입력해주세요!");
			response.sendRedirect("FoodTruckPage/signup_shop.jsp");
			return;
		}
		 
		
	}
}
