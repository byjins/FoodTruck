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
		<div class="content">
			<form method="post" action="../LoginMember">
				<h3 style="text-align: center;">로 그 인 화 면</h3>
				<br>
				<div>
					<input type="text" class="form-control" id="member_id" name="member_id"
						placeholder="아 이 디" maxlength="20">
				</div>
				<br>
				<div>
					<input type="password" class="form-control" id="member_pw"
						name="member_pw" placeholder="비 밀 번 호" maxlength="20">
				</div>
				<br> <input type="submit" class="btn btn-info form-control"
					value="로 그 인">
					
					
				

			</form>
			</div>
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