<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

<style type="text/css">
#searchbtn {
	margin: 0px 130px 0px 0px;
}
</style>
</head>
<body>
<%
String sessionId = (String)session.getAttribute("member_id");
session.setMaxInactiveInterval(30*60);//세션유효시간 30분

%>
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">거리에서</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<div id="searchbtn">
							<form action="map.jsp" class="form-inline my-2 my-lg-0">
								<input type="text" style="width: 360px;" class="form-control"
									placeholder="검색"> <span class="input-group-append">
									<input type="submit" value="검색" class="btn btn-primary my-2 my-sm-0">
								</span>
							</form>
						</div>
					</div>
				</li>
				<li class="nav-item">
					<form action="map.jsp" class="form-inline my-2 my-lg-0">
						<button class="btn btn-primary my-2 my-sm-0" type="submit">지도</button>
					</form>
				</li>
				<% if(sessionId == null) {%>
					<li class="nav-item"><a class="nav-link" href="login_main.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="signup_main.jsp">회원가입</a></li>
				<% } else {%>
				
					<li class="nav-item"><a class="nav-link" href="login_main.jsp"><%=sessionId %>님</a></li>
					<li class="nav-item"><a class="nav-link" href="logout_process.jsp">로그아웃</a></li>
				<%} %>
					<li class="nav-item"><a class="nav-link" href="review_main.jsp">리뷰 &nbsp&nbsp</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>
