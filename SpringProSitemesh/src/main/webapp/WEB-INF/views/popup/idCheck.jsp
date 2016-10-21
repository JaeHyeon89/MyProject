<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
      <div class="modal-header" id="myModal">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">회원가입 - 아이디 입력</h4>
      </div>
      <div class="modal-body">
        <p>아이디 입력</p>
        <input type="text" id="idConn" />
        <button type="button" id="goIdCheck">중복확인</button><br>
        <div id="check" style="display:none">
	        <div id="idMsg"></div>
	        <div id="qq2" style="display : none">
				<button id="goId">사용하기</button>        
	        
	        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
 

<script type="text/javascript">
var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

$("#goIdCheck").click(
		function() {
			var tempId = $("#idConn").val();
			
			if (!tempId.match(regExp)){
				alert("아이디가 이메일 형식이 아닙니다.");
				return;
			}
			
			$.ajax({
				type : "POST",
				url : "idCheck",
				data : {id : tempId	},
				success : function(data){
					var check = document.getElementById("check");
					var idMsg = document.getElementById("idMsg");
					var idConn = document.getElementById("qq2");
					check.style.display = "block";
					
					if(data == "aa"){
						alert("사용 가능.");
						idConn.style.display = "block";
						idMsg.innerHTML = tempId + " (은)는 사용 가능한 아이디입니다.";
					}else{
						alert("이미 사용중인 아이디");
						idMsg.innerHTML = tempId + " (은)는 이미 사용중인 아이디입니다.";
					}
				},
				error : function(){
					alert("에러 발생!!!");
				}
			});
		}
	);	
	
$("#qq2").click(function() {
	var id = document.getElementById("id");
	document.getElementById("id1").value = $("#idConn").val();
	$('#modalA').modal('hide');
});



</script>










