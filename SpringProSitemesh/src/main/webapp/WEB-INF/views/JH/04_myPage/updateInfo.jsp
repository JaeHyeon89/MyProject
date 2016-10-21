<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="goUpdate(1)">개인 정보 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(2)">비밀번호 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(3)">장르/태그 등록 및 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(4)">회원 탈퇴</button>
</div>

   
 
<div class="tab-content">
	<div id="home" class="tab-pane fade in active">
		<h3>개인 정보 수정</h3>
<!-- 	<form name="frmUpdateInfo" method="post"> -->
	<table border="1">
		<tr>
		    <th>아 이 디</th>
		    <td>
		    	<input type="text" readonly="readonly" value="${ nowLogon.id }" name="id" id="idId" />
		    </td>
		</tr>
		<tr>
		    <th>닉 네 임</th>
		    <td>
		    	<input type="text" value="${ nowLogon.nickName }" id="idNickName"
		    		onkeyup="nickUpdate()" name="nickName" />
		    	<button id="test">중복확인</button>
		    	<div id="preView" style="display: ">
					<div id="preViewList"></div>
				</div>
		    </td>
		</tr>
		<tr>
		    <th>휴 대 폰</th>
		    <td>
		    	<input type="text" value="${ nowLogon.phone }" name="phone" id="phone1" />
		    	<input type="button" value="재인증하기" id="phoneCheck1" />
		    </td>
		    
		</tr>
		<tr>
		  	<td colspan="2">
		  		<input type="button" onclick="updateInfo()" value="수정하기" />
		  	</td> 
		</tr>
	</table>
<!-- 	</form> -->




	</div>
	
</div>


<div id= "modalA" class="modal fade" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>


<script type="text/javascript">
	var check = true;
	var preView;
	var preViewList;
	
	
	$(function(){
		$("#phoneCheck1").click(function(){
			$("#modalA").modal({remote : '/springPro/popup/phoneChargeForm'});
		});
	})
	$('body').on('hidden.bs.modal', '.modal', function () {
		$(this).removeData('bs.modal');
	});
	
	
	function nickUpdate(){
		check = false;
		preView = document.getElementById("preView");
		preView.style.display = "";
		preViewList = document.getElementById("preViewList");
		preViewList.innerHTML = "닉네임 중복확인을 해주세요.";
	}
	
	
	
	$("#test").click(
		function() {
			var aa = $("#idNickName").val();
			$.ajax({
				type : "POST",
				url : "nickCheck",
				data : {nickName : aa},
				success : function(data){
					alert(data);
					if(data != null){
						check = true;
						alert("사용 가능한 닉네임입니다.");
						document.getElementById("idNickName").value = aa;
						preViewList.innerHTML = "사용가능하답니다.";
					}else{
						alert("이미 사용중인 닉네임입니다.")
						preViewList.innerHTML = "이미 중복된 닉네임이 있습니다.";
					}
				}
			});
		}
	);	
	
	function updateInfo(){
		
		if(check == true){
			alert("ㄱㄱㄱ");
			$.ajax({
				type : "POST",
				url : "goUpdate",
				data : {id : $("#idId").val(),
						nickName : $("#idNickName").val(),
						phone : $("#phone1").val()
						},
				success : function(data){
					if(data != null){
						alert(data);
						location.href="/springPro/home";
					}else{
						
						alert("회원 정보 수정 실패")
					}
				},
				error : function(request,status,error){
					alert("에러 발생!!!");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					location.href = "/springPro/home";
				}		
			});
		}else {
			alert("닉네임 중복검사 해라");
			return;
		}
	}

</script>









