<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "test.model.TestProductVO" %>    
<%@ page import = "test.biz.TestProductDAO" %>   
<%@ page import = "test.view.GetTestProductListCtrl" %>    
    
<%-- <%
	TestProductVO testProduct = (TestProductVO) request.getAttribute("TestProduct");
%>   --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

<div class = "container">
	<h2>제품 추가</h2>
	<form action="../InsertTestProductCtrl" method="post" name="pfrm" onsubmit="return pCheck(this)">
	<table class = "table">
		<tr>
			<th class="item1">제품코드</th>
			<td class="item1">
				<input type="text" name="pcode" id="pcode" value="pcode">
				<input type="button" value="제품코드 체크" class="btn" onclick="codeCheck()">
				<input type="hidden" value="" name="codeck" id="codeck">
			</td>
		</tr>
		<tr>
			<th class="item2">제품명</th>
			<td class="item2"><input type="text" name="pname" id="pname" value="pname" /></td>
		</tr>
		<tr>
			<th class="item3">가격</th>
			<td class="item3"><input type="number" name="price" id="price" value="price" /></td>
		</tr>
		<tr>
			<th class="item4">규격</th>
			<td class="item4"><input type="text" name="standard" id="standard" value="standard" /></td>
		</tr>
		<tr>
			<th class="item5">설명</th>
			<td class="item5"><textarea name="con" id="con" cols="100" rows="20"></textarea></td>
		</tr>
		
	</table>
</form>
	<!-- 버튼 그룹 -->
	<div class="btn-group">
	<input type="submit" class ="btn btn-default" value="제품 등록"/>
	<a href="GetTestProductListCtrl" class="btn btn-default">제품 목록</a>
	</div>
</div>
<%@ include file="../footer.jsp" %>
<script>
	function imgCheck() {
		window.open("../imgCheckForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function codeCheck() {
		window.open("../codeCheckForm.jsp", "codeuploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 혹은 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
</script>
</body>
</html>