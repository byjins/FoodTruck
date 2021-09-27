<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="com.java.db.dao.MemberSignupDao"%>
<html lang="en">

<head>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<jsp:include page="style.jsp"></jsp:include>
<link rel="stylesheet" href = "css/custom.css">

<script type = "text/javascript">
</script>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 비밀번호 찾기 -->
	<br><br><br>
	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">
		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
			<!-- <form name = "form1" method="post" action="signup_member_process.jsp"> -->
			<form name="findpw" method="POST" action="../FindPw">
				<h3 style="text-align: center;">비밀번호 찾기</h3>
				<br>
				<div class="form-row">
					<div class="col-sm-12">
						<input type="text" class="form-control" id="id" name="id" placeholder="아이디" maxlength="20">
					</div>
					<br>
					<br>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="name" name="name" placeholder="이름" maxlength="4">
					</div>
					<br>
					<br>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호(-를 제외하고 입력)" maxlength="11">
					</div>
					<br>
				</div>
				<br> <input type="submit" class="btn btn-info form-control" value="비밀번호 찾기">
			</form>
		</div>
	</div>

	<!--  	<div class ="modal fade col-lg-6 col-md-8 col-sm-6 col-xs-4" id ="checkModal" tabindex="-1" role="dialog" aria-hidden="true" > 
 		<div class="vertical-alignment-helper ">
 			<div class = "modal-dialog vertical-align-center ">
 				<div class = "modal-content panel-info ">
 					<div id = "checkType" class = "modal-header panel-heading vertical-align-center">
 						<button type="button" class="close" data-dismiss="modal">
 							<span aria-hidden="true">&times;</span>
 							<span class ="sr-only ">Close</span>
 						</button>
 						<h4 class ="modal-title">	
 							확인 메시지
 						</h4>
 					</div>
 					<div class="modal-body" id="checkMessage">
 					</div>
 					<div class="modal-footer">
 						<button type = "button" class="btn btn-primary" data-dismiss="modal">확인</button>
 					</div>
 				</div>
 			</div>
 		</div>
 	</div> -->


	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>



</body>

</html>