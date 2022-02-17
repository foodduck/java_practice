<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0, userscalable=no"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
        <section class="content">
			<h2 class="tit">로그인</h2>
			<form action="LoginCtrl" method="post" class="frm" id="frm1">
				<fieldset>
					<input type="text" class="indata" id="mid" name="mid" placeholder="아이디 입력" autofocus required /><br><br>
					<input type="password" class="indata" id="pw" name="pw" placeholder="비밀번호 입력" required /><br>
					<br /><br />
					
					<div class="btn-group">
						<input type="submit" class="btn btn-default" value="로그인"/>
						<input type="reset" class="btn btn-default" value="취소"/>
		
					</div>
				</fieldset>
			</form>
        </section>
    </div>
</body>
</html>