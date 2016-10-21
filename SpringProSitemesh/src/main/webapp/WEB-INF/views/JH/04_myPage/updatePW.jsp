<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="goUpdate(1)">개인 정보 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(2)">비밀번호 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(3)">장르/태그 등록 및 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(4)">회원 탈퇴</button>
</div>

<h3>비밀 번호 수정</h3>

<form name="testForm">
<input type="hidden" value="${ nowLogon.id }" name="id" />
<table border="1">
	<tr>
		<th>현재 비밀번호</th>
		<td>
			<input type="password" name="pw" id="pw" />
		</td>
	</tr>
	<tr>
		<th>변경할 비밀번호</th>
		<td>
			<input type="password" name="updatePw" id="pw2" />
		</td>
	</tr>
	<tr>
		<th>변경할 비밀번호 재입력</th>
		<td>
			<input type="password" name="updatePwCheck" id="pw3" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="goUpdate" >수정하기</button>
		</td>
	</tr>
</table>
</form>


<script type="text/javascript">
	$("#goUpdate").click(function(){
		var frm = document.testForm;
		var oldPw = document.getElementById("pw").value;
		var pw = document.getElementById("pw2").value;
		var pwC = document.getElementById("pw3").value;
		
		if(oldPw == null || oldPw == ""){
			alert("현재 비밀번호 입력 좀 해");
			return;
		}
		
		if(pw != pwC){
			alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			alert(pw);
			alert(pwC);
			return;
		}
		
		frm.action = "updatePW";
		frm.method = "post";
		frm.submit();
	});

</script>




