<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">
function goCharge(){
	
	var way=frm.way.value;
	
	frm.method="post";
	
	if(way=="phone"){
		alert("휴대폰 결제");
		var url="phoneChargeForm";
		var title="phoneChargeForm"
		window.open("", title, "width=500, height=500");
		frm.target=title
		frm.action=url;
		frm.submit();
		
	}else{
		alert("카드결제");
		var url="cardChargeForm";
		var title="cardChargeForm"
		window.open("", title, "width=500, height=500");
		frm.target=title
		frm.action=url;
		frm.submit();
	}
	
	
}
	

</script>

	<br><br><br><br><br><br>
	<h2>이용권 구매 </h2>
	
	<form name="frm">
		<table border="1" style="text-align: center;">
			<tr>
				<th>구매하실 이용권을 선택하세요</th>
				<td>
					<input type="radio" name="remainMusic" value="50" checked="checked">노래 30일 무제한듣기, 50곡 다운로드 무료 5000원<br>
					<input type="radio" name="remainMusic" value="100">노래 30일 무제한듣기, 100곡 다운로드 무료 10000원
				</td>
			</tr>
			<tr>
				<th>충전 방식</th>
				<td>
					<input type="radio" name="way" value="phone" checked="checked">휴대폰 결제
					<input type="radio" name="way" value="card">카드 결제
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="충전하기" onclick="goCharge()">
				</td>
			</tr>
		
		</table>
	</form>
	
	
	
