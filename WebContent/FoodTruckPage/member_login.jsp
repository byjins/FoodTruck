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
	
	<form action = "member_login.jsp" class="form-inline my-2 my-lg-0">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">회원 로그인</button>
    </form>

	</div>



	<!-- /.container -->

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>