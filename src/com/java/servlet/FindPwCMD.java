package com.java.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.db.dao.MemberInfoDao;
import com.java.db.dao.SManagerInfoDao;
import com.java.db.dto.MemberDto;
import com.java.db.dto.SManagerInfoDto;

public class FindPwCMD implements MainCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		MemberDto mdto = new MemberDto();
		MemberInfoDao mdao = new MemberInfoDao();
		SManagerInfoDto sdto = new SManagerInfoDto();
		SManagerInfoDao sdao = new SManagerInfoDao();	
		
		int sresult = sdao.accountCheck(id, name, phone);
		int mresult = mdao.accountCheck(id, name, phone);
		
		if(1==sresult&&0==mresult) {
			response.sendRedirect("pwCheckView.do?id=" + id);
		}else if(1==mresult&&0==sresult){
			response.sendRedirect("pwCheckView.do?id=" + id);
		}
		
	}

}
