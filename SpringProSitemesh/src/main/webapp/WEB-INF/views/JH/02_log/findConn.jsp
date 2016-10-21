<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<div align="center">
	<div>
	<c:choose>
		<c:when test="${ findMsg != null }">
			<script type="text/javascript">
				alert("${findMsg}");			
				location.href = "/springPro/home";
			</script>
		</c:when>
		<c:when test="${ findID == '-1' }">
			<p>${findID }입력하신 정보로 가입된 아이디가 없습니다.</p><br>
			<a href="/springPro/JH/01_reg/regForm"><button>회원가입하기</button></a>
		</c:when>
		<c:when test="${ findID != '-1' }">
			<p>회원님의 아이디는 <strong>${findID }</strong>입니다.</p>
			<a href="/springPro/JH/02_log/login"><button>로그인 하기</button></a>
		</c:when>
		<c:when test="${ findPW == '-1' }">
			<p>입력하신 정보가 일치하지 않습니다. 다시 시도해주세요</p>
			<a href="/springPro/JH/02_log/findId"><button>아이디 찾기</button></a>
			<a href="/springPro/JH/02_log/findPw"><button>비밀번호 찾기</button></a>
		</c:when>
		<c:when test="${ findPW != '-1' }">
			<h3>개인 정보 보호를 위해 비밀번호를 재설정 해주세요</h3>
			<div align="center" style="border-top: 2px solid black; width: 70%"> 
			<br>
			<h4><strong>비밀번호 재설정</strong></h4>
			<br>
			<form name="pwChangeForm" onsubmit="return false;" method="post">
				<input type="hidden" value="${ findPW.num }" name="num">
				<table class="table" style="text-align: center; width: 60%">
				<tr>
					<th>바꿀 비밀번호</th>
					<td>
						<input type="password" maxlength="15" name="pw" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" maxlength="15" name="pwCheck" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="변경하기" onclick="goPw()" />
					</td>
				</tr>
				
				</table>
			</form>
			</div>
		</c:when>
		<c:otherwise>
			<h2>알 수 없는 오류 발생! 다시 시도해주세요.</h2>
		</c:otherwise>
		</c:choose>
	</div>
</div>



<script>

function goPw(){
	var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
	var frm = document.pwChangeForm;
	var pw = frm.pw.value;
	var pwch = frm.pwCheck.value;
	
	if (!pw.match(reg_pwd)){ 
		
		if(pw.search(/\s/) != -1){

			alert("비밀번호는 공백없이 입력해주세요.");

			return;
		}
		 alert('비밀번호는 영문,숫자를 혼합하여 6~20자 이내의 조합으로 이루어져야합니다.');    

		 frm.pw.value = "";
		 frm.pwCheck.value = "";
		 frm.pw.focus(); 
		 return;

	}else if(pw != pwch){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		
		return;
	}
	
	frm.action = "/springPro/JH/02_log/pwchange";
	frm.method = "post";
	frm.submit();
	
}



</script>








