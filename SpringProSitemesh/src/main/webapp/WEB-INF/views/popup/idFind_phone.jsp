<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        
<style type="text/css">
	th{
		background-color: #EEEEEE;
	}
</style>
	
      <div class="modal-header" style="background-color: #CCFFFF" align="center">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <div style="font-size: 30px; font-weight: bold; " class="modal-title">휴대폰 인증</div>
      </div>
      <div class="modal-body">
<!--         <form name="phoneFrm"> -->
		<div id="abc" >
		<table class="table" style="text-align: center;">
			<tr>
				<th>핸드폰 번호 입력</th>
				<td>
					<select id="tong">
						<option value="skt">skt</option>
						<option value="kt">kt</option>
						<option value="lgt">lgt</option>
					</select>
					&nbsp;
					<select id="num1">
						<option value="010">010</option>
					</select>
					&nbsp;
					<input type="number" id="num2" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)"/>
					&nbsp;
					<input type="number" id="num3" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)"/>
				</td>
			</tr>
			<tr>
				<th>이름 입력</th>
				<td align="center">
					<input type="text" id="name" class="form-control" style="width: 150px; font-size: 20px;"
								maxlength="10">
				</td>
			</tr>
			<tr>
				<th>주민번호 앞자리6자 입력</th>
				<td align="center">
				<input type="number" id="regNum" maxlength="5" style="width: 150px; font-size: 20px" 
					class="form-control" placeholder="예: 900101" onkeypress="maxLengthCheck(this)">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<br>
				<button id="goPCheck" class="btn" style="width: 200px; height: 50px; font-size: 20px; font-weight: bold;
					 background-color: red; color: white;">인증하기</button>
				</td>
			</tr>
		
		</table>
<!-- 		</form> -->
		</div>
     </div>
      <div id="phoneConn" style="display: none">
      	<form action="">
      		<input type="text" id="conn" />
      			<span id="rCnt"></span>
      		<input type="button" value="인증하기" id="certify" /> 
      	</form>
	 </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
 

<script type="text/javascript">

var cnt = 30;
var phoneNumber;
$("#goPCheck").click(
		function() {
			
			phoneNumber = $("#num1").val() + $("#num2").val() + $("#num3").val();
			
			$.ajax({
				type : "POST",
				url : "/springPro/JH/01_reg/phoneCheck",
				data : {num1 : $("#num1").val(),
						num2 : $("#num2").val(),
						num3 : $("#num3").val(),
						tong : $("#tong").val(),
						regNum : $("#regNum").val(),
						name : $("#name").val()
						},
				success : function(data){
					alert(data);
					
					if(data == "a"){
						var phoneConn = document.getElementById("phoneConn");
						var phoneSpan = document.getElementById("phoneSpan");
						var abc = document.getElementById("abc");
						phoneConn.style.display = "block";
						abc.style.display = "none";
						phoneSpan.innerHTML = "인증번호를 입력해주세요";
						$("#goCount").triggerHandler("click");
					}else{
						alert("사용자 정보가 일치하지 않습니다. 다시 시도해주세요.");
					}
				},
				error : function(request,status,error){
					alert("에러 발생!!");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					location.href = "/springPro/home";
				}
			});
		}
	);	
	

	
	$("#certify").click(function() {
		$.ajax({
			type : "POST",
			url : "/springPro/JH/01_reg/phoneCheck2",
			data : {conn : $("#conn").val()	},
			success : function(data){
				if(data != null){
					alert(phoneNumber);
					var frm = document.idFindForm;
					
					frm.action="/springPro/JH/02_log/idFind?phone="+phoneNumber;
					frm.method = "post";
					frm.submit();
				}else{
					alert("인증 정보가 일치하지 않습니다. 다시 시도해주세요.");
				}
			},
			error : function(request,status,error){
				alert("에러 발생!!");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				location.href = "/springPro/home";
			}
		});
	});
	

	function maxLengthCheck(object){
		   if (object.value.length > object.maxLength){
		    object.value = object.value.slice(0, object.maxLength);
		   }    
	}
</script>

