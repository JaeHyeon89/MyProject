<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
	
	<br>
	<form name="regForm" >
		
		<div align="center" style="font-size: 50px; font-weight: bolder; color: #0000CC;">회&nbsp;원&nbsp;가&nbsp;입</div>
	 	<br><br>
	 	
	 	<div class="row">
	 		<div class="col-sm-12" style="border: 1px solid #CCCCCC;">
	 			<br><br>
	 			<div class="row">
	 				<div class="col-sm-4" align="right">
	 					<div style="font-size: 25px; display: inline;">아이디(이메일)</div>
	 				</div>
	 				<div class="col-sm-4" align="center">
	 					<input type="text"  id="id1" name="id" class="form-control" style="width: 350px; display: inline;"
							readonly="readonly" maxlength="10" size="10"/>
					</div>
					<div class="col-sm-4">
						<input type="button" class="btn btn-default" value="아이디 입력" id="idCheck"/>
					</div>
					<br><br><br>	
					<div class="col-sm-4" align="right">
						<div style="font-size: 25px; display: inline;">비밀번호</div>
					</div>
					<div class="col-sm-4" align="center">
						<input type="password" name="pw"  class="form-control" style="width: 350px; display: inline;" 
							 maxlength="10" size="10" />
						<form:errors path="pw"/>
					</div>
					<br><br><br>
					<div class="col-sm-4" align="right">
						<div style="font-size: 25px; display: inline;">비밀번호 확인</div>
					</div>
					<div class="col-sm-4" align="center">
						<input type="password" name="pwcheck" class="form-control" style="width: 350px; display: inline;"
							maxlength="10" size="10">
					</div>
					<br><br><br>
					<div class="col-sm-4" align="right">
						<div style="font-size: 25px; display: inline;">휴대폰</div>
					</div>
					<div class="col-sm-4" align="center">
						<input type="text" readonly="readonly" id="phone1" name="phone"
							class="form-control" style="width: 350px; display: inline;"
							 maxlength="10" size="10" />
					</div>
					<div class="col-sm-4">
						<input type="button" class="btn btn-default" value="인증하기" id="phoneCheck" />
					</div>
					<br><br><br>
					<div class="col-sm-12" align="center">
						<button type="button" class="btn" style="width: 200px; height: 50px; font-size: 20px; font-weight: bold;
							background-color: #FF3333; color: white;" onclick="goReg()">가입 완료</button>
					</div>
					<br><br><br><br>
	 			</div>
	 		</div>
	 	</div>
	</form>


<div id= "modalA" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>

<script type="text/javascript">

	$(function(){
		$("#idCheck").click(function(){
			$("#modalA").modal({remote : '/springPro/popup/idCheck'});
		});
	})
	
	$(function(){
		$("#phoneCheck").click(function(){
			$("#modalA").modal({remote : '/springPro/popup/phoneChargeForm'});
		});
	})
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});
	

	function goReg(){
		var frm = document.regForm;
		var id = frm.id.value;
		var pw = frm.pw.value;
		var pwch = frm.pwcheck.value;
		var ph = frm.phone.value;
		var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	
		if(id == "" || id == null){
			alert("아이디를 입력해주세요");
			return;
		}else if (!pw.match(reg_pwd)){ 
			
			if(pw.search(/\s/) != -1){

				alert("비밀번호는 공백없이 입력해주세요.");

				return false;
			}
			 alert('비밀번호는 영문,숫자를 혼합하여 6~20자 이내의 조합으로 이루어져야합니다.');    

			 frm.pw.value = "";
			 frm.pwcheck.value = "";
			 frm.pw.focus(); 
			 return;
		
		}else if(pw != pwch){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			
			return;
		}else if(ph==null || ph==""){
			alert("휴대폰 인증을 해주세요");
			return;
		}
		
		frm.action = "regForm";
		frm.method = "post";
		frm.submit();
	}
	
	
 </script> 










