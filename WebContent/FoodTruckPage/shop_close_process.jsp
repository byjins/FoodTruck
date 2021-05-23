<%@page import="com.java.db.dao.ShopGeolocationDao"%>
<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sId = (String) session.getAttribute("shop_id");//사업자 세션 받아욤

	String num = null;
	System.out.println("/세션값 : " + sId);
	double areaX = 0.0;
	double areaY = 0.0;

	SManagerInfoDto smDto = new SManagerInfoDto();
	SManagerInfoDao smDao = new SManagerInfoDao();

	smDto = smDao.info(sId);

	num = smDto.getNum().toString();

	ShopGeolocationDao SgDao = new ShopGeolocationDao();
	SgDao.updateDao(0.0, 0.0, num, 0);
	
	response.sendRedirect("index.jsp");
	%>
</body>
</html>