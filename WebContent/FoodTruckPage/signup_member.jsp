<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="com.java.db.dao.MemberSignupDao"%>
<html lang="en">

<head>
<jsp:include page="style.jsp"></jsp:include>
<script>
	function checkID(){

	}
</script>
</head>

<body>
<script>
   function checkConfirm(){
      var form = document.form1;
      var id = form1.userID.value;
      
      <%
      MemberSignupDao m = new MemberSignupDao();
      //int i = m.idCheck();
      %>
   }
</script>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 로그인 -->

	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">

		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
		<form name = "form1" method="post" action="signup_member_process.jsp">
						<h3 style="text-align: center;">일 반 회 원 가 입</h3>
						<br>
						<!-- <div class="form-group row">
						<div class="col-sm-12 ">
        					<input type="text" class="form-control" id="userID" name="userID" placeholder="아 이 디" maxlength="20">
        					<input type="button" class="btn btn-primary" value="중복확인" onClick="checkID(userID)">
    					</div>
						</div> -->
						<div class = "input-group">
							<input type="text" class="form-control" id="userID" name="userID" placeholder="아 이 디" maxlength="20">
							<span class="input-group-append">
							<input type="button" class="btn btn-primary" value="중복확인" onClick="checkConfirm()">
							</span>
						</div>
						<br>
						<div class="form-row">
						<div class="col-sm-12">
							<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비 밀 번 호" maxlength="20">
							</div>
						</div>
						<br>
						<div class="form-row">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="이	름" placeholder="이름" maxlength="20">
						</div>
						<br>
						<div class="form-row">
							<input type="text" class="form-control" id="userAge" name="userAge" placeholder="나이" placeholder="나이" maxlength="20">
						</div>
						<br>	
						<div class="form-row">
							<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호 (-를 빼고입력)" maxlength="20">
						</div>
						<br>
						<br> <input type="submit" class="btn btn-info form-control" value="가입하기" onClick="checkConfirm()">
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