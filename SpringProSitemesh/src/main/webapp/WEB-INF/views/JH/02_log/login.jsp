<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	
	<div align="center">
	<h2>로그인 하기</h2>
	<form name="logForm" method="post">
	<div style="width: 750px; height: 150px; border-top: 2px solid black;">
	<br><br>
	
	<div style=" display: inline-block;">
		<div class="form-group" style="width : 380px;">
		  <label for="usr">아이디 :&nbsp;&nbsp;&nbsp;&nbsp;</label>
		  <input type="text" class="form-control" id="usr" name="id" style="width : 80%; display: inline-block; " />
		</div>
		<div class="form-group" style="width : 380px; ">
		  <label for="pwd">패스워드 :&nbsp;&nbsp;&nbsp;</label>
		  <input type="password" class="form-control" id="pwd" name="pw" style="width : 80%; display: inline-block; " />
		</div>
	</div>
		<a onclick="goLogin()"><img src="/springPro/resources/img/login2.png" 
		style= "float: right ; width: 200px; height: 100px; display: inline-block; border : 1px solid #CCCCFF" >
		</a>
	</div>
		</form>
	<div>
	<a href="/springPro/JH/02_log/findId"><button>아이디 찾기</button></a>
	<a href="/springPro/JH/02_log/findPw"><button>비밀번호 찾기</button></a>
	</div>
	
	
	</div>






<script>
	function goLogin(){
		var frm = document.logForm;
		
		var id = frm.id.value;
		var pw = frm.pw.value;
		
		if(id == "" || id == null){
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return;
		}
		
		if(pw == "" || pw == null){
			alert("비밀번호를 입력해주세요.");
			frm.pw.focus();
			return;
		}
		
		frm.action = "/springPro/JH/02_log/login";
		frm.method = "post";
		frm.submit();
	}

</script>







