<%@page import="java.util.List"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@page import="com.java.db.dao.ShopInfoDao"%>
<%@page import="com.java.db.dto.ShopInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<jsp:include page="style.jsp"></jsp:include>
</head>
<script>
$(document).ready(function() {
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				userX = position.coords.latitude; // 위도
				userY = position.coords.longitude; // 경도
				//ajax 호출
				$.ajax({
				type : 'GET',
				url : 'UserPositionCheck.do',
				data : {"userX": userX, "userY": userY},
				dataType: 'json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				success : function(result){
					$('#dataReview').empty();
					$('#dataScore').empty();
					$('#dataReview').append(result.review);
					$('#dataScore').append(result.score);
					$('#dataReview').on('load');
					$('#dataScore').on('load');
				},
				error: function(result){
				}
			})
				
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			alert("실패했습니다");

		}
});
</script>
<body>
<%
Double userX = 37.56674327625219;;
Double userY = 126.97957478404084;

System.out.println(userX+"_"+userY);
%>

  <!-- Navigation -->
	<jsp:include page = "nav.jsp"/>
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url(img/slide1.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(img/slide2.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
<!-- 		     <div class="carousel-item" style="background-image: url(img/slide3.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>-->
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="tr
        ue"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4"></h1>


    <!-- Portfolio Section -->
    <table class="table">
    <thead class="thead-dark">
      <tr>
        <th><h4>근처 리뷰순 가게정보</h4></th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
    <div class="row" id="dataReview">
    <% ArrayList<ShopInfoDto> dtos1 = new ArrayList<ShopInfoDto>();
	ShopInfoDao dao = new ShopInfoDao();
    ShopInfoDto dto1 = new ShopInfoDto();
    dtos1 = dao.shopReviewSelect(userX,userY);

    if(null!=dtos1){
    for(int i=0;i<6;i++) {
		dto1 = dtos1.get(i);
		%>
    <div class="col-lg-4 col-sm-6 portfolio-item" id="item">
      <div class="card h-100">
      <%if(null==dto1.getShopNum()){%>
	 	<a href="#">
      		<img class="card-img-top" src="http://placehold.it/400x230" alt="">
      	</a>
      <%}else{%>
      <a href="shop_info.do?shop_num=<%=dto1.getShopNum()%>">
      	<img class="card-img-top" src=<%=dto1.getShopimg()%> width="400px" height="200px" alt="">
      </a>
      <%} %>
        <div class="card-body">
          <h4 class="card-title">
		            <a href="shop_info.do?shop_num=<%=dto1.getShopNum()%>"><%=dto1.getShopName()%></a>
		          </h4>
			          <p class="card-text"><%=dto1.getShopIntro() %></p>
		        </div>
      </div>
    </div>
    <%
		}
    }else{
    	 for(int i=0;i<6;i++) {
		%>
    <div class="col-lg-4 col-sm-6 portfolio-item" id="item">
      <div class="card h-100">
            <%if(null==dto1.getShopNum()){%>
	 	<a href="#">
      		<img class="card-img-top" src="http://placehold.it/400x230" alt="">
      	</a>
      <%}else{%>
      <a href="shop_info.do?shop_num=<%=dto1.getShopNum()%>">
      	<img class="card-img-top" src=<%=dto1.getShopimg()%> width="400px" height="200px" alt="">
      </a>
      <%} %>
        <div class="card-body">
          <h4 class="card-title">
		            <a href="shop_info.do?shop_num=<%=dto1.getShopNum()%>"><%=dto1.getShopName()%></a>
		          </h4>
			          <p class="card-text"><%=dto1.getShopIntro() %></p>
		        </div>
      </div>
    </div>
    <% }
    }
    %>
	</div>

	<table class="table">
    <thead class="thead-dark">
      <tr>
        <th><h4>근처 평점순 가게정보</h4></th>
      </tr>
    </thead>
  </table>
    <div class="row" id="dataScore">
    <% ArrayList<ShopInfoDto> dtos2 = new ArrayList<ShopInfoDto>();
    ShopInfoDto dto2 = new ShopInfoDto();
    dtos2 = dao.shopScoreSelect(userX,userY);

    if(null!=dtos2){
    for(int i=0;i<6;i++) {
		dto2 = dtos2.get(i);
		%>
    <div class="col-lg-4 col-sm-6 portfolio-item">
      <div class="card h-100">
            <%if(null==dto2.getShopNum()){%>
	 	<a href="#">
      		<img class="card-img-top" src="http://placehold.it/400x230" alt="">
      	</a>
      <%}else{%>
      <a href="shop_info.do?shop_num=<%=dto2.getShopNum()%>">
      	<img class="card-img-top" src=<%=dto2.getShopimg()%> width="400px" height="200px" alt="">
      </a>
      <%} %>
        <div class="card-body">
          <h4 class="card-title">
		            <a href="shop_info.do?shop_num=<%=dto2.getShopNum()%>"><%=dto2.getShopName()%></a> <!-- 가게이름 -->
		          </h4>
			          <p class="card-text"><%=dto2.getShopIntro() %></p>
		        </div>
      </div>
    </div>
	<%
		}
    }else{
    for(int i=0;i<6;i++) {%>
	    <div class="col-lg-4 col-sm-6 portfolio-item" id="item">
      <div class="card h-100">
           <%if(null==dto2.getShopNum()){%>
	 	<a href="#">
      		<img class="card-img-top" src="http://placehold.it/400x230" alt="">
      	</a>
      <%}else{%>
      <a href="shop_info.do?shop_num=<%=dto2.getShopNum()%>">
      	<img class="card-img-top" src=<%=dto2.getShopimg()%> width="400px" height="200px" alt="">
      </a>
      <%} %>
        <div class="card-body">
          <h4 class="card-title">
		            <a href="shop_info.do?shop_num=<%=dto2.getShopNum()%>"><%=dto2.getShopName()%></a>
		          </h4>
			          <p class="card-text"><%=dto2.getShopIntro() %></p>
		        </div>
      </div>
    </div>
	
	<%}
    }%>
	</div>
    <!-- /.row -->


	<!-- <h2>공지사항</h2>
	사진없는곳 (버튼눌러서 공지사항확인 ???)
    Marketing Icons Section
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">가게이름</h4>
          <div class="card-body">
            <p class="card-text">공지사항내용</p>
          </div>
          <div class="card-footer" align="right">
            <a href="#" class="btn btn-primary">가게정보</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">가게이름2</h4>
          <div class="card-body">
            <p class="card-text">공지사항내용</p>
          </div>
          <div class="card-footer" align="right">
            <a href="#" class="btn btn-primary">가게정보</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">가게이름3</h4>
          <div class="card-body">
            <p class="card-text">공지사항내용</p>
          </div>
          <div class="card-footer" align="right">
            <a href="#" class="btn btn-primary">가게정보</a>
          </div>
        </div>
      </div>
    </div> -->
    <!-- /.row -->

    <!-- Features Section -->
    
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <!-- <div class="row mb-4">
      <div class="col-md-8">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
      </div>
    </div> -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

  

</body>

</html>
