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
		//이용자
		if (result == 1) {
		session.setAttribute("member_id1",id);
		out.print("회원 로그인 완료 아이디: " + id + " 비밀번호: " + pw );
		response.sendRedirect("index.jsp");
		//사업자
		} else if (result == 2) {
			session.setAttribute("member_id2",id);
			out.print("회원 로그인 완료 아이디: " + id + " 비밀번호: " + pw );
			response.sendRedirect("index.jsp");
		
		
		} else if (result == -1) {
		out.print(id + " --- " + pw + " 로그인실패 ");
		}
	%>
</body>
</html>