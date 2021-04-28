<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>

<jsp:include page="style.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 로그인 -->

	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">

		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
		<form method="post" action="signup_shop_process.jsp">
						<h3 style="text-align: center;">사 업 자 회 원 가 입</h3>
						<div class="form-row"><!-- 등록번호 조회 -->
							<input type="text" class="form-control" id="shopNum" name="shopNum" placeholder="가게등록번호" maxlength="23">
						</div>
						<br>
						<div class="form-row"><!-- 가게구분 -->
							<input type="text" class="form-control" id="shopClass" name="shopClass" placeholder="가게구분" maxlength="20">
						</div>
						<br>
						<div class="form-row"><!-- 관리자 아이디 -->
							<input type="text" class="form-control" id="shopID" name="shopID" placeholder="아이디" maxlength="20">
						</div>
						<br>
						<div class="form-row"><!-- 비밀번호 -->
							<input type="password" class="form-control" id="shopPassword" name="shopPassword" placeholder="비밀번호" placeholder="비밀번호" maxlength="20">
						</div>
						<br>	
						<div class="form-row"> <!-- 등록가게주소 -->
							<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="등록가게주소" maxlength="20">
						</div>
						<br>
						<div class="form-row"> <!-- 전화번호 -->
							<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호 (-를 빼고입력)" maxlength="20">
						</div>
						<br>
						<div><!-- 관리자 이름 -->
							<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="이름" maxlength="20">
						</div>
						<br>
						
						<br> <input type="submit" class="btn btn-info form-control" value="가입하기">
					</form>
		</div>
	</div>



	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>