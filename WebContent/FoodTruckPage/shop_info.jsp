<%@page import="com.java.db.dao.ReviewDao"%>
<%@page import="com.java.db.dto.ReviewDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.java.db.dao.MenuDao"%>
<%@page import="com.java.db.dto.MenuDto"%>
<%@ page import="com.java.db.dao.ShopInfoDao"%>
<%@ page import="com.java.db.dto.ShopInfoDto"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>


<head>


<style type="text/css">
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

<title>Shop_info Page</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/star-rating.css">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">가게 정보</h1>

		<!-- row -->
		<div class="row">

			<!-- Post Content Column -->
			<div class="col-md-8">

				<!-- 가게 메인 사진 -->
				<div class="shop mb-4">
					<img class="img-fluid rounded" src="http://placehold.it/1024x480"
						alt="">
				<hr>
				<!-- 가게 정보 표시 -->
				<div class="shop md-4">
					<div class="shop-body">
						<hr>
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
							S_areax = S_dto.getShopAreaX();
							S_areay = S_dto.getShopAreaY();
						%>

						<h5 style="text-align: center;"><b><%=S_name%></b></h5>
						<hr>

						<h4><b>상세 정보</b></h4>
						<br>

						<h5><b>가게소개</b></h5>
						<h5>=><%=S_intro%></h5>
						<h5>평점 :<%=S_score%></h5>
						<h5>가게x좌표 :<%=S_areax%></h5>
						<h5>가게y좌표 :<%=S_areay%></h5>
						<hr>

					</div>
				</div>

				<!-- 댓글창 -->
				<%
					//날짜 표시
					Date now = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sf.format(now);
				%>

				<form action="../ReviewCheck" method="post">
					<input type="hidden" name="shop_num" value="<%=num%>">
					<div class="card my-3">
						<h5 class="card-header">
							&nbsp;&nbsp;<%=today%></h5>
						<div class="card-body">

							<div class="form-group">
								<textarea class="form-control" name="comment" rows="3"></textarea>
							</div>
							<!-- 별점 -->
							<div class="pt-3">
								<h5>별점</h5>
								<input id="input-2" name="rating" class="rating rating-loading"
									data-min="0.5" data-max="5" data-step="0.5" value="2"
									data-size="sm">
							</div>
							<script src="js/rating.js"></script>
							<button type="submit" class="btn btn-primary">글쓰기</button>
						</div>
					</div>
				</form>
				
				<!-- 댓글 -->
				<%!
					int review_num = 0;
					Double review_score = null;
					String review_date = null;
					String review_comment = null;
					String id = null;
				%>

				<%
					ArrayList<ReviewDto> R_dtos = new ArrayList<ReviewDto>();
					ReviewDao R_dao = new ReviewDao();
					R_dtos = R_dao.select_review(num);
				%>
				
				<div class="card mb-4">
					<%
						for (int i = 0; i < R_dtos.size(); i++) {
					%>

					<%
						id = (String) session.getAttribute("member_id");
						review_num = R_dtos.get(i).getReviewNum();
						review_date = R_dtos.get(i).getReviewDate();
						review_score = R_dtos.get(i).getreviewScore();
						review_comment = R_dtos.get(i).getReviewComment();
					%>
					<div class="card-body">
						<h5 class="mt-0">
							<%=id%> | <%=review_date%> | <%=review_score%></h5>
						<h5><%=review_comment%></h5>
					</div>
					<hr>
					<%
					}
					%>

						<!-- 페이징 -->
						<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span></a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</div>

				<!-- 메뉴  -->
				<div class="card my-4">
					<h5 class="card-header">
						<b>가게 메뉴</b>
					</h5>
					<div class="card-body">
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
						<table class="table">
							<tr>
								<th>메뉴번호</th>
								<th>메뉴이름</th>
								<th>메뉴가격</th>
								<th>메뉴소개</th>
							</tr>
							<%
								for (int i = 0; i < M_dtos.size(); i++) {
							%>
							<%
								M_num = M_dtos.get(i).getMenuNum();
								M_name = M_dtos.get(i).getMenuName();
								M_price = M_dtos.get(i).getMenuPrice();
								M_intro = M_dtos.get(i).getMenuIntro();
							%>
							<tr>
								<td><%=M_num%></td>
								<td><%=M_name%></td>
								<td><%=M_price%></td>
								<td><%=M_intro%></td>
								<%
								}
								%>
							</tr>
						</table>
					</div>
				</div>

			</div>
			<!-- /.Post Content Column -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>