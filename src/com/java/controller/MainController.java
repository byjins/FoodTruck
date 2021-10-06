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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action(request, response);
	}

	protected void action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;

		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());

		// 연결요청이 main으로 왔을때
		if (cmd.equals("/main.do")) {
			viewPage = "index.jsp";
		}
		// 로그아웃 눌렀을때
		else if (cmd.equals("/logout.do")) {
			viewPage = "logout_process.jsp";
		}
		// 로그인 메인 뷰 페이지
		else if (cmd.equals("/loginmain.do")) {
			viewPage = "login_main.jsp";
		}
		// 유저 로그인 뷰 페이지
		else if (cmd.equals("/loginmemberview.do")) {
			viewPage = "login_member.jsp";
		}
		// 유저 로그인 기능
		else if (cmd.equals("/loginmember.do")) {
			MainCommand mLogin = new LoginMemberCMD();
			mLogin.excute(request, response);
		}
		// 가게 로그인 뷰 페이지
		else if (cmd.equals("/loginshopview.do")) {
			viewPage = "login_shop.jsp";
		}
		// 가게 로그인 기능
		else if (cmd.equals("/loginshop.do")) {
			MainCommand sLogin = new LoginShopCMD();
			sLogin.excute(request, response);
		}

		// 회원가입 메인 뷰 페이지
		else if (cmd.equals("/signupmain.do")) {
			viewPage = "signup_main.jsp";
		}

		// 회원가입 유저 뷰 페이지
		else if (cmd.equals("/signupmemberview.do")) {
			viewPage = "signup_member.jsp";
		}
		// 유저회원가입 기능
		else if (cmd.equals("/userRegister.do")) {
			MainCommand uRegister = new UserRegisterCMD();
			uRegister.excute(request, response);
		}
		// 유저 중복체크 및 유효성검사
		else if (cmd.equals("/UserRegisterCheck.do")) {
			MainCommand uRegisterCheck = new UserRegisterCheckCMD();
			uRegisterCheck.excute(request, response);
		}
		// 회원가입 가게 뷰 페이지
		else if (cmd.equals("/signupshopview.do")) {
			viewPage = "signup_shop.jsp";
		}
		// 가게 회원가입 기능
		else if (cmd.equals("/ShopRegister.do")) {
			MainCommand sRegister = new ShopRegisterCMD();
			sRegister.excute(request, response);
		}
		// 가게회원 중복체크 및 유효성검사
		else if (cmd.equals("/ShopRegisterCheck.do")) {
			MainCommand sRegisterCheck = new ShopRegisterCheckCMD();
			sRegisterCheck.excute(request, response);
		}
		// 가게 영업시작
		else if (cmd.equals("/shopopen.do")) {
			MainCommand sOpen = new ShopOpenCMD();
			sOpen.excute(request, response);
		}
		// 가게 영업종료
		else if (cmd.equals("/shopclose.do")) {
			MainCommand sClose = new ShopCloseCMD();
			sClose.excute(request, response);
		}
		// 내정보보기
		else if (cmd.equals("/myinfo.do")) {
			viewPage = "myinfo.jsp";
		}
		// 정보수정 클릭 <--------여기까지는 함
		else if (cmd.equals("/modify.do")) {
			viewPage = "modify.jsp";
		}
		// 비밀번호 변경 <-------이게 왜안돼?
		else if (cmd.equals("/ChangePw.do")) {
			MainCommand ChangePw = new ChangePwCMD();
			ChangePw.excute(request, response);
		}
		// 비밀번호 변경 완료시 --- 변경완료가 안된다.
		else if (cmd.equals("/findPwSucceed.do")) {
			MainCommand ChangePw = new ChangePwCMD();
			ChangePw.excute(request, response);
		}
		// 가게정보수정
		else if (cmd.equals("/ShopIntroModify.do")) {
			MainCommand ShopIntroModify = new ShopIntroModifyCMD();
			ShopIntroModify.excute(request, response);
		}

		if (viewPage != null) {
			// 해당 요청 viewPage에 맞는 jsp View로 forward
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
