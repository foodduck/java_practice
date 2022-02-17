<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet"href="./css/reset.css">
    <link rel="stylesheet"href="./css/main.css">
    <link rel="stylesheet"href="./css/common.css">
<title>회원가입</title>
<style>

.frm {position:relative; text-align:center;}
.datalist {border: 1px solid gray; margin:0px; padding: 10px;}
.inputs {font-size:15pt;}
.indata { border:2px solid gray; border-radius:20px; text-indent:10px; margin:3px; padding:5px;}
.pushdata { border:2px solid gray; border-radius:20px; margin:3px; padding:5px; width:120px;}
.pushdata:hover {color:white; background-color: gray;}
#odd {background-color:#c8dbdb;}
#even {background-color:#f2f7f7;}
</style>
</head>
<body>
<%@ include file ="header.jsp"%>
	
	<h2 style="text-align:center; margin:50px">회원가입</h2>
	<form action="joinPro.jsp" class="frm" method="post" name="joinform" onsubmit="return joinCheck(this)">
	<div class="datalist" id="odd">
	<label for="m_id" class="inputs">아이디 </label>
	<input type="text" id="m_id" name="m_id" class="indata" placeholder="ID" autofocus required>
	<input type="button" value="중복확인" class="pushdata" onclick="idCheck()">
	<input type="hidden" name="passbtn1" id="passbtn1">
	</div>
	<div class="datalist" id="even">
	<label for="m_pw" class="inputs">비밀번호 </label>
	<input type="password" id="m_pw" name="m_pw" class="indata" pattern="[a-zA-Z-0-9]" placeholder="영문, 숫자를 포함할 것" required>
	</div>
	<div class="datalist" id="odd">
	<label for="m_pw2" class="inputs">비밀번호 확인</label>
	<input type="password" id="m_pw2" name="m_pw2" class="indata" pattern="[a-zA-Z-0-9]" placeholder="영문, 숫자를 포함할 것" required>
	</div>
	<div class="datalist" id="even">
	<label for="m_name" class="inputs">이름입력 </label>
	<input type="text" id="m_name" name="m_name"  class="indata" placeholder="홍길동" required>
	</div>
	<div class="datalist" id="odd">
	<label for ="m_email" class="inputs">이메일 </label>
	<input type="text" id="m_email" name="m_email" class="indata" pattern="\w+@\w+\.\w+" required>
	<input type="button" value="중복확인" class="pushdata" onclick="emailCheck()">
	<input type="hidden" name="passbtn2" id="passbtn2">
	</div>
	<div class="datalist" id="even">
	<label for ="m_question" class="inputs">비밀번호를 찾기 위한 질문을 정하세요.</label>
	<input type ="text" id="m_question" name ="m_question" class="indata" pattern="w{1-100}" required>
	</div>
	<div class="datalist" id="odd">
	<label for ="m_answer" class="inputs">질문의 답을 정하세요.</label>
	<input type ="text" id="m_answer" name ="m_answer" class="indata" pattern="w{1-100}" required>
	</div>
	<div class="datalist" id="even">
	<label for="zipcode" class="inputs">우편번호</label>
	<input type="text" name="address1" id="address1"  class="indata"/>
	<input type="button" value="주소찾기" onclick="findAddr()" class="pushdata"/>
	</div>
	<div class="datalist" id="odd">
	<label for ="address1" class="inputs">주소</label>
	<input type ="text" name="address2"	id="address2"  class="indata"/>
	</div>
	<div class="datalist" id="even">
	<button type="submit" name="next" value="next" class="pushdata">다음으로</button>
	</div>
	</form>
	<!-- 회원가입시 바뀐 형식의 주소 및 우편번호 취급  처리 스크립트 -->
	<script>
	//다음카카오의 주소 API 이용
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("address1").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("address1").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
	<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function idCheck() { //열 페이지, 페이지명, 기타속성
		window.open("idCheckForm.jsp","idwin","width:400, height:620")
	}
	function emailCheck() {
		window.open("emailCheckForm.jsp","emailwin","width:400, height:620")
	}
	function joinCheck(f) {
		if (f.passbtn1.value!="yes") {
			alert("아이디 중복 검사를 해주세요");
			return false;
		}
		if(f.m_pw.value!=f.m_pw2.value) {
			alert("비밀번호와 비밀번호 확인을 일치시키세요")
			return false;
		}
		if (f.passbtn2.value!="yes") {
			alert("이메일 중복 검사를 해주세요");
			return false;
		}
	}

	</script>
<%@ include file ="footer.jsp"%>
</body>
</html>