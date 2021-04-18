<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userID");
		String password = request.getParameter("userPassword");
		
		if(userid.equals("root")&& password.equals("1111")){
			response.sendRedirect("index.jsp");
		}
		else{
			response.sendRedirect("404.jsp");
		}
	
	%>
</body>
</html>