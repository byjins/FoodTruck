<%@page import="com.java.db.dao.PagingListDao"%>
<%@page import="com.java.db.dto.PaginationDto"%>
<%@page import="com.java.db.dao.PagingCountDao"%>
<%@page import="com.java.db.dao.ReviewDao"%>
<%@page import="com.java.db.dto.ReviewDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.java.db.dao.MenuDao"%>
<%@page import="com.java.db.dto.MenuDto"%>
<%@ page import="com.java.db.dao.ShopInfoDao"%>
<%@ page import="com.java.db.dto.ShopInfoDto"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<head>


<style type="text/css">

tr th {
	font-size: 14px;
}

tr td {
	font-size: 14px;
}
.shop {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	/* border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 0.25rem; */
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop_management Page</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/star-rating.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function infomodi() {
		var s_intro = infomodify.introarea.value;

		if (s_intro == "") {
			alert("가게소개를 적어주세요.");
		} else if (s_intro != "") {
			alert("가게소개를 수정합니다.");
			infomodify.submit();
		}
	}

	function plusmenu() {
		var plus_window;

		plus_window = window.open("menu_plus.jsp", "menuplus",
				"width=500, height=450, left=900, top=150");
		document.forms['menuplus'].submit();
	}

	window.onload = function() {
		document
				.querySelector('.custom-file-input')
				.addEventListener(
						'change',
						function(e) {
							var fileName = document.getElementById("imgfile").files[0].name;
							var nextSibling = e.target.nextElementSibling
							nextSibling.innerText = fileName
						})
	}
</script>

</head>

<body>
	<%!
		String S_name, S_intro;
		Double S_score, S_areax, S_areay;
		String num;
	%>

	<%
		ShopInfoDto S_dto = new ShopInfoDto();
		ShopInfoDao S_dao = new ShopInfoDao();

		num = request.getParameter("shop_num");
		S_dto = S_dao.shopinfo(num);

		S_name = S_dto.getShopName();
		S_intro = S_dto.getShopIntro();
		S_score = S_dto.getShopScore();
		S_areay = S_dto.getShopAreaY();
	%>

	<!-- 평점 -->
	<%
		ArrayList<ShopInfoDto> S_dtos = new ArrayList<ShopInfoDto>();
		S_dtos = S_dao.shop_score(num);

			for (int i = 0; i < S_dtos.size(); i++) {
				S_score = S_dtos.get(i).getShopScore();
			}
	%>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->

		<div class="mt-4 mb-3"></div>

		<!-- row -->
		<div class="row">

			<!-- Post Content Column -->
			<div class="col-sm-8" style="float: none; margin: 0 auto;">

				<!-- 가게 메인 사진 -->
				<div class="shop mb-4">
					<%
						if (null == S_dto.getShopimg()) {
					%>
						<img class="img-fluid rounded" src="http://placehold.it/730x400"
						alt="" width="730" height="400">
					<%
						} else {
					%>
						<img class="img-fluid rounded" src=<%=S_dto.getShopimg()%> alt=""
						name="img_field" style="width: 730px; height: 400px;">
					<%
						}
					%>
					
					<form name="img_upload" action="uploadOK.jsp?shop_num=<%=num%>"
						method="post" enctype="multipart/form-data">
						<div class="row mt-2">
							<div class="col-9 col-sm-8 col-md-9 col-lg-10">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="imgfile" name="imgfile"> 
									<label class="custom-file-label" for="imgfile">이미지를 선택해주세요</label>
								</div>
							</div>
							<div class="col-3 col-sm-4 col-md-3 col-lg-2"> 
								<input type="submit" value="업로드" class="btn btn-primary">
							</div>
						</div>
					</form>
				</div>


				<!-- 가게 정보 -->
				<div class="shop sm-4">
					<div class="shop-body">
						<hr>


						<h5 style="text-align: center;">
							<b><%=S_name%></b>
						</h5>
						<hr>

						<br>
						<div class="card my-4">
						<h5 class="card-header">
							<b>가게소개</b>

						</h5>
					
						<h5 class="card-body" style="margin: 0px 0px -20px 0px;">
							<form name="infomodify" action="ShopIntroModify.do" method="post">
								<input type="hidden" name="shop_num" value="<%=num%>">
								<textarea name="introarea" class="form-control" rows="3" placeholder="<%=S_intro%>" style="resize: none; font-size: 15pt;"></textarea>
								<input type="button" class="btn btn-primary" value="가게소개 수정" onclick="infomodi()" style="float: right; margin-top: 10px;" />
								<h5 style="margin: 15px 0px;"> 가게평점 : <%=S_score%></h5>
							</form>
						</h5>
						
						<br>
						</div>
					</div>
				</div>
				
				
				<!-- 메뉴  -->
				<div class="card my-4">
					<h5 class="card-header">
						<b>가게 메뉴 </b>
					</h5>
					<div class="card-body" style="padding: 1rem;">
						<%!
							String M_name, M_intro;
							int M_num, M_price;
						%>

						<%
							ArrayList<MenuDto> M_dtos = new ArrayList<MenuDto>();
							MenuDao M_dao = new MenuDao();
							M_dtos = M_dao.menuinfo(num);
						%>
						
						<!-- 메뉴출력 -->
						<table class="table" style="text-align: center;">
							<tr>
								<!-- <th>메뉴번호</th> -->
								<th>메뉴이름</th>
								<th>메뉴가격</th>
								<th>메뉴소개</th>
								<th>삭제</th>
							</tr>
							
							<%
								for (int i = 0; i < M_dtos.size(); i++) {
							%>
							<%
								/* M_num = M_dtos.get(i).getMenuNum(); */
								M_name = M_dtos.get(i).getMenuName();
								M_price = M_dtos.get(i).getMenuPrice();
								M_intro = M_dtos.get(i).getMenuIntro();
							%>
							
							<tr>
								<%-- <td><%=M_num%></td> --%>
								<td><%=M_name%></td>
								<td><%=M_price%></td>
								<td><%=M_intro%></td>
								<td><form action="MenuDelete.do" method="post">
										<input type="hidden" id="shop_num" name="shop_num" value=<%=num%>/> 
										<input type="hidden" id="menu_num" name="menu_num" value=<%=M_num%> /> 
										<input type="submit" class="btn btn-primary" value="삭제" />
									</form>
								</td>
								<%
									}
								%>
							</tr>
						</table>
					</div>
				</div>
				<form action="menu_plus.jsp" name="menuplus" method="post" target="menuplus">
					<input type="hidden" name="shop_num" value="<%=num%>"> <input type="button" class="btn btn-primary" value="메뉴추가" onclick="plusmenu()" 
						   style="float: right; margin-left: 10px; margin-top: -15px;" />
				</form>
				<br />
				
				<!-- 댓글창 -->
				<div class="card my-4">
				<h4 class="card-header"><b>리뷰</b></h4>
				<%
					//날짜 표시
					Date now = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sf.format(now);
				%>

				<!-- 페이징 -->
				<%!
					int listcnt, startpage, endpage;
					int pages;
					int range = 1;
				%>

				<%
					PaginationDto P_dto = new PaginationDto();
					PagingCountDao Pcount_dao = new PagingCountDao();
					PagingListDao Plist_dao = new PagingListDao();

					pages = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
					P_dto.setListCnt(Pcount_dao.pagingcount(num));
					listcnt = P_dto.getListCnt();

					P_dto.pageInfo(pages, range, listcnt);

					startpage = P_dto.getStartPage();
					endpage = P_dto.getEndPage();
				%>

				<!-- 댓글 -->
				<%!
					int review_num = 0;
					Double review_score = null;
					String review_date = null;
					String review_comment = null;
					String review_id = null;
				%>

				<%
					ArrayList<ReviewDto> R_dtos = new ArrayList<ReviewDto>();
					PagingListDao R_pagingdao = new PagingListDao();
					ReviewDao R_dao = new ReviewDao();

					R_dtos = R_pagingdao.paginglist(num, P_dto.getPage(), 5);
				%>

				<div class="card-mb-4">

					<%
						for (int i = 0; i < R_dtos.size(); i++) {
					%>

					<%
						review_id = R_dtos.get(i).getMemberId();
						review_date = R_dtos.get(i).getReviewDate();
						review_score = R_dtos.get(i).getreviewScore();
						review_comment = R_dtos.get(i).getReviewComment();
					%>
					<div class="card-body">
						<h5 class="mt-0"><%=review_id%> | <%=review_date%> | <%=review_score%></h5>
						<h5><%=review_comment%></h5>
					</div>
					<hr>

					<%
						}
					%>

					<!-- 페이징 -->

					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="<%=startpage%>" end="<%=endpage%>" step="1">
							<li class="page-item"><a class="page-link" href="shop_management.do?shop_num=<%=num %>&page=${i }">
							<c:out value="${i }" /></a></li>
						</c:forEach>
					</ul>
				</div>
				</div>


			</div>
			<!-- /.Post Content Column -->

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