<%@page import="com.java.db.dao.ShopInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.java.db.dao.SManagerInfoDao" %>	
<%@page import = "com.java.db.dto.SManagerInfoDto" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>



  <script>
    function openPosition(){
   if (navigator.geolocation) {
            

            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
               
               var areaX = position.coords.latitude; // 위도
               var areaY = position.coords.longitude; // 경도

       
               location.href=('shopopen.do?areaX=' + areaX + "&areaY="+ areaY);
       
               
            });

         } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            var error = "실패했습니다"; 
         }
    }

   </script>

<%
	String mId = (String)session.getAttribute("member_id");   //사업자
	String sId = (String)session.getAttribute("shop_id");   //이용자		 
%>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="main.do">거리에서</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
 
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
        <ul class="navbar-nav xs-auto">
	
          <%if (mId == null && sId == null) { %>
          <li class="nav-item" style="margin: 3px 0px 3px 0px" >
            <a class="nav-link" href="loginmain.do">로그인</a>
          </li>
          <li class="nav-item" style="margin: 3px 0px 3px 0px" >
            <a class="nav-link" href="signupmain.do">회원가입</a>
          </li>
         <li class="nav-item" style="margin: 3px 0px 3px 0px" >
			<form action="map.do">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
          
          <!-- 사장님 로그인 -->
          <%
          	}else if(sId != null){ 
         		SManagerInfoDto sdto = new SManagerInfoDto();
          		SManagerInfoDao sdao = new SManagerInfoDao();
         		sdto = sdao.info(sId);
          %>
          <li class="nav-item" style="margin: 3px 0px 3px 0px" >
            <a class="nav-link" href="myinfo.do"><%=sId %>님</a>
          </li>
          
          <li class="nav-item" style="margin: 3px 0px 3px 0px" >
            <a class="nav-link" href="logout.do">로그아웃</a>
          </li>
          
          <li class="nav-item" style="margin: 3px 0px 3px 0px">
            <a class="nav-link" href="shop_management.do?shop_num=<%=sdto.getNum()%>">가게관리</a>
          </li>
    	
		  <li class="nav-item" style="margin: 3px 0px 3px 0px" >
			<form action="map.do">
				<button type="submit" class="btn btn-light">지도</button>&nbsp
			</form>
          </li>
          
      	  <li style="margin: 3px 0px 3px 0px">
			<input type="button" class="btn btn-info" onclick="openPosition()" value = "영업시작" >&nbsp		
          </li>
            
 		  <li style="margin: 3px 0px 3px 0px">
			<form action="shopclose.do">
				<button type="submit" class="btn btn-info">영업종료</button>
			</form>
          </li>
          <!-- 이용자 로그인 -->
          <%}else if(mId != null){ %> 
          <li class="nav-item" style="margin: 3px 0px 3px 0px">
            <a class="nav-link" href="myinfo.do"><%=mId %>님</a>
          </li>
          <li class="nav-item" style="margin: 3px 0px 3px 0px">
            <a class="nav-link" href="logout.do">로그아웃</a>
          </li>
		  <li class="nav-item" style="margin: 3px 0px 3px 0px">
			<form action="map.do">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
       
          <%} %>
      
        </ul>
     	<ul class="navbar-nav ml-auto xs-auto">
        	<li class="nav-item" style="margin: 3px 0px 3px 0px">
     				<form class="form-inline " method = "get" action ="map.do">
     					 <div class="input-group">
     	 				 <input class="form-control col-xs-8 col-sm-8 col-md-8 col-lg-8 " type="text" placeholder="검색" name = "search">
     	 				 <span class="input-group-append">
      	 				   <input type="submit" class="btn btn-secondary"  value = "검색"/>
      	 				 </span>
      	 				 </div>
     				</form>
     		</li>
     	</ul>
      </div>
    </div>
  </nav>
</head>

</html>