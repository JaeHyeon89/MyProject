<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function goUpdate(num){
		
		if(num==1){
			location.href= "updateInfo";
		}else if(num==2){
			location.href= "updatePW";
		}else if(num==3){
			location.href= "userTag";
		}else if(num==4){
			location.href= "dropInfo";
		}else if(num==5){
			location.href= "myFriend";
		}else if(num==6){
			location.href= "myAlbum/go";
		}
	}

	
	
</script>  

<div class="menuBold" >
<div class="navbar navbar-fixed-top navbar">
	<div class="container-fluid"
		style="background-color: white; opacity: 0.7; height: 120px;
				border-bottom: 4px solid #DCEBFF;">
		
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-4">
				<a href="/springPro/"><img src="/springPro/resources/img/logo.png" class="img-rounded"  width="200" height="90px" /></a>
			</div>
			<div class="col-sm-5" style="display: inline-block; padding-top: 38px">
				<form name="frmSearch" onsubmit="return false;">
					<input type="search" maxlength="20" name="search" id="term" class="form-control" 
					style="border-radius: 100px 100px 100px 100px; display: inline; width: 400px;
							border: 3px solid red;"/>	
					<button type="submit" class="btn btn-danger btn-sm" onclick="goSearch()">
				      <span class="glyphicon glyphicon-search"></span>검색
			  		</button>
				</form>
			</div>
			<div class="col-sm-3" style="padding-top: 70px; padding-left: 80px">
			${ nowLogon.id }님 반갑다. 
			<a href="/springPro/JH/03_customer/c_main">고객센터</a>&nbsp;&nbsp;&nbsp;
			<a href="/springPro/JH/04_myPage/my_main">마이 페이지</a>&nbsp;&nbsp;&nbsp;
			<c:if test="${ nowLogon.grade == 99 }">
				<a href="/springPro/adminJK/total" >관리자페이지</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<a href="/springPro/JH/02_log/logOut">로그아웃</a>
			
			</div>
			<!-- Accent-colored raised button with ripple -->
		</div>
		
<!-- Colored FAB button with ripple -->

		
	</div>
</div>
</div>




   <script type="text/javascript">
   function goSearch(){	
  		var frm=document.frmSearch;
  		var search=frm.search.value.trim();
  		
    var i = 0;   //for문을 이용할 변수
    var special=new Array("@","#","$","%","^","&","*","=","+","[","]","{","}","\""); // 특수문자 배열
    
    for(i=0; i< special.length;i++){
    var output = search.indexOf(special[i],0);  //해당문자열에 특수문자열이 있는지 확인
    if (output != -1) //특수문자가 없다면 -1을 반환 -1이외의값에 alert 수행후 함수 종료
     {
      alert("특수문자를 사용하실수 없습니다.  "+special[i]+"를 삭제하신후 다시눌러주세요");
      return;
     }
    }
    if(search==""){
   	 alert("검색어를 입력하세요");
   	 return;
    }
    
  		frm.action="/springPro/search/song";
  		frm.method="post";
  		frm.submit();
		
	 	}
   </script>
 

<script type="text/javascript">
	$(function(){	//자동검색 함수
	//      var source = ['난누군가','또여긴어딘가','누가날불러?'];
	        // 자동으로 /ajax/auato 주소로 term 이란 파라미터가 전송된다.
	        // 응답은 [{label:~~~,value:~~~},{label:~~~,value:~~~}] 형태가 된다.
	        $('#term').autocomplete({"source":function(request,response){
	               $.getJSON("/springPro/search/auto",{"term":request.term},
	                       function(result) {
	                              return response($.map(result, function(item){
	                                      var l = item.label.replace(request.term, request.term);
	                                      return {label:l, value:item.value};
	                              }));
	               });
	        }});
	});
</script>

















