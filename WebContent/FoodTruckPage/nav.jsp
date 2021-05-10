<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

<style type="text/css">
#searchbtn {
	margin: 0px 130px 0px 0px;
}
</style>
</head>
<body>
<%
String mId = (String)session.getAttribute("member_id");   //사업자
String sId = (String)session.getAttribute("shop_id");   //이용자		 
%>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">거리에서</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
 
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
        <ul class="navbar-nav xs-auto">
	
          <%if (mId == null && sId == null) { %>
          <li class="nav-item">
            <a class="nav-link" href="login_main.jsp">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="signup_main.jsp">회원가입</a>
          </li>
          
          <!-- 사장님 로그인 -->
          <%}else if(sId != null){ %>
          <li class="nav-item">
            <a class="nav-link" href="myinfo.jsp"><%=sId %>님</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">가게관리</a>
          </li>
          <li class="nav-item">
              <li class="nav-item">
            <a class="nav-link" href="shop_info.jsp">가게정보</a>
          </li>
    	
		  <li class="nav-item">
			<form action="map.jsp">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
      	 <li>
			<form action="shop_start.jsp">
				<button type="submit" class="btn btn-info">영업시작</button>
			</form>
          </li>
            
 		 <li>
			<form action="map.jsp">
				<button type="submit" class="btn btn-info">영업종료</button>
			</form>
          </li>
          <!-- 이용자 로그인 -->
          <%}else if(mId != null){ %> 
          <li class="nav-item">
            <a class="nav-link" href="myinfo.jsp"><%=mId %>님</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout_process.jsp">로그아웃</a>
          </li>
    	<li class="nav-item">
            <a class="nav-link" href="shop_info.jsp">가게정보</a>
          </li>
    	
		  <li class="nav-item">
			<form action="map.jsp">
				<button type="submit" class="btn btn-light">지도</button>
			</form>
          </li>
       
          <%} %>
      
        </ul>
     	<ul class="navbar-nav ml-auto xs-auto">
        	<li class="nav-item">
     				<form class="form-inline ">
     					 <div class="input-group">
     	 				 <input class="form-control col-xs-8 col-sm-8 col-md-8 col-lg-8 " type="text" placeholder="검색">
     	 				 <span class="input-group-append">
      	 				   <button class="btn btn-secondary " type="submit" action ="">검색</button>
      	 				 </span>
      	 				 </div>
     				</form>
     		</li>
     	</ul>
      </div>
    </div>
  </nav>
</body>
</html>
