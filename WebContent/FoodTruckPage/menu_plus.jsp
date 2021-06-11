<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>MenuPlus</title>
<link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>
<link rel="stylesheet"href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"crossorigin="anonymous">

<script>
	function plusmenu() {
		
		var s_num = menu_plus.shop_num.value;
		var m_name = menu_plus.menu_name.value;
		var m_price = menu_plus.menu_price.value;
		var m_intro = menu_plus.menu_intro.value;
				
		if(m_name == "" || m_price == "" || m_intro == "") {
			alert("모든 항목을 입력해주세요.");
		} else if(m_name != "" || m_price != "" || m_intro != ""){
			alert("입력한 메뉴를 추가합니다.");
			menu_plus.method = "post";
			menu_plus.action = "../MenuPlus";
			menu_plus.submit();
		}
	}
</script>

</head>
<body>
<%
	String num = request.getParameter("shop_num");
%>

<div class="container col-lg-6 col-md-8 col-xs-4">

		<div class="jumbotron" style="padding-top: 100px; margin-top: 70px;">
		<div class="content">
			<form name="menu_plus" action="../MenuPlus" method="post">
				<h3 style="text-align: center;">메 뉴 추 가</h3>
				<input type="hidden" id="shop_num" name ="shop_num" value=<%=num %>>
				<br>
				<div>
					<input type="text" class="form-control" id="menu_name" name="menu_name" placeholder="메뉴이름" maxlength="20">
				</div>
				<br>
				<div>
					<input type="text" class="form-control" id="menu_price" name="menu_price" placeholder="메뉴가격" maxlength="20">
				</div>
				<br>
				<div>
					<textarea name="menu_intro" class="form-control" rows="2" placeholder="메뉴소개" style="resize: none; font-size: 15pt;"></textarea>
				</div>
				<br> 
				<div>
				<input type="button" class="btn btn-info form-control"value="메뉴추가" onclick="plusmenu()"/>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>