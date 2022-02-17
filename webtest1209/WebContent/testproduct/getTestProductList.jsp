<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "test.model.TestProductVO" %>    
<%@ page import = "test.biz.TestProductDAO" %>   
<%@ page import = "test.view.GetTestProductListCtrl" %>
    
    
<%
	ArrayList<TestProductVO> testProductList = (ArrayList<TestProductVO>) request.getAttribute("testProductList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%-- <%   
		String mid = (String) session.getAttribute("mid");
		if (mid=="admin") {
%>
			<%@ include file="../adminHeader.jsp" %>
<%
		} else {
			response.sendRedirect("../index.jsp");
		} 
%> --%>

	<div class="container">
	<h2>제품 목록</h2>

	<table class = "table">
		<tr>
			<th class="item1">번호</th>
			<th class="item2">상품코드</th>
			<th class="item3">상품명</th>
			<th class="item4">가격</th>
			<th class="item5">규격</th>
		</tr>
<%
		for(int i=0;i<testProductList.size();i++) {
			TestProductVO testProduct = testProductList.get(i);
			
%>
		<tr>
			<td class="item1"><%=testProduct.getIdx() %></td>
			<td class="item2"><%=testProduct.getPcode() %></td>
			<td class="item3"><%=testProduct.getPname() %></td>
			<td class="item4"><%=testProduct.getPrice() %></td>
			<td class="item5"><%=testProduct.getStandard() %></td>
			<td class="item6"><a href="DeleteTestProductCtrl?idx=<%=testProduct.getIdx() %>">삭제</a></td>
		</tr>
<%
		}
%>
	</table>
	<!-- 버튼 그룹 -->
	<div class="btn-group">
		<a href="insertTestProduct.jsp" class="btn btn-default">제품추가</a>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>