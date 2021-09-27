<%@page import="com.java.db.dao.SManagerInfoDao"%>
<%@page import="com.java.db.dto.SManagerInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.java.db.dao.MemberInfoDao"%>	
<%@ page import="com.java.db.dto.MemberDto"%>		
<html lang="en">

<head>

<jsp:include page="style.jsp"></jsp:include>

	
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
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>회원정보</th>
        <th class="text-right">
		<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
		</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>아이디</td>
        <td><%=mDto.getId().toString() %></td>

      </tr>
      <tr>
        <td>이름</td>
        <td><%=mDto.getName().toString() %></td>

      </tr>
      <tr>
        <td>나이</td>
        <td><%=mDto.getAge()%></td>
      </tr>
      <tr>
        <td>핸드폰번호</td>
        <td><%=mDto.getPhone().toString() %></td>
      </tr>
      
    </tbody>
  </table>
  
  
  <!-- 사업자 정보 -->
  
  
  <%}else if(sId != null){%>
  <table class="table">
    <thead class="thead-light">
      <tr>
        <th>사업자정보</th>
        <th class="text-right">
		<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
		</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>아이디</td>
        <td><%=sDto.getId().toString() %></td>
      </tr>
      <tr>
        <td>관리자이름</td>
        <td><%=sDto.getAdminName().toString() %></td>
      </tr>

      <tr>
        <td>핸드폰번호</td>
        <td><%=sDto.getPhone().toString() %></td>
      </tr>

      <tr>
        <td>가게등록번호</td>
        <td><%=sDto.getNum().toString()%></td>
      </tr>
      <tr>
        <td>가게이름</td>
        <td><%=sDto.getShopName().toString() %></td>
      </tr>
      <tr>
        <td>가게구분</td>
        <td><%=sDto.getVal().toString()%></td>
      </tr>
       <tr>
        <td>가게주소</td>
        <td><%=sDto.getAdress()%></td>
      </tr>
    </tbody>
  </table>
  <%} %>
  
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