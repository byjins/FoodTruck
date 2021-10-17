package com.java.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.servlet.ChangePwCMD;
import com.java.servlet.FindIdCMD;
import com.java.servlet.FindPwCMD;
import com.java.servlet.LoginMemberCMD;
import com.java.servlet.LoginShopCMD;
import com.java.servlet.MainCommand;
import com.java.servlet.MemberInfoModifyCMD;
import com.java.servlet.MenuDeleteCMD;
import com.java.servlet.MenuPlusCMD;
import com.java.servlet.ReviewCheckCMD;
import com.java.servlet.ShopCloseCMD;
import com.java.servlet.ShopInfoModifyCMD;
import com.java.servlet.ShopIntroModifyCMD;
import com.java.servlet.ShopOpenCMD;
import com.java.servlet.ShopRegisterCMD;
import com.java.servlet.ShopRegisterCheckCMD;
import com.java.servlet.UserPositionCheckCMD;
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
		// 아이디찾기 뷰 페이지
		else if (cmd.equals("/findIdView.do")) {
			viewPage = "find_id.jsp";
		} else if (cmd.equals("/idCheckView.do")) {
			viewPage = "idcheck.jsp";
		}
		// 패스워드찾기 뷰 페이지
		else if (cmd.equals("/findPwView.do")) {
			viewPage = "find_pw.jsp";
		}
		// 패스워드 검증 뷰 페이지
		else if (cmd.equals("/pwCheckView.do")) {
			viewPage = "pwcheck.jsp";
		}
		// 유저 근처가게 받아오는 기능
		else if (cmd.equals("/UserPositionCheck.do")) {
			MainCommand userPosition = new UserPositionCheckCMD();
			userPosition.excute(request, response);
		}
		// 아이디 찾기 기능
		else if (cmd.equals("/findId.do")) {
			MainCommand findId = new FindIdCMD();
			findId.excute(request, response);
		}
		// 비밀번호 찾기 기능 (FindPwCMD 에서 sendRedirect 했을때 어떻게 .do로 넘기나?
		// 그냥 .do?로 해서 넘기면 되나? 그러면 url에 ?값은 어떻게 받지?)
		else if (cmd.equals("/findPw.do")) {
			MainCommand findPw = new FindPwCMD();
			findPw.excute(request, response);
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
		// 정보수정 클릭
		else if (cmd.equals("/modify.do")) {
			viewPage = "modify.jsp";
		}
		// 유저 비밀번호 변경
		else if (cmd.equals("/mebmerInfoModify.do")) {
			MainCommand uModify = new MemberInfoModifyCMD();
			uModify.excute(request, response);
		}
		// 가게회원 비밀번호 변경
		else if (cmd.equals("/ShopInfoModify.do")) {
			MainCommand sModify = new ShopInfoModifyCMD();
			sModify.excute(request, response);
		}

		// 비밀번호 변경 기능 (ChangePwCMD 에서 sendRedirect 했을때 어떻게 .do로 매핑?)
		else if (cmd.equals("/changePw.do")) {
			MainCommand ChangePw = new ChangePwCMD();
			ChangePw.excute(request, response);
		}
		// 비밀번호 변경 후 뷰 페이지
		else if (cmd.equals("/find_pw_next.do")) {
			viewPage = "find_pw_next.jsp";
		}
		// 가게정보수정
		else if (cmd.equals("/ShopIntroModify.do")) {
			MainCommand ShopIntroModify = new ShopIntroModifyCMD();
			ShopIntroModify.excute(request, response);
		}
		// 가게관리 뷰페이지
		else if (cmd.equals("/shop_management.do")) {
			viewPage = "shop_management.jsp";
		}
		// 맵 뷰페이지
		else if (cmd.equals("/map.do")) {
			viewPage = "map.jsp";
		}
		// 리뷰 체크
		else if (cmd.equals("/ReviewCheck.do")) {
			MainCommand rCheck = new ReviewCheckCMD();
			rCheck.excute(request, response);
		}
		// 메뉴 삭제
		else if (cmd.equals("/MenuDelete.do")) {
			MainCommand mDelete = new MenuDeleteCMD();
			mDelete.excute(request, response);
		}
		// 메뉴 삭제
		else if (cmd.equals("/MenuPlus.do")) {
			MainCommand mPlus = new MenuPlusCMD();
			mPlus.excute(request, response);
		}
		// 가게 정보 뷰 페이지
		else if (cmd.equals("/shop_info.do")) {
			viewPage = "shop_info.jsp";
		}

		else if (cmd.equals("/shop_info.do")) {
			viewPage = "shop_info.jsp";
		}
		if (viewPage != null) {
			// 해당 요청 viewPage에 맞는 jsp View로 forward
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
