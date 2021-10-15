
<%@page import="com.java.db.dao.RoadShopDao"%>
<%@page import="com.java.db.dto.RoadShopDto"%>
<%@page import="com.java.db.dao.SearchDao"%>
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


		<!-- 카카오 맵 -->
		<div id="map" style="width: 100%; height: 623px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f6dae195d37664dbda9da37868924d4&libraries=services,clusterer,drawing"></script>

		<script>
		  
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.7462521357531,
						127.024000986311), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		    
		 	
		 	// 마커 클러스터러를 생성합니다 
		    var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 6 // 클러스터 할 최소 지도 레벨 
		    });

			//검색했을때 검색한 가게로 이동  -정현---------------------------------------------------------------------
			<% 
			String search = request.getParameter("search");
			SearchDao schDao = new SearchDao();
			MapShopInfoDto mapDto = new MapShopInfoDto();
			
			mapDto = schDao.SearchTruck(search);
			System.out.println(search);
		
			%>
			 	if (navigator.geolocation) {

					
						
						navigator.geolocation.getCurrentPosition(function(position) {
							<%if(mapDto != null){	//검색 성공하면 검색한 가게로 이동 -정현
								System.out.println(mapDto.getShopAreaX());
								System.out.println(mapDto.getShopAreaY());%>
								var schPositionX = <%=mapDto.getShopAreaX()%>;
								var schPositionY = <%=mapDto.getShopAreaY()%>;
								var searchPosition = new kakao.maps.LatLng(schPositionX,schPositionY);
								map.setCenter(searchPosition);
							<%}else{%> //검색 실패시 내위치
							var lat = position.coords.latitude, // 위도
							lon = position.coords.longitude; // 경도
							
							var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

							map.setCenter(locPosition);
							<%}%>
						});
				
				
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '위치를 받아올 수 없어요..'

				displayMarker(locPosition, message);
			}  
			    


		
		// 트럭마커 이미지의 이미지 주소입니다---------------
			
 			<%//정현------- 가게 출력------------------------------------------------------------------------------

			ArrayList<SManagerInfoDto> smdtos = new ArrayList<SManagerInfoDto>();
			SManagerInfoDao smdao = new SManagerInfoDao();

			ArrayList<MapShopInfoDto> sdtos = new ArrayList<MapShopInfoDto>();
			ShopInfoDao sdao = new ShopInfoDao();
	
 			//영업중인 상태의 가게만 마커를 찍어줍니다.
 			sdtos = sdao.shopStatSelect("1"); 
		    for(int i = 0; i<sdtos.size(); i++) {%>
		    var markers = [];
			var TimageSrc = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAJUklEQVR4Xu2beVBURx7HP6MDjCyXymGQQ1GJbnkEJKUSjRHcGDUStbISUwm73mui8YhuNOp6oJKoqynXmF2vJJhaj90QC6OublS01NLSgNfGBBVECSIQOUTOgdnqN7yRGRl8MwwMavofePO6+31/n/718evXT8VTnlTNxH5X4A1gKBAKeAHOJtpKgFwgGTgA7ACKG6rf3gAcgPnAbMDdQmMKgbVAHFBpYVlDdnsC8AP2As8JNd0CfYiODCU02A9vD1ecHNVGNpVXaMkpuEdyaiY7v0vmx5t35PvngRFApjUQ7AUgADgGdPDz8mB29CAGhXZRrF+ng6SUq6zddZTM3AJR7gYwELipuJKajPYA4AicAJ4P8m3LP+ZG4+nuIskJGb9K+puy7c+KrvMKi5myehdpWb+I/GeB/kCFJRDsAWAhEOvv3Zr4hW/h4dLKoNdSAKJgQXEpMcu/4lZOvrgUda9ozgA8atzVfc27I4nsHWyJVrN5D3+fypxP94j7YmDsILgorbipPWA8sLVHJ1/iF7ylVKOifDHLt3Mp7bbIK57xuaJCQFMCaAEcqRmslOqzJp8YXCOAaiWFmxLAMmCRElE2yCOetVhJPU0JIF30z+9G9+clP7HQs31KysxlcIKYYKRpsaOSJ/wKQAklG+V56ruAGAQPAy/ZCKi5apJqBkGdkuc0ZRcQeqKBncG+7qz5Qx8l+hTnmfPlGVKzxDJAesZupQWbGoAGEFGMWyMthIoAH6CsuQAw64Z1LYWViq6dL/9eCTErviIzp97Fn9mGbmwPqLcfmgZDlgIQwdDkVbtIvy0FQ/Ul+wLQLXvPIE5XWU5m1i1+l3Ccn/KLEeHwrOhBRFgYDh8V4fDOI/ycV0jX1q4cGj0AP19/VA5Ohmep/rJe/r/5ABCKdGXFZOfeISrxFOfuSFEcXQN8eGNwKCFd/PBu7YLGUWwWPUhlFZXk5BeTctV4QyTMpzWJUeG08/JBpdGH1QarmysACUJlOZVFuWxIucqS01e4V6F9lBsb3Xd1VLOkbzemhQTj4OZp1PJ1ADCt2+ARTTIG1O4CRkqqq6kuKaS4uJDE61kkXMsitaCYW/dKKDIB4uaoxt/VmWAPF0Z39iWqky8uLu60cHaHFmKJ8XCq1QWaKQBZVrUOXXkxusoydNpK0FWB6fApmkrVEpXaAZWDBpWTC7Sov/1kAGKHycPTi45Rcx8aE+zrARY5veWZmw0Ay6XbtoTdPcC25lhem90BLOoVxLSu/kbKN/x4i9gLadJvCxct5p1pD9YK4reNG9azPHapdL+h5e0OQK1SMb9nR8Z2bCcZtCM9m7iL6WjFBj+gVquZN38B0WPflK537fgnH8WtQKvVT40NLW8rAGLA/D0wDegBiB1eq1PLli0ZGzMJHTp2xm+hqqrKqK6G3q9dmS0AiIl2EzDBGotnz1/KoX17yLiRhrayksCOnRgW9TrduguOcOXyJfYn/puM9OvSdUPuqx0cCOwQxMvDR7I2Tr8taAsAwvAtzhpH3dIpo1RD+nXH1VlEtuZTQV6u4U1P/O79lFdWPHBptRonB0c0Gv26vaysvFHux4wZZhMAwvWvAUEbP3iboS/0VOQEtQHsThQbQU2fxkRF2gRAP+BUe+/WnNjyoVThpoQk/p6QRH7R/TqtSk9cTUMAyMJNK7cUpK0ArANmTho5kA/Hv8qla5m89v56dDUjeF0EniQAwv3FK2e/b9ZM57ngAFZs28uWPceZ8qd3WLw01sh+X5+20rWtAGivzJTqU3f7RPprDw8IB076enlwcusCqdX7T1xJVm4Be/cfpHfvsCcegEA/Y8JrL7JwwgjOp95k1Jy/4evbnrPJF1CpjGOpR3mAub4tU5RbWM5nLw8QVomBbwwwTuzgfr1qGqFdA1m57Vs27znG5ClTWbJs+UPd/3EHIBY7wmAx1AfJ1nXx9+Hghvel1h4wcSWZ+oMI9SZzY4Bpy8qVmPZxe3iAaPXN8kpPTHlDw3swNLwnIc8GGFy91obCEwdAuPsusdJbMyNaZW6xIwOQz/CYUpCPuJh6wKM8prHvK1kKHwcGrJ4RzeuRxiN7bXFPEADvmkOXhhMiomN7XNwZW+8a31oAifNfbuxGrrP+qLhDRkvhIdP/SmpGtvjtf8CLwF15HpMCc+G69aXHHcDdwvuMXfAZqfpDll8Cf2xSAHKLmINsa08x9QCpkX/OJWKqdB5ReH2bpw6AsLz29rhVAMS53pojqtK7vbCuAYwZFMKIeWLP5OFYwNYte6eglP3Jt7h08y7Z+aVUVevwctMQGtSWwb3aE+Cpf0VWlwdYBUBbVc3q7QekMNhcEqtiOUA0nQZtBaBapyM+6SrfnMkwG422UKkY3tuf8ZHPMurj/xoNgrJ2izxAGD9u6VZOnE+VyncI6ixtWbm560+3FxUWSltZN9LEnok+/fR1HCWF+YYdIVsAEK0c+68UktPyFOkQ3pCcpn9tLq8DrAIQ98U+qeWdNBrC+oTj7fNMnU6Qc+c2586corysjPFRA5g+sp9NAXxxNJWE0zcs0iELVQygvinwhYERkvGlJSVcvphMXk6OlN3T25vuvUJp1coZAeHkMXEYtPGSjXUY4tl6T3IItw8J60NpaQlHDu6noqLcyEJHRycihgyTIKScO2PUHWyJohF0GAMw7auzPj/N9ewiBkYOoU1bT86ePkHmzQx+270XMRPflWyL3/IpP1y+gF9AIM/37c/dX/I4dvggndq5sW5cX8JfEWFGw1LEpFgupmZYpaNncCBHNhuf0PUcOFEWVD+AseuOcL9My4jRY1CrHTiQmEBZWSkffbIJN3f9e5GiwgLmzZyMRtOKoVGj0Wor2Zuwm99o1OyYFWETAJ2Gv0dhcYlVOtxdnLm+z3BURt9tfwXwsAdkAc+seDOMHoFtDP76JHaB739IY8jUlcJG8XGBr7wS/BjQf6hTR2qEwceqQcHGOkRA8IEMQHzIJPa43xaeUJc6w/RTWsLlC2amwezbnDzeRNOg9TpEy2+v+XahQskRGUFqriULIUCia1Uzmy/UKDqUAGgJfAu8IrQpWAr/B3gVMH7f3XAajaJDCQAhXTxcjBxzgLrPpOm/0VlTs6tsa+NlfDbXoRSALEB8hjK15sx/55ofRRQkwsTPRCTc8IZWVIM5HeKDqY2W6LAUgCJ1j1Om/wOpQpGMlDTuuAAAAABJRU5ErkJggg=="; 
			   // 트럭마커 이미지의 이미지 크기 입니다
		    var TimageSize = new kakao.maps.Size(50, 50); 
		    // 트럭마커 이미지를 생성합니다    
		    var TmarkerImage = new kakao.maps.MarkerImage(TimageSrc, TimageSize); 
		 
			
		    //마커의 x축 y축 을 가게정보 db에서 받아서 찍어줍니다.
		    var positionX = <%=sdtos.get(i).getShopAreaX()%>;
		    var positionY = <%=sdtos.get(i).getShopAreaY()%>;
		    var latlng = new kakao.maps.LatLng(positionX,positionY)
		    
		    var marker = new kakao.maps.Marker({
		        map: map // 마커를 표시할 지도
		        ,position:latlng      			
		        ,image : TmarkerImage // 마커 이미지 
		        
		    });
		    marker.setClickable(true);
		    

		    <%smdtos = smdao.infoAll(sdtos.get(i).getShopNum());//현재 영업중인 가게의 정보를 가져온다
		 	for(int q = 0; q<smdtos.size(); q++) {%>
		 		
		 		var iwContent = '<a href ="/FoodTruck/shop_info.do?shop_num=<%=sdtos.get(i).getShopNum()%>"><%=smdtos.get(q).getShopName()%></a>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				var iwRemoveable = true;
			<%}%>			    
		
		    var iwPosition = latlng; //인포윈도우 표시 위치입니다

		    
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent,
		    removable : iwRemoveable
			});
		    
			// 마커에 클릭이벤트를 등록합니다
		  kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, infowindow));
			

			function clickListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}
			
		    markers.push(marker);
			// 클러스터러에 마커들을 추가합니다
		    clusterer.addMarkers(markers);

		    <%}%> 


		  //주소-좌표 변환 객체를 생성합니다--------------------------------------정현-------------------------
		  //거리가게,구두수선대를 분류하여 마커를 생성합니다

		    var geocoder = new kakao.maps.services.Geocoder();

		    <%
		    	ArrayList<RoadShopDto> roadDto = new ArrayList<RoadShopDto>();
		    	RoadShopDao roadDao = new RoadShopDao();
		    	
		    	roadDto = roadDao.RoadShopSelect();
		    	
		    	for(int i = 0; i<roadDto.size(); i++) {
                
		    %>

		    var posx ='<%=roadDto.get(i).getPosx()%>';
		    var posy = '<%=roadDto.get(i).getPosy()%>';
		    var markers = [];
		    


			    <%
				String shoe = "구두수선대";
			    if((roadDto.get(i).getRoad_type()).equals(shoe)){%>
			    	var ShoesimageSrc = "data:image/png;base64,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";
			    	var ShoesimageSize = new kakao.maps.Size(27, 27);     
			    	var markerImage = new kakao.maps.MarkerImage(ShoesimageSrc, ShoesimageSize);
			    <%}else{%>
			    	var MarketimageSrc = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADFElEQVR4Xu2bTWsTQRjH/2k8FsGU2heMgjVQ0OMq1YPRHhTFq+I3iOBFRPAzKIInofXuRe+KLYrrQavusQu17aUK6W4gPUgPSSpdmXV3m46zLyNJus/u5FK6fXaY5zf/52Vm0gJy/ink3H8oABEKYHCWAJwjrpKvAGYAOCI/ohRwHsAn4s77078A4LMsgKcA7o2MVXStWqtSBGHo83rTXmNzZ77clwHAlPEDwLGzl2pm6WjlNEUATXtt2dDnzwD4CeCEKAzCQsCVf6EwVL9y8/EkRef/ztlxFl493HScXeaDMAzCAJCXv79ohj6nN+310DAQAQjkr1VryyNjFSYhsp+mvWoa+nMWwsIwEAHokv+jCaBAvFeIDgORc5mRf5Iw4AFkSv4+gKhqwAPImPx9BG4YWI6zO8FXAx6AJ/9Tula9Q7L5CcvW3z7MfdxqrF/kmyIeAGt+ymRTfrKJs2pw3DflAbwGcC3ZOGSt3gC4HgaA98rdQa2s/HafT08fcn9S+x0I3/bH1XgFgOKK8wpVClAhoHJAaK5LlATJFry9if83gPcALhMH8MU7FBW6EaeAyL4gbWD8PiUq6/NzVgAkV3FfYyT5bt/NlQK8Vl2FQETjk9oc0G63WppWauzsdIKtapKYKZenlhYXv7Orr2CzNnAFaFrJ3N7+JXV5Mjx82DSMreCden3Dmp2dGk/idLdNsVi0TLPtvndgOaCXAIpDsDrvEAtiw4Z18jbGUwFAdtVE9r4CFACKCsh9CHQlH6lo8A8u2EukQyAA8Iz7EsZdr9MOea4AeIetSRTQ6qB15AYa5VHUV19gJlVVYBAKCBz2kqQCkKY+YBBJkIYCpGrA3gVLkhxAA0Afq4CXBO3yKDZzmQR5ceUuCSoAHIF0KqCPSTDVCsj9Zkhy4YXmpDdDvQQgO1ZmToRIH4rKrlq/7A/sULRfDsmO2wsAWbgNjuO277aYvxwV/l9N3IgE/x74LQRw9dYTgj7FT/ntywe+kQLwDwnvgRsCuVdAvJjIW4SGQO6rAPmllXVA9jtCsuOn3j73AP4A2umLbkY4vmgAAAAASUVORK5CYII=";
			    	var MarketimageSize = new kakao.maps.Size(25, 25);     
			    	var markerImage = new kakao.maps.MarkerImage(MarketimageSrc, MarketimageSize);
			    <%}%>
		         var coords = new kakao.maps.LatLng(posx,posy);
		
		         // 결과값으로 받은 위치를 마커로 표시합니다
		         var marker = new kakao.maps.Marker({
		             map: map,
		             position: coords,
		             image:markerImage
		           
		         });

			    markers.push(marker);
				// 클러스터러에 마커들을 추가합니다
			    clusterer.addMarkers(markers);

		    <%}%>
	
		
		    
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		</script>



	</div>

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