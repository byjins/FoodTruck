<%@page import ="java.io.File" %>
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
	String saveDir = application.getRealPath("FoodTruckPage/img/");
	File dir = new File(saveDir);
	String fName[] = dir.list();
	for(String s : fName){
		out.print(s + "<br>");
	}
/* 	String uploadDir =this.getClass().getResource("").getPath();

	 uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"FoodTruck/FoodTruckPage/img";

	 out.println("절대경로 : " + uploadDir + "<br/>"); 
	  */
	// out.println("<img src = img/slide2.jpg>");


	

	
%>
<img src="<%="img/3000000-104-2017-00063.jpg"%>"><br>
</body>
</html>