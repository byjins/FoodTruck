<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
						<div class ="shop-body">
						<hr>
						<h5 style="text-align: center;"><b>가게 이름</b></h5> 
						<hr>
						<h4><b>가게 상세 정보</b></h4>
						<h5>상세 내용</h5>
						<hr>
						</div>
					</div>

					<!-- 댓글창 -->
					<div class="card my-3">
						<h5 class="card-header">코멘트</h5>
						<div class="card-body">
							<form>
								<div class="form-group">
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<button type="submit" class="btn btn-primary">글쓰기</button>
							</form>
						</div>
					</div>

					<!-- 댓글 -->
					<div class="card mb-4">
						<div class="card-body">
							<h5 class="mt-0">사용자 ID</h5>
							코멘트 내용
						</div>
					</div>

				</div>

			<!-- 메뉴  -->
			<div class="card my-4">
				<h5 class="card-header"><b>가게 메뉴</b></h5>
				<div class="card-body">메뉴 이름 가격</div>
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