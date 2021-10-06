package com.java.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.servlet.ChangePwCMD;
import com.java.servlet.LoginMemberCMD;
import com.java.servlet.LoginShopCMD;
import com.java.servlet.MainCommand;
import com.java.servlet.ShopCloseCMD;
import com.java.servlet.ShopIntroModifyCMD;
import com.java.servlet.ShopOpenCMD;
import com.java.servlet.ShopRegisterCMD;
import com.java.servlet.ShopRegisterCheckCMD;
import com.java.servlet.UserRegisterCMD;
import com.java.servlet.UserRegisterCheckCMD;


@WebServlet("*.do")
public class MainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}
	
	protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());

		
		//연결요청이 main으로 왔을때
		if (cmd.equals("/main.do")) {
			viewPage = "index.jsp";
		}
		// logout
		else if (cmd.equals("/logout.do")) {
			viewPage = "index.jsp";
		}
		// login
		else if (cmd.equals("/loginmain.do")) {
			viewPage = "login_main.jsp";
		}
		else if (cmd.equals("/loginshop.do")) {
			viewPage = "signup_main.jsp";
		}
		else if (cmd.equals("/loginShop.do")) {
			MainCommand sLogin = new LoginShopCMD();
			sLogin.excute(request, response);
		}
		else if (cmd.equals("/loginMember.do")) {
			MainCommand mLogin = new LoginMemberCMD();
			mLogin.excute(request, response);
		}
		else if (cmd.equals("/ShopOpen.do")) {
			MainCommand sOpen = new ShopOpenCMD();
			sOpen.excute(request, response);
		}
		else if (cmd.equals("/ShopClose.do")) {
			MainCommand sClose = new ShopCloseCMD();
			sClose.excute(request, response);
		}
		else if (cmd.equals("/UserRegister.do")) {
			MainCommand uRegister = new UserRegisterCMD();
			uRegister.excute(request, response);
		}
		else if (cmd.equals("/UserRegisterCheck.do")) {
			MainCommand uRegisterCheck = new UserRegisterCheckCMD();
			uRegisterCheck.excute(request, response);
		}
		else if (cmd.equals("/ShopRegister.do")) {
			MainCommand sRegister = new ShopRegisterCMD();
			sRegister.excute(request, response);
		}
		else if (cmd.equals("/ShopRegisterCheck.do")) {
			MainCommand sRegisterCheck = new ShopRegisterCheckCMD();
			sRegisterCheck.excute(request, response);
		}
		else if (cmd.equals("/ChangePw.do")) {
			MainCommand ChangePw = new ChangePwCMD();
			ChangePw.excute(request, response);
		}
		else if (cmd.equals("/ShopIntroModify.do")) {
			MainCommand ShopIntroModify = new ShopIntroModifyCMD();
			ShopIntroModify.excute(request, response);
		}
		
		
		
		if (viewPage != null) {
			//해당 요청 viewPage에 맞는 jsp View로 forward
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
