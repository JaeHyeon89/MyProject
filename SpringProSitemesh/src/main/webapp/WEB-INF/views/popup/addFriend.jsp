<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
      <div class="modal-header" id="friendModal">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">친구 추가</h4>
      </div>
      <div class="modal-body">
        <p>친구를 검색해보렴</p>
        <select id="searchType">
        	<option value="id">아이디</option>
        	<option value="nick">닉네임</option>
        </select>
        <input type="text" id="friendName" />
        <button type="button" id="searchFriend">검색</button><br>
        <div id="check" style="display:none">
	        <div id="idMsg"></div>
	        <div id="qq2" style="display : none">
	        	
				<button type="button" id= "addFri">친구 추가하기</button>        
	        
	        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
<script type="text/javascript">
var friendnum;
$("#searchFriend").click(
		function() {
			var check = document.getElementById("check");
			var serConn = document.getElementById("qq2");
			var idMsg = document.getElementById("idMsg");
			
			serConn.style.display = "none";
			check.style.display = "none";
			var searchType = $("#searchType").val();
			alert(searchType);
			
			var searchName = $("#friendName").val();
			$.ajax({
				type : "POST",
				url : "friendSearch",
				data : {searchName : searchName,
						searchType : searchType
						},
				dataType: 'json',
				success : function(data){
					alert(data);
					check.style.display = "block";
					var type;
					if(searchType == "id"){
						type = "ID가 ";
					}else if(searchType == "nick"){
						type = "닉네임이 ";
					}
					if(data != null){
						friendnum = data.num;
						serConn.style.display = "block";
						idMsg.innerHTML = type + searchName + " 인 회원이 존재합니다.<br> 친구추가 하시겠습니까?";
					}else {
						idMsg.innerHTML = type + searchName + " 인 회원이 존재하지 않습니다.";
					}
				},
				error : function(request,status,error){
					alert("에러 발생!!!");
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	);	
	
$("#addFri").click(function() {
	$.ajax({
		type : "POST",
		url : "friendAdd",
		data : {friendnum : friendnum},
		success : function(data){
			alert(data);
			
			if(data == "true"){
				alert("친구 추가가 완료되었습니다.");
				location.href = "myFriend";
			}else {
				alert("이미 친구목록에 있는 회원입니다.");
			}
		},
		error : function(request,status,error){
			alert("에러 발생!!!");
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});

</script>














