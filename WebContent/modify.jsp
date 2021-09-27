<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.java.db.dao.MemberInfoDao"%>	
<%@ page import="com.java.db.dto.MemberDto"%>		
<html lang="en">

<head>

<jsp:include page="style.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
<script type = "text/javascript">
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
	
	
	function shoppasswordCheckFunction(){
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
</script>
	
</head>

<body>

	<%
		MemberDto mDto = new MemberDto();
		MemberInfoDao mInfoDao = new MemberInfoDao();
		
		SManagerInfoDto sDto = new SManagerInfoDto();
		SManagerInfoDao sInfoDao = new SManagerInfoDao();
		
		
		String mId = (String)session.getAttribute("member_id");   //이용자
		String sId = (String)session.getAttribute("shop_id");   //사업자
		
		
		
		mDto = mInfoDao.info(mId);
		sDto = sInfoDao.info(sId);		

	%>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<div class="container">
		<br/><br/><br/><br/>

<% if(mId!=null){ %>
<%System.out.println(mDto); %>
<form action="../MemberInfoModify" method="post">
  <table class="table">
    <thead class="thead-light">
    
      <tr>
        <th>회원정보</th>
        <th class="text-right">
		<input type="submit" value="변경하기" >
		</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>아이디</td>
        <td><%=mDto.getId() %></td>

      </tr>
      <tr>
        <td>이름</td>
        <td><%=mDto.getName()%></td>

      </tr>
      
      <tr>
        <td>비밀번호</td>
        <td><input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="현 재 비 밀 번 호" maxlength="12"><br>
        	<input type="hidden" id="mid" name="mid" value="<%=mDto.getId()%>">
      </tr>
      <tr>
        <td>변경 비밀번호</td>
        <td><input type="password" class="form-control" id="userPassword1" name="userPassword1" onkeyup = "passwordCheckFunction();" placeholder="변 경 비 밀 번 호" maxlength="12"><br>
        	<input type="password" class="form-control" id="userPassword2" name="userPassword2" onkeyup = "passwordCheckFunction();" placeholder="비 밀 번 호 확 인" maxlength="12"><br>
        	<h6 style="color:red" id = "passwordCheckMessage"></h6></td>
      </tr>
     
    </tbody>
  </table>
   </form>
  
  <!-- 사업자 정보 -->
  
  
  <%}else if(sId != null){%>
  <form action ="../ShopInfoModify" method="post">
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>사업자정보</th>
        <th class="text-right">
		<input type="submit" value="정보수정">
		</th>
      </tr>
    </thead>
    <tbody>
     <tr>
        <td>가게등록번호</td>
        <td><%=sDto.getNum().toString()%></td>
      </tr>
      <tr>
       <td>가게이름</td>
        <td><%=sDto.getShopName().toString() %></td>
      </tr>
      <tr>
        <td>아이디</td>
        <td><%=sDto.getId().toString() %></td>
      </tr>
      <tr>
        <td>관리자이름</td>
        <td><%=sDto.getAdminName().toString() %></td>
      </tr>
	<tr>
        <td>비밀번호</td>
        <td><input type="password" class="form-control" id="shopPassword" name="shopPassword"  placeholder="현 재 비 밀 번 호" maxlength="12"><br>
      	  <input type="hidden" id="sid" name="sid" value="<%=sDto.getId()%>"></td>
      </tr>
      <tr>
        <td>변경 비밀번호</td>
        <td><input type="password" class="form-control" id="shopPassword1" name="shopPassword1" onkeyup = "shoppasswordCheckFunction();" placeholder="변 경 비 밀 번 호" maxlength="12"><br>
        	<input type="password" class="form-control" id="shopPassword2" name="shopPassword2" onkeyup = "shoppasswordCheckFunction();" placeholder="비 밀 번 호 확 인" maxlength="12"><br>
        	<h6 style="color:red" id = "passwordCheckMessage"></h6></td>
      </tr>
    </tbody>
  </table>
   </form>
  <%} %>
  
</div>

</body>
</html>

	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

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
<div class="modal fade col-lg-6 col-md-8 col-sm-6 col-xs-4"
	id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="vertical-alignment-helper ">
		<div class="modal-dialog vertical-align-center ">
			<div
				class="modal-content <%if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
				<div class="modal-header panel-heading vertical-align-center">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">
							<!-- &times; -->
						</span> <span class="sr-only ">Close</span>
					</button>
					<h4 class="modal-title">
						<%=messageType %>
					</h4>
				</div>
				<div class="modal-body">
					<%=messageContent %>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
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
</body>

</html>