<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="nav.jsp"></jsp:include>
  

	<!-- 로그인 -->

	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">
	
			<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로 그 인 화 면</h3>
					<br>
					<div >
						<input type="text" class="form-control" id="userID" name="userID"
							placeholder="아 이 디" maxlength="20">
					</div>
					<br>
					<div >
						<input type="password" class="form-control" id="userPassword"
							name="userPassword" placeholder="비 밀 번 호" maxlength="20">
					</div>
					<br> 
					<input type="submit" class="btn btn-info form-control" value="로 그 인">
						
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