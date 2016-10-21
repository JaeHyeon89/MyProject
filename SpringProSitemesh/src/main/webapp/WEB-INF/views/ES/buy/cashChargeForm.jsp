<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

	<script type="text/javascript">
		function goCharge(){
			var way=frm.way.value;
			
			frm.method="post";
			
			if(way=="phone"){
				var url="phoneChargeForm";
				var title="phoneChargeForm"
				window.open("", title, "width=500, height=500");
				frm.target=title;
				frm.action=url;
				frm.submit();
				
			}else{
				var url="cardChargeForm";
				var title="cardChargeForm"
				window.open("", title, "width=500, height=500");
				frm.target=title;
				frm.action=url;
				frm.submit();
			}
			
			
		}
		
	
	</script>
	

	<br><br><br><br><br><br>
	<h2>캐시충전 </h2>
	<br><br>
	
	캐시와 현금은 1대1 비율이며	<br>
	세스코 캐시로는 곡, 앨범을 구매할 수 있습니다. 
	
	<form name="frm">
		<table class="table">
			<tr>
				<th>캐시 구매 량</th>
				<td><label class="radio-inline">
					<input type="radio" name="cashAmount" value="5000" checked="checked">5천원</label>
					<label class="radio-inline"><input type="radio" name="cashAmount" value="10000">만원</label>
					<label class="radio-inline"><input type="radio" name="cashAmount" value="30000">3만원</label>
					<label class="radio-inline"><input type="radio" name="cashAmount" value="50000">5만원</label>
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
					<input type="button" value="충전하기" onclick="goCharge()"/>
				</td>
			</tr>
		</table>
	</form>