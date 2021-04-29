<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.java.db.dao.MemberInfoDao"%>	
<%@ page import="com.java.db.dto.MemberDto"%>		
<html lang="en">

<head>

<jsp:include page="style.jsp"></jsp:include>

	<%! String id; %>

</head>

<body>

	<%
		MemberDto dto = new MemberDto();
		MemberInfoDao infoDao = new MemberInfoDao();
	
		
		
		String sessionId1 = (String)session.getAttribute("member_id1");   //사업자
		String sessionId2 = (String)session.getAttribute("member_id2");   //이용자
		
		
		
		dto = infoDao.info(sessionId1);

		

	%>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<div class="container">

		<br/><br/><br/><br/><br/><br/>


  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>회원정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>구분</td>
        <td><%=dto.getNum()%></td>
      </tr>
      <tr>
        <td>아이디</td>
        <td><%=dto.getId().toString() %></td>

      </tr>
      <tr>
        <td>이름</td>
        <td><%=dto.getName().toString() %></td>

      </tr>
      <tr>
        <td>나이</td>
        <td><%=dto.getAge()%></td>
      </tr>
      <tr>
        <td>핸드폰번호</td>
        <td><%=dto.getPhone().toString() %></td>
      </tr>
      
    </tbody>
  </table>
</div>

</body>
</html>

	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>