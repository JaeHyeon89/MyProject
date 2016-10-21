<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
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

<style type="text/css">
	th{
		background-color: #EEEEEE;
	}
</style>
	
	<br>
	<div align="left" style="font-size: 40px; font-weight: bolder; width: 100%; 
		border-radius: 0px 100px 100px 0px; background-color: #0088FF;">
		카드 결제
	</div>	
	<br><br>
	
	<div>
		
	</div>
	
	<form name="frm">
		<input type="hidden" name="cashAmount" value="${ cashAmount }">
		<input type="hidden" name="remainMusic" value="${ remainMusic }"/>
		<table class="table" style="text-align: center">
			<tr>
				<th>상품명</th>
				<td>
				<c:choose>
					<c:when test="${ cashAmount!=null }">
						${ cashAmount } 캐시 충전
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ remainMusic==50 }">
								노래 30일 무제한 듣기, 50곡 다운로드 무료
							</c:when>
							<c:otherwise>
								노래 30일 무제한 듣기, 100곡 다운로드 무료
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>상품 금액</th>
				<td>
				<c:choose>
					<c:when test="${ cashAmount!=null }">
						${ cashAmount } 원
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ remainMusic==50 }">
								5,000원
							</c:when>
							<c:otherwise>
								10,000원
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<td>
			</tr>
			<tr>
				<th>카드 번호 입력</th>
				<td>
					<select name="bankName">
						<option value="농협">농협</option>
						<option value="신한">신한</option>
						<option value="국민">국민</option>
					</select>
					&nbsp;
					<input type="number" name="num1" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)">
					&nbsp;
					<input type="number" name="num2" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)">
					&nbsp;
					<input type="number" name="num3" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)">
					&nbsp;
					<input type="number" name="num4" maxlength="3" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)">
				</td>
			</tr>
			<tr>
				<th>cvn비밀번호</th>
				<td>
				<input type="number" name="cvnNum" maxlength="2" class="form-control"
						style="width: 80px; display: inline; font-size: 17px;" onkeypress="maxLengthCheck(this)">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="checkbox" name="check" value="check" >이용약관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default" onclick="goTerms(3)">전문보기</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" class="btn" style="width: 200px; height: 50px; font-size: 20px; font-weight: bold;
					 background-color: red; color: white;" onclick="goCharge()">충전하기</button>
				</td>
			</tr>
		
		</table>
	</form>

	
	<script type="text/javascript">
		
		msg="${ msg }";
				
		if(msg!=""){
			alert(msg);
		}
		
		function goCharge(){
			
			var aa = document.frm;
			
			var num1=aa.num1.value.trim();
			var num2=aa.num2.value.trim();
			var num3=aa.num3.value.trim();
			var num4=aa.num4.value.trim();
			var cvnNum=aa.cvnNum.value.trim();
			
			if(num1=="" || num2=="" || num3=="" || num4=="" || cvnNum==""){
				alert("정보를 입력하세요");
				return;
			}
			
			if($("input:checkbox[name='check']").is(":checked")){
				var cashAmount= aa.cashAmount.value;
				var remainMusic=aa.remainMusic.value;
				
				if(cashAmount!=""){
					frm.action="cashCardCharge";
					
				}else if(remainMusic!=""){
					frm.action="tiCardCharge";
				}
				
				frm.method="post";
				frm.submit();
			}else{
				alert("이용약관에 동의를 체크해 주세요");
				return;
			}
		}
		
		function maxLengthCheck(object){
			   if (object.value.length > object.maxLength){
			    object.value = object.value.slice(0, object.maxLength);
			   }    
		}
		
		function goTerms(num){	//이용약관 보기
			window.open("/springPro/goTerms?num="+num, "goTerms","width=700, height=600");
		}
		
	</script>
	
	
	
	