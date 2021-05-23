<%@page import="com.java.db.dao.ShopInfoDao"%>
<%@page import="com.java.db.dto.MapShopInfoDto"%>
<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

<!--  정현 테스트 중 지우지말것 -->
<%

ArrayList<SManagerInfoDto> smdtos = new ArrayList<SManagerInfoDto>();
SManagerInfoDao smdao = new SManagerInfoDao();

ArrayList<MapShopInfoDto> sdtos = new ArrayList<MapShopInfoDto>();
ShopInfoDao sdao = new ShopInfoDao();



sdtos = sdao.shopStatSelect("1");  //1 (영업중)인 가게들의 가게번호를 가져온다.
for(int i = 0; i<sdtos.size(); i++) {
		System.out.println("x : " + sdtos.get(i).getShopAreaX());
		System.out.println("y : " + sdtos.get(i).getShopAreaY());
	     System.out.println("++++++++++++++++++++++++");
	 	smdtos = smdao.infoAll(sdtos.get(i).getShopNum());//현재 영업중인 거게의 정보를 가져온다
	 	for(int q = 0; q<smdtos.size(); q++) {
			 System.out.println("아이디 : " + smdtos.get(q).getId());
			 System.out.println("비밀번호 : " + smdtos.get(q).getPw());
			 System.out.println("가게이름 : " + smdtos.get(q).getShopName());
			 System.out.println("======================================");
			 
		}	
	 
}	 
%>
<script type="text/javascript">




<%for(int i = 0; i<sdtos.size(); i++) {%>
var aaa =  <%= sdtos.get(i).getShopAreaX()%>;
document.write("//");
document.write(aaa);
<%}%>


</script>
</body>

</html>