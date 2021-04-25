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

	<%!String id, pw;
	int num;%>
	<%
	MemberLoginDao dao = new MemberLoginDao();

	id = request.getParameter("userID");
	pw = request.getParameter("userPassword");

	int result = dao.login(id, pw);

	//로그인 회원 구분.
	if (result == 1) {
		out.print("사업자 로그인 완료 아이디: " + id + " 비밀번호: " + pw);
	} else if (result == 2) {
		out.print("회원 로그인 완료 아이디: " + id + " 비밀번호: " + pw);
	} else if (result == -1) {
		out.print(id + " --- " + pw + " 로그인실패 ");
	}
	%>
</body>
</html>