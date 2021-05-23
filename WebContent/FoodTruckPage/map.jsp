

<%@page import="com.java.db.dto.MapShopInfoDto"%>
<%@page import="com.java.db.dao.ShopInfoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@page import="com.java.db.dto.ShopInfoDto"%>
<%@page import="com.java.db.dao.ShopGeolocationDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<jsp:include page="style.jsp"></jsp:include>
<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>


<title>Map Page</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>

<body>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include> 

	<!-- Page Content -->
	<div class="container">

	
               
   			<%//정현------- 가게 출력
	
				ArrayList<SManagerInfoDto> smdtos = new ArrayList<SManagerInfoDto>();
				SManagerInfoDao smdao = new SManagerInfoDao();
	
				ArrayList<MapShopInfoDto> sdtos = new ArrayList<MapShopInfoDto>();
				ShopInfoDao sdao = new ShopInfoDao();
  	
			%>
		<!-- 카카오 맵 -->
		<div id="map" style="width: 100%; height: 623px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=34c55d8cdebc3f1d7c40139f7c31e99d"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
		<!-- services 라이브러리 불러오기 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.7462521357531,
						127.024000986311),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.7462521357531,
						127.024000986311), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		
		 	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
		
		
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {
					
					var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도
					
					var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

					map.setCenter(locPosition);
	
				});

			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '위치를 받아올 수 없어요..'

				displayMarker(locPosition, message);
			}  

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		

		
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 


		
		

		
			 
			 

 			
 			<%
 			sdtos = sdao.shopStatSelect("1"); 
		    for(int i = 0; i<sdtos.size(); i++) {%>

		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

		    var positionX = <%=sdtos.get(i).getShopAreaX()%>;
		    var positionY = <%=sdtos.get(i).getShopAreaY()%>;
		    var latlng = new kakao.maps.LatLng(positionX,positionY)
		    
		    var marker = new kakao.maps.Marker({
		        map: map // 마커를 표시할 지도
		        ,position:latlng      			
		        ,image : markerImage // 마커 이미지 
		    });

		    

		    <%smdtos = smdao.infoAll(sdtos.get(i).getShopNum());//현재 영업중인 거게의 정보를 가져온다
		 	for(int q = 0; q<smdtos.size(); q++) {%>
		 		
		 		var iwContent = '<a href ="/FoodTruck/FoodTruckPage/shop_info.jsp?shop_num=<%=sdtos.get(i).getShopNum()%>"><%=smdtos.get(q).getShopName()%></a>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			
			<%}%>	
			//'<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'
		    
		
		    var iwPosition = latlng; //인포윈도우 표시 위치입니다

		    
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
			});
		  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		    <%}%> 
		    
 
 
			
		    /*  		var positions = [
		    {
		        title: '카카오', 
		        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '생태연못', 
		        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '텃밭', 
		        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		    }
		]; 
		 
			
		 	
		 	for (var i = 0; i < positions.length; i ++) {
		 		    
		 		    // 마커 이미지의 이미지 크기 입니다
		 		    var imageSize = new kakao.maps.Size(24, 35); 
		 		    
		 		    // 마커 이미지를 생성합니다    
		 		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		 		    
		 		    // 마커를 생성합니다
		 		    var marker = new kakao.maps.Marker({
		 		        map: map // 마커를 표시할 지도
		 		        ,position: new kakao.maps.LatLng(33.450936, 126.569477) // 마커를 표시할 위치
		 		        ,image : markerImage // 마커 이미지 
		 		    });
		 		}  
			*/

			//오른쪽 +,-, 스카이뷰

			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		</script>



		<!-- Contact Details Column -->

		<!-- /.row -->

		<!-- Contact Form -->

		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->

		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

</body>

</html>