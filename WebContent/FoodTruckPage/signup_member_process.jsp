<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.java.db.dto.MemberSignupDto"%>
<%@ page import="com.java.db.dao.MemberSignupDao"%>
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
	String username = request.getParameter("userName");
	String memberage = request.getParameter("userAge");
	String mPhone = request.getParameter("userPhone");


	
	MemberSignupDto msignupdto = new MemberSignupDto(userid,password,username,memberage,mPhone);
	MemberSignupDao msignupdao = new MemberSignupDao(); 
	
	/* msignupdto.setMemberID(userid);
	msignupdto.setMemberPW(password);
	msignupdto.setMemberName(username);
	msignupdto.setAge(memberage);
	msignupdto.setPhone(mPhone); */
	
	
	msignupdao.mInsert(msignupdto);
	
	response.sendRedirect("index.jsp");
	%>
	<script>
	var regPid = /^[A-Za-z0-9+]{6,15}$/;
	var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	function checkConfirm(){
		var form = document.form1;
		var id = form.userID.value;
		
		alert(id);
		
	}


	</script>
</body>
</html>