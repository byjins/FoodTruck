<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
										<!--col-lg-6 col-md-8 col-sm-6 col-xs-4-->
		<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">
				<div class="jumbotron" style="padding-top: 50px; margin-top: 50px;">
					<form method="post" action="member_signup.jsp">

						<br> <input type="submit" class="btn btn-info form-control" value="일반회원 가입하기">
					</form>
					
						<form method="post" action="shop_signup.jsp">

						<br> <input type="submit" class="btn btn-info form-control" value="사업자회원 가입하기">
					</form>
				</div>
				
				
			
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
