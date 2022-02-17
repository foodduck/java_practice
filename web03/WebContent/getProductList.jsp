<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project1.model.ProductVO" %>
<% 
ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("prolist");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
<style>
	.tit { text-align:center; }
	.lst { list-style:none; clear:both; width:750px; margin:0 auto; font-size:8pt;}
	.btn_wrap .in_btn:hover { background-color:black; font-color:white; }
	.lst li { float:left; width:100px; line-height:36px; line-height:12px; padding: 2px;}
	.lst.lh { border-top:3px solid #333; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn {width: 150px; font-color:white; }
	#ck {width:50px; height:50px;}
	
</style>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
	<h2 class="tit">제품 목록</h2>
	<ul class="lst lh">
		<li class="item1">제품아이디</li>
		<li class="item2">제품명</li>
		<li class="item3">제품설명</li>
		<li class="item4">제품규격</li>
		<li class="item5">가격</li>
		<li class="item6">제품이미지</li>
		<li class="item7">편집</li>
	</ul>
	<form action="DeleteProductCtrl" method="post" name="delForm" onsubmit="return frm_submit(this)">
	<%	
		for(int i=0;i<productList.size();i++){
			ProductVO pd = productList.get(i);
	%>	
		<ul class="lst">
			<li class="item1"><a href="EditProductFormCtrl?id=<%=pd.getId() %>"><%=pd.getId() %></a></li>
			<li class="item3"><%=pd.getName() %></li>
			<li class="item2"><%=pd.getDescription() %></li>
			<li class="item4"><%=pd.getStandard() %></li>
			<li class="item5"><%=pd.getPrice() %></li>
			<li class="item6"><img src="<%=pd.getImg() %>"><li>
				<input type="checkbox"  name="ck"  id="ck<%=i %>"  class="ck_item" value="<%=pd.getId() %>"/>
			</li>
		</ul>
	<%
		}
	%>
	    <hr />
		<div class="btn_wrap">	
			<button type="submit" class="in_btn" onclick="">삭제</button>
			<button type="reset" class="in_btn" onclick="">취소</button>
		</div>	
	</form>
	<script>
	function frm_submit(f){
		var sel = 'input[name="ck"]:checked';
		var item = document.querySelectorAll(sel);
		if(item.length==0) {
			alert("삭제할 요소를 선택하세요.");
			return false;
		} else {
			var qt = confirm("정말로 삭제하겠습니까?");
			if(qt) {
				f.submit();
			} else {
				return false;
			}
		}
	}
	</script>
	<%@ include file="footer.jsp" %>
</body>
</html>