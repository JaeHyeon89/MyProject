<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
      <div class="modal-header" id="friendModal">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">앨범 추가</h4>
      </div>
      <div class="modal-body">
        <p>곡이 담길 앨범을 선택해주세요</p>
       	<table class="table table-hover">
       		<tr>
       			<th>앨범 명</th>
       			<th>수록곡 수</th>
       			<th>선택</th>
       		</tr>
       		<tr>
       			<td id="idAlbumName1">
 					    			
       			</td>
       			<td id="idAlbumLength1">
       			
       			</td>
       			<td>
       				<button class="btn-info" onclick="albumPut(1)" >이 앨범에 담기</button>
       			</td>
       		</tr>
       		<tr>
       			<td id="idAlbumName2">
       			
       			</td>
       			<td id="idAlbumLength2">
       			
       			</td>
       			<td>
       				<button class="btn-info" onclick="albumPut(2)" >이 앨범에 담기</button>
       			</td>
       		</tr>
       		<tr>
       			<td id="idAlbumName3">
       			
       			</td>
       			<td id="idAlbumLength3">
       			
       			</td>
       			<td>
       				<button class="btn-info" onclick="albumPut(3)">이 앨범에 담기</button>
       			</td>
       		</tr>
       	</table> 
        
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
<script type="text/javascript">

$.ajax({
	type : "POST",
	url : "/springPro/JH/04_myPage/myAlbum/albumCall",
		dataType : 'json', 
	success : function(data){
	$('#idAlbumName1').append(data.albumBean.albumName1);
	$('#idAlbumLength1').append(data.albumLength1);
	$('#idAlbumName2').append(data.albumBean.albumName2);
	$('#idAlbumLength2').append(data.albumLength2);
	$('#idAlbumName3').append(data.albumBean.albumName3);
	$('#idAlbumLength3').append(data.albumLength3);
	},
	error : function(request,status,error){
		alert("에러 발생!!!");
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		location.href = "/springPro/kwang/total";
	}
});
// 	$(document).ready(function(){
// 		alert("dsd");
// 		$.ajax({
// 				type : "POST",
// 				url : "/springPro/JH/04_myPage/myAlbum/albumCall",
// 	 			dataType : 'json', 
// 				success : function(data){
// 				alert(data);
// 				$('#idAlbumName1').append(data.albumBean.albumName1);
// 				$('#idAlbumLength1').append(data.albumLength1);
// 				$('#idAlbumName2').append(data.albumBean.albumName2);
// 				$('#idAlbumLength2').append(data.albumLength2);
// 				$('#idAlbumName3').append(data.albumBean.albumName3);
// 				$('#idAlbumLength3').append(data.albumLength3);
			
// 				},
// 				error : function(request,status,error){
// 					alert("에러 발생!!!");
// 					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 					location.href = "/springPro/kwang/total";
// 				}
// 			});
// 	})
	
	function albumPut(num){
		var num = num;
		var addNum = ${param.addNum};
		var values = $(":checked").map(function () {
						  return this.value;
						}).get();
		if(addNum == 0){ // 여러개 담기
// 			alert("배열이네? " + values);
			if(values == "" || values==null){
				alert("곡을 선택해주세요.");
				$('#modalC').modal('hide');
				return;
			}		
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				type : "POST",
				url : "/springPro/JH/04_myPage/myAlbum/arrayAddAlbum",
				data : {addArray : values,
						albumNum : num},
				success : function(data){
					alert(data);
			
					if(data > 0){
						alert("곡들이 앨범에 추가되었습니다.");
						$('#modalC').modal('hide');;
					}else if(data == "already"){
						alert("앨범에 이미 곡이 담겨있습니다.");
						$('#modalC').modal('hide');
					}else {
						alert("뭔가 문제가 생겼음 : " + data);
						$('#modalC').modal('hide');
					}
				},
				error : function(request,status,error){
					alert("에러 발생!!!");
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			return;
		}else {
			$.ajax({
				type : "POST",
				url : "/springPro/JH/04_myPage/myAlbum/addAlbum",
				data : {addNum : addNum,
						albumNum : num},
				success : function(data){
					alert(data);
			
					if(data == "addOk"){
						alert("곡이 앨범에 추가되었습니다.");
						$('#modalC').modal('hide');;
					}else if(data == "already"){
						alert("앨범에 이미 곡이 담겨있습니다.");
						$('#modalC').modal('hide');
					}else {
						alert("뭔가 문제가 생겼음 : " + data);
						$('#modalC').modal('hide');
					}
				},
				error : function(request,status,error){
					alert("에러 발생!!!");
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			
			});
		}//else 끝
	}
	
</script>














