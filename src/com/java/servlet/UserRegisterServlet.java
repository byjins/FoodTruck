package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberSignupDao;
import com.java.db.dao.RegularExpressionDao;
import com.java.db.dao.ShopSignupDao;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID= 1L;
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userid = request.getParameter("userID");
		String password1 = request.getParameter("userPassword1");
		String password2 = request.getParameter("userPassword2");
		String username = request.getParameter("userName");
		String memberage = request.getParameter("userAge");
		String mPhone = request.getParameter("userPhone");
		

		
		
		
		if(userid ==null||userid.equals("")||password1==null||password1.equals("")
				||password2 ==null||password2.equals("")||username==null||username.equals("")||
						memberage ==null||memberage.equals("")||mPhone==null||mPhone.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
			response.sendRedirect("FoodTruckPage/signup_member.jsp");
			return;
		}
		if(!password1.equals(password2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다");
			response.sendRedirect("FoodTruckPage/signup_member.jsp");
			return;
		}
		
		if (true == RegularExpressionDao.regularID(userid) 
				&& true == RegularExpressionDao.regularPW(password1)
				&& true == RegularExpressionDao.regularName(username)
				 && true == RegularExpressionDao.regularPhone(mPhone)
															 )
				 {
			int phoneresult = new MemberSignupDao().phoneCheck(mPhone);
			int idresult = new MemberSignupDao().idCheck(userid);
			int shopidresult = new ShopSignupDao().shopIdCheck(userid);
			if(1==phoneresult&&1==idresult&&1==shopidresult) {
				int result = new MemberSignupDao().mInsert(userid,password1,username,memberage,mPhone);
				
				if(1==result) { 
					request.getSession().setAttribute("messageType", "성공메시지");
					request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다!");
					response.sendRedirect("FoodTruckPage/signup_member.jsp");
					return;
				}
				else {
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "이미 존재하는 회원 또는 사용중인 전화번호입니다!");
					response.sendRedirect("FoodTruckPage/signup_member.jsp");
					return;
				}
			}else {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원 또는 사용중인 전화번호입니다!");
				response.sendRedirect("FoodTruckPage/signup_member.jsp");
				return;
			}
		}else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "회원정보를 제대로 입력해주세요!");
			response.sendRedirect("FoodTruckPage/signup_member.jsp");
			return;
		}
		
	}
}