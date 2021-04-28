<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.java.db.dao.MemberLoginDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		String id, pw;
		int num;
	%>

	<%
		MemberLoginDao dao = new MemberLoginDao();

	
	
		id = request.getParameter("member_id");
		pw = request.getParameter("member_pw");

		int result = dao.login(id, pw);
	
		//로그인 회원 구분.
		if (result == 1) {
		session.setAttribute("member_id",id);//아이디 세션
		session.setMaxInactiveInterval(30*60);//세션유효시간 30분
		out.print("회원 로그인 완료 아이디: " + id + " 비밀번호: " + pw );
		response.sendRedirect("index.jsp");

		} else if (result == 2) {
			session.setAttribute("member_id",id);//아이디 세션
			session.setMaxInactiveInterval(30*60);//세션유효시간 30분
			out.print("회원 로그인 완료 아이디: " + id + " 비밀번호: " + pw );

			response.sendRedirect("index.jsp");
		
		
		} else if (result == -1) {
		out.print(id + " --- " + pw + " 로그인실패 ");
		}
	%>
</body>
</html>