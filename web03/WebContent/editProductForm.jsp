<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.project1.model.ProductVO" %>
<%
	ProductVO pdt = (ProductVO) request.getAttribute("pdt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<style>
	.tit { text-align:center; }
	.lst { list-style:none; clear:both; width:1050px; margin:0 auto; font-size:8pt;}
	.btn_wrap .in_btn:hover { background-color:black; font-color:white; }
	.lst li { float:left; width:100px; line-height:36px; line-height:12px; padding: 2px;}
	.lst.lh { border-top:3px solid #333; }
	.btn_wrap { width:220px; margin:20px auto; }
	.btn_wrap .in_btn {width: 150px; font-color:white; }
	#ck {width:50px; height:50px;}
</style>
<body>
<h2 class="tit">회원정보 수정</h2>
<form action ="EditProductCtrl" method="post" id ="frm" name="frm">
<table class="tb">
		<tbody>
			<tr>
				<th class="col_hd">
					<label for="id">아이디</label>
				</th>
				<td class="col_data">
					<input type="text" name="p_id" id="p_id" class="in_data" value="<%=pdt.getId() %>" readonly />
					<input type="button" value="제품코드 체크" class="in_btn" onclick="codeCheck()" />
					<input type="hidden" value="" name="codeck" id="codeck" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="name">제품명</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_name" name="p_name" class="in_data" value="<%=pdt.getName() %>" />
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="description">제품설명</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_description" name="p_description" class="in_data" value="<%=pdt.getDescription() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="standard">제품규격</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_standard" name="p_standard" class="in_data" value="<%=pdt.getStandard() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="price">가격</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_price" name="p_price" class="in_data" value="<%=pdt.getPrice() %>"/>
				</td>
			</tr>
			<tr>
				<th class="col_hd">
					<label for="img">이미지</label>
				</th>
				<td class="col_data">
					<input type="text" id="p_img" name="p_img" class="in_data" value="<%=pdt.getImg() %>"/>
					<input type="button" value="이미지 업로드 체크" class="in_btn" onclick="imgCheck()" />
					<input type="hidden" value="" name="imgck" id="imgck" />
				</td>
			</tr>
			
		</tbody>
	</table>
    <hr />
	<div class="btn_wrap">	
		<button type="submit" class="in_btn" onclick="">수정</button>
		<button type="reset" class="in_btn" onclick="">취소</button>
	</div>
	<script>
	function imgCheck() {
		window.open("imgUploadForm.jsp", "imguploadcheck", "width=300, height=300");
	}
	function codeCheck() {
		window.open("codeCheckForm.jsp", "codeuploadcheck", "width=300, height=300");
	}
	function pCheck(f) {
		if(f.codeck.value!="yes" || f.imgck.value!="yes"){
			alert("상품코드 혹은 이미지 체크가 되어 있지 않습니다.");
			return false;
		}
	}
	</script>		
</form>
</body>
</html>