<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>

<jsp:include page="style.jsp"></jsp:include>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	function checkShopNum(){
		var regNum = /^[0-9$-]{22,22}$/;
		var shopNum = $('#shopNum').val();
	
		if(shopNum!=null && true==regNum.test(shopNum)){
			$.ajax({
				type : 'POST',
				url : '../ShopRegisterCheckServlet',
				data : {shopNum: shopNum},
				success : function(result){
					if(result==1){
						$('#checkNumcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 있는 등록번호입니다');
						//$('#checkType').attr('class','modal-content panel-success');
				}else {
					$('#checkNumcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 없는 등록번호입니다');
					//$('#checkType').attr('class','modal-content panel-warning');
					}
				}
			})
		}else{
			$('#checkNumcheckMessage').html('&nbsp&nbsp&nbsp-와 숫자만 사용가능합니다.');
		}
	}
	function checkShopID(){
		var regPid = /^[A-Za-z0-9+]{6,15}$/;
		var shopID = $('#shopID').val();
		
		if(shopID!=null && true==regPid.test(shopID)){
			$.ajax({
				type : 'POST',
				url : '../ShopRegisterCheckServlet',
				data : {shopID: shopID},
				success : function(result){
					if(result==1){
						$('#checkIDcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 있는 아이디입니다');
						//$('#checkType').attr('class','modal-content panel-success');
				}else {
					$('#checkIDcheckMessage').html('&nbsp&nbsp&nbsp사용할 수 없는 아이디입니다');
					//$('#checkType').attr('class','modal-content panel-warning');
					}
				}
			})
		}else{
			$('#checkIDcheckMessage').html('&nbsp&nbsp&nbsp6~15자리의 영문과 숫자만 사용가능합니다.');
		}
	}
	function shoppasswordCheck(){
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		var shopPassword1 = $('#shopPassword1').val();
		var shopPassword2 = $('#shopPassword2').val();
		
		if(shopPassword1 != shopPassword2){
			$('#passwordCheckMessage').html('&nbsp&nbsp&nbsp두 비밀번호가 일치하지않습니다.');
		}
		else if(false === reg.test(shopPassword1)){
				//$('#passwordCheckMessage').html('8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				$('#passwordCheckMessage').html('&nbsp&nbsp8~15자리, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}
	function checkshopPhone(){
		var reg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		var shopPhone = $('#shopPhone').val();
		if(shopPhone!=null && true==reg.test(shopPhone)){
		$.ajax({
			type : 'POST',
			url : '../ShopRegisterCheckServlet',
			data : {shopPhone: shopPhone},
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
	}else{
		$('#phoneCheckMessage').html('&nbsp&nbsp&nbsp 01~로시작하는 11자리를 입력해주세요.');
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
		<form method="POST" action="../ShopRegister">
						<h3 style="text-align: center;">사 업 자 회 원 가 입</h3>
						<br>
						<div class = "input-group">
							<input type="text" class="form-control" id="shopNum" name="shopNum" onkeyup = "checkShopNum();" placeholder="사업자번호" maxlength="22">
              			<span class="input-group-append">
               			  <select name="shopval" class="form-select" aria-label="Default select example">
               			<option value="푸드트럭" selected>푸드트럭</option>
						</select>
              			</span>
						</div>
						<div class="form-row">
						<h6 style="color:red" id = "checkNumcheckMessage"></h6>
						</div>
						<div class="form-row">
						<div class="col-sm-12">
							<input type="text" class="form-control" id="shopID" name="shopID" placeholder="아 이 디" onkeyup = "checkShopID();" placeholder="아이디" maxlength="15">
						</div>
						<div class="form-row">
						<h6 style="color:red" id = "checkIDcheckMessage"></h6>
						</div>
						<br>
						</div>
						<div class="form-row">
						<div class="col-sm-12">
							<input type="password" class="form-control" id="shopPassword1" name="shopPassword1" onkeyup = "shoppasswordCheck();" placeholder="비 밀 번 호" maxlength="12">
							</div>
							<br><br>
						<div class="col-sm-12">
							<input type="password" class="form-control" id="shopPassword2" name="shopPassword2" onkeyup = "shoppasswordCheck();" placeholder="비 밀 번 호 확 인" maxlength="12">
							</div>
							<div class="col-sm-12">
						<h6 style="color:red" id = "passwordCheckMessage"></h6>
							</div>
						<br>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="managersName" name="managersName" placeholder="이름" maxlength="4">
						</div>
						<br><br>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="shopPhone" name="shopPhone" onkeyup="checkshopPhone();" placeholder="전화번호(-를 제외하고 입력)" maxlength="11">
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


	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


</body>

</html>