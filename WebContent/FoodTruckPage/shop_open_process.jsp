<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@page import="com.java.db.dao.ShopGeolocationDao"%>
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

             String sId = (String)session.getAttribute("shop_id");//사업자 세션 받아욤
               
             String num = null;
             System.out.println("/세션값 : "+  sId);
	         double areaX = 0.0;
	         double areaY = 0.0;
	         //사장님이 접속했을때만 가게위치정보를 저장시킵니다 -정현
               if(sId != null || session.getAttribute("shop_Id") != null||(areaX != 0 && areaY != 0))
               {
            	  areaX = Double.parseDouble(request.getParameter("areaX"));
        		  areaY = Double.parseDouble(request.getParameter("areaY"));
                    
        	       System.out.println("/x :" +areaX + "/y :" +areaY);
        		   
        		   
        		   SManagerInfoDto smDto = new SManagerInfoDto();
            	   SManagerInfoDao smDao = new SManagerInfoDao();
            	   
            	   smDto = smDao.info(sId);
            	   
            	   num = smDto.getNum().toString();

                   ShopGeolocationDao SgDao = new ShopGeolocationDao();
                   SgDao.updateDao(areaX, areaY, num,1);
                   
               	   response.sendRedirect("map.jsp");
               }
               else {
            	   response.sendRedirect("map.jsp");
               }%>
</body>
</html>