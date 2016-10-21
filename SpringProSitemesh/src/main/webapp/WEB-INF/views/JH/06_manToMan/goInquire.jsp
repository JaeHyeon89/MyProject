<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function goInq(){
	var category = $("#categ option:selected").val();
	alert(category);
	if(category == "0"){
		alert("분류를 선택하세요.");
		return;
	}else {
		var frm = document.inqForm;
		
		frm.action = "/springPro/JH/06_manToMan/goInquire";
		frm.method = "post";
		frm.submit();
		
	}
}


</script>




<div align="center" style="padding: 10px 10px 10px 10px;">    

<form role="form" name="inqForm" onsubmit="return false;" method="post">
<table class="table" style="width: 80%">
	<tr>
		<th>문의유형</th>
		<td>
			<select id="categ" class="form-control" name="category" style="width : 20%"> 
				<option value="0">선택</option>
				<option>계정/로그인</option>
				<option>결제/환불</option>
				<option>재생/다운</option>
				<option>기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제 목</th>
		<td>
			<input type="text" name="title">
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td>
			<textarea rows="10" cols="40" name="content" style="resize : none"></textarea>
		</td>
	</tr>

	<tr>
		<td colspan="2">
		<input type="button" onclick="goInq()" value="등록하기">
		</td>
	</tr>
</table>
</form>
</div>


