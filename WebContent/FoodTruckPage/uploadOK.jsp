<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String path = application.getRealPath("FoodTruckPage/img");
	out.print("path : " + path+"<br/>");
	
	int size = 1024 * 1024 * 10 ;
	String file = ""; //서버에 저장되는 파일이름
	String oriFile = ""; //오리진이름?이 어떻게 되는가
			
	MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8", new DefaultFileRenamePolicy());
	
	file = multi.getFilesystemName("test");
	oriFile = multi.getOriginalFileName("test");
	
	//String uploadDir =this.getClass().getResource("").getPath();
	 
	out.print("저장될 파일 이름 : " + file+"<br/>");
	out.print("실제 파일 이름 : " + file+"<br/>");
	
	String realFile = "3000000-104-2018-00175.jpg";
	File oldFile = new File(path +"/"+ file);
	File NewFile = new File(path +"/"+ realFile);
	oldFile.renameTo(NewFile);
	
	out.print(oldFile);
	

	//response.sendRedirect("fileForm.jsp");
%>
</body>
</html>