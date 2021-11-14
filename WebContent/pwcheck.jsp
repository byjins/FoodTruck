<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="com.java.db.dao.MemberSignupDao"%>
 <!DOCTYPE html>
<html lang="en">

<head>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<jsp:include page="style.jsp"></jsp:include>
<link rel="stylesheet" href = "css/custom.css">

<script type = "text/javascript">
function passwordCheckFunction(){
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
	var password1 = $('#password1').val();
	var password2 = $('#password2').val();
	
	if(password1 != password2){
		$('#passwordCheckMessage').html('&nbsp&nbsp&nbsp두 비밀번호가 일치하지않습니다.');
	}
	else if(false === reg.test(password1)){
			//$('#passwordCheckMessage').html('8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			$('#passwordCheckMessage').html('&nbsp&nbsp8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
	}else{
		$('#passwordCheckMessage').html('');
	}
}	
</script>
</head>
<%String id = request.getParameter("id"); %>
<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 로그인 -->
	<br><br><br>
	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">
		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
			<!-- <form name = "form1" method="post" action="signup_member_process.jsp"> -->
			<h3 style="text-align: center;">비밀번호 변경</h3>
			<br>
			<form action="changePw.do" method = "post">
			<input type="hidden" id="id" name="id" value="<%=id%>">
			<div class="col-sm-12">
				<input type="password" class="form-control" id="password1"
					name="password1" onkeyup="passwordCheckFunction();"
					placeholder="비 밀 번 호" maxlength="12">
			</div>
			<br> <br>
			<div class="col-sm-12">
				<input type="password" class="form-control" id="password2"
					name="password2" onkeyup="passwordCheckFunction();"
					placeholder="비 밀 번 호 확 인" maxlength="12">
			</div>
			<div class="col-sm-12">
				<h6 style="color: red" id="passwordCheckMessage"></h6>
			</div>
			<br>
			<input type="submit" class="btn btn-info form-control" value="변경하기">
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