<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>	
<html lang="utf-8">

<head>
<jsp:include page="style.jsp"></jsp:include>
</head>

<body>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 로그인 -->
	<br/><br/><br/><br/>

	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">

		<div class="jumbotron" style="padding-top: 70px; margin-top: 50px;">
			<form method="post" action="loginmemberview.do">
				<br> <input type="submit" class="btn btn-info form-control"
					value="일반회원 로그인하기">
			</form>
			<br/>
			<form method="post" action="loginshopview.do">
				<br> <input type="submit" class="btn btn-info form-control"
					value="사업자회원 로그인하기">
			</form>
			<br/>
					<div class="form-row float-right">
						<form method="post" action="findIdView.do">
							<input type="submit" class="btn btn-secondary form-control" value="아이디 찾기" >
						</form>
						&nbsp;
						<form method="post" action="findPwView.do">
							<input type="submit" class="btn btn-secondary form-control" value="비밀번호 찾기" >
						</form>
					</div>
					<br>
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