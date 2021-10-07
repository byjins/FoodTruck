package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberInfoDao;
import com.java.db.dao.RegularExpressionDao;
import com.java.db.dao.SManagerInfoDao;
import com.java.db.dto.SManagerInfoDto;


public class ChangePwCMD implements MainCommand {

		@Override
		public void excute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pw1 = request.getParameter("password1");
			String pw2 = request.getParameter("password2");
			

			if (pw1.equals(pw2) && true == RegularExpressionDao.regularPW(pw1)){
				int mresult = new MemberInfoDao().update(id, pw1);
				int sresult = new SManagerInfoDao().update(id, pw1);
				if (1 == sresult && 1!=mresult) {
					response.sendRedirect("find_pw_next.jsp?id="+id);
				} else if(1==mresult && 1!=sresult){
					response.sendRedirect("find_pw_next.jsp?id="+id);
				}
			} else {
				request.getSession().setAttribute("messageType", "실패메시지");
				request.getSession().setAttribute("messageContent", "일치하는 정보가 없습니다.");
				response.sendRedirect("find_pw_next.jsp");
			}
			
		}
	

}
