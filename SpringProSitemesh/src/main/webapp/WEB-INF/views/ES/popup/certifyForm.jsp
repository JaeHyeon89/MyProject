<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script src="/springPro/resources/js/external/jquery/jquery.js"></script>
<script src="/springPro/resources/js/jquery-ui.js"></script>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


	<script type="text/javascript">
		 var cnt = 30;
		 function countdown() {
		  if(cnt==0){
			  alert("인증시간이 지났습니다. 인증을 다시하세요.");
			  history.back();
		  }
		  document.getElementById("rCnt").innerHTML = cnt;
		  cnt--;
		 }
		 var s = setInterval(countdown,1000);  // 1초
		 
		 function goCharge(){
				var aa = document.frm;
				
				
				var cashAmount= aa.cashAmount.value;
				var remainMusic= aa.remainMusic.value;
				
				if(cashAmount!=""){
					frm.action="cashCertifyCom";
					
				}else if(remainMusic!=""){
					frm.action="tiCertifyCom";
				}
				
				frm.method="post";
				frm.submit();
				
			}
		 
		 

			function maxLengthCheck(object){
				   if (object.value.length > object.maxLength){
				    object.value = object.value.slice(0, object.maxLength);
				   }    
			}
		 
	</script>
	
	
<style type="text/css">
	th{
		background-color: #EEEEEE;
	}
</style>
	
	
	<br>
	<div align="left" style="font-size: 40px; font-weight: bolder; width: 100%; 
		border-radius: 0px 100px 100px 0px; background-color: #0088FF;">
		휴대폰 인증번호 입력
	</div>	
	<br><br>
	
	<form name="frm">
		<input type="hidden" name="cashAmount" value="${ cashAmount }">
		<input type="hidden" name="remainMusic" value="${ remainMusic }">
		<table class="table" style="text-align: center;">
			<tr>
				<th>인증 번호 입력</th>
				<td>
					<input type="number" maxlength="3" name="num" style="width: 80px; display: inline; font-size: 17px;"
					class="form-control" onkeypress="maxLengthCheck(this)">&nbsp;&nbsp;
					<span id="rCnt" style="color: red;"></span>초
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width: 200px; height: 50px; font-size: 20px; font-weight: bold;
					 background-color: red; color: white;" onclick="goCharge()">인증하기</button>
				</td>
			</tr>
		
		</table>
	</form>
