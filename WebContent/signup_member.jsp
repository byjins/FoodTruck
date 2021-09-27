<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="com.java.db.dao.MemberSignupDao"%>
<html lang="en">

<head>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<jsp:include page="style.jsp"></jsp:include>
<link rel="stylesheet" href = "css/custom.css">

<script type = "text/javascript">
	function checkID(){
		var regPid = /^[A-Za-z0-9+]{6,15}$/;
		var userID = $('#userID').val();
		
		if(userID!=null&& true===regPid.test(userID)){
			$.ajax({
				type : 'POST',
				url : '../UserRegisterCheckServlet',
				data : {userID: userID},
				success : function(result){
					if(result==1){
						$('#idcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 있는 아이디입니다');
						//$('#checkType').attr('class','modal-content panel-success');
				}else {
					$('#idcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 없는 아이디입니다');
					//$('#checkType').attr('class','modal-content panel-warning');
					}
				}
			})
		}else{
			$('#idcheckMessage').html('&nbsp&nbsp&nbsp6~15자리의 영문과 숫자만 사용가능합니다.');
		}
		
	}
	function checkPhone(){
		var userPhone = $('#userPhone').val();
		$.ajax({
			type : 'POST',
			url : '../UserRegisterCheckServlet',
			data : {userPhone: userPhone},
			success : function(result){
				if(result==1){
					$('#phoneCheckMessage').html('&nbsp&nbsp&nbsp사용가능 전화번호입니다');
					//$('#checkType').attr('class','modal-content panel-success');
			}else{
				$('#phoneCheckMessage').html('&nbsp&nbsp&nbsp사용중인 전화번호입니다.');
				//$('#checkType').attr('class','modal-content panel-warning');
				}
			}
		})
	}
	function passwordCheckFunction(){
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		
		if(userPassword1 != userPassword2){
			$('#passwordCheckMessage').html('&nbsp&nbsp&nbsp두 비밀번호가 일치하지않습니다.');
		}
		else if(false === reg.test(userPassword1)){
				//$('#passwordCheckMessage').html('8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				$('#passwordCheckMessage').html('&nbsp&nbsp8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}	
</script>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<!-- 로그인 -->

	<div class="container col-lg-6 col-md-8 col-sm-6 col-xs-4">

		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
		<!-- <form name = "form1" method="post" action="signup_member_process.jsp"> -->
		<form name = "form1" method="POST" action="../UserRegister">
						<h3 style="text-align: center;">일 반 회 원 가 입</h3>
						<br>
						<!-- <div class="form-group row">
						<div class="col-sm-12 ">
        					<input type="text" class="form-control" id="userID" name="userID" placeholder="아 이 디" maxlength="20">
        					<input type="button" class="btn btn-primary" value="중복확인" onClick="checkID(userID)">
    					</div>
						</div> -->
						<div class = "input-group">
							<input type="text" class="form-control" id="userID" name="userID" onkeyup = "checkID();" placeholder="아 이 디" maxlength="20">
						</div>
						<div class="form-row">
						<h6 style="color:red" id = "idcheckMessage"></h6>
						</div>
						<div class="form-row">
						<div class="col-sm-12">
							<input type="password" class="form-control" id="userPassword1" name="userPassword1" onkeyup = "passwordCheckFunction();" placeholder="비 밀 번 호" maxlength="12">
							</div>
							<br><br>
						<div class="col-sm-12">
							<input type="password" class="form-control" id="userPassword2" name="userPassword2" onkeyup = "passwordCheckFunction();" placeholder="비 밀 번 호 확 인" maxlength="12">
							</div>
							<div class="col-sm-12">
						<h6 style="color:red" id = "passwordCheckMessage"></h6>
							</div>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="이	름" placeholder="이름" maxlength="4">
						</div>
						<br><br>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="userAge" name="userAge" placeholder="나이" placeholder="나이" maxlength="2">
						</div>
						<br><br>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="userPhone" name="userPhone" onkeyup="checkPhone();" placeholder="전화번호(-를 제외하고 입력)" maxlength="11">
						</div>
						<div class="col-sm-12">
						<h6 style="color:red" id = "phoneCheckMessage"></h6>
							</div>
						<br>
						</div>
						<br>
						 <input type="submit" class="btn btn-info form-control" value="가입하기">
					</form>
		</div>
	</div>
 	<%
 	String messageContent = null;
 	if(session.getAttribute("messageContent")!= null){
 		messageContent = (String)session.getAttribute("messageContent");
 	}
 	String messageType = null;
 	if(session.getAttribute("messageType")!= null){
 		messageType = (String)session.getAttribute("messageType");
 	}
 	if(messageContent != null){
 	%>
 	<div class ="modal fade col-lg-6 col-md-8 col-sm-6 col-xs-4" id ="messageModal" tabindex="-1" role="dialog" aria-hidden="true" > 
 		<div class="vertical-alignment-helper ">
 			<div class = "modal-dialog vertical-align-center ">
 				<div class = "modal-content <%if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
 					<div class = "modal-header panel-heading vertical-align-center">
 						<button type="button" class="close" data-dismiss="modal">
 							<span aria-hidden="true"><!-- &times; --></span>
 							<span class ="sr-only ">Close</span>
 						</button>
 						<h4 class ="modal-title">
 							<%=messageType %>
 						</h4>
 					</div>
 					<div class="modal-body">
 						<%=messageContent %>
 					</div>
 					<div class="modal-footer">
 						<button type = "button" class="btn btn-primary" data-dismiss="modal">확인</button>
 					</div>
 				</div>
 			</div>
 		</div>
 	</div>
 	<script>
 		$("#messageModal").modal('show');
 		
 	</script>
 	<%
 		session.removeAttribute("messageContent");
 		session.removeAttribute("messageType");
	}
 	%>
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