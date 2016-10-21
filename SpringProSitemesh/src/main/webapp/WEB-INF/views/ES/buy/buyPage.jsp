<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <style type="text/css">
    	.div_root{
    		text-align: center;
    		width: 100%;
    	}
    	th{
    		background-color: #FFFFCC;
    	}
    </style>
    
    <div class="div_root" style="background-color: #EEEEEE">
		<div style="text-align: center;">
			<br><br><br>
			<div style="font-size: 30px; color: green;">
				세스코의 다양한 음악을 만나보세요!
			</div>
			<div style="font-size: 50px; color: black; display: inline; font-weight: bold;">
				당신을 위한
			</div>
			&nbsp;
			<div style="font-size: 50px; color: red; display: inline; font-weight: bold;">
				슈퍼특가!!
			</div>
			<br><br>
			<div style="font-size: 18px; font-weight: bold;">
				본 할인헤택은 사전예고없이 종료될 수 있습니다.
			</div>
			<br><br><br>
		</div>
	</div>
	
    <br><br><br><br>
    
    <div class="div_root">
    	<div class="row">
		    <div class="col-sm-4 col-md-6" style="background-color: #000033; color: white; border-radius: 100px 0px 0px 100px;">
			    <div style="font-size: 30px; font-weight: bold; display: inline; color: yellow;">듣기+50곡</div>
		    	<div style="font-size: 30px; font-weight: bold; display: inline;"> 다운</div>
	   			<p style="font-size: 18px; color: #AAAAAA;">다운로드 한 MP3 평생 소장 / PC 무제한 듣기</p>
	   			<div style="font-size: 25px; display: inline; color: white;">
	   				<span class="glyphicon glyphicon-credit-card"></span>
	   			</div>
   				<div style="font-size: 30px; display: inline;">30일</div>
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<div style="font-size: 20px; display: inline; color: #777777; text-decoration:line-through">
		    		8,000원
		    	</div>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<div style="font-size: 30px; display: inline; color: red; font-weight: bold;">
		    		5,000원
		    	</div>
		    	<br>
		    	<div align="center">
					<button type="button" style="background-color: #FF6633;" 
						class="btn btn-md" data-toggle="modal" 
						<c:if test="${nowLogon!=null}">data-target="#ticketModal"</c:if>
						<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if>>이용권 구매하기
					</button>
				</div>
				<br>
		    </div>
		    <div class="col-sm-4 col-md-6" style="background-color: #660033; color: white; border-radius: 0px 100px 100px 0px;">
		    	  <div style="font-size: 30px; font-weight: bold; display: inline; color: yellow;">듣기+100곡</div>
		    	<div style="font-size: 30px; font-weight: bold; display: inline;"> 다운</div>
	   			<p style="font-size: 18px; color: #AAAAAA;">다운로드 한 MP3 평생 소장 / PC 무제한 듣기</p>
   				<div style="font-size: 25px; display: inline; color: white;">
	   				<span class="glyphicon glyphicon-credit-card"></span>
	   			</div>
   				<div style="font-size: 30px; display: inline;">30일</div>
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<div style="font-size: 20px; display: inline; color: #777777; text-decoration:line-through">
		    		12,000원
		    	</div>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<div style="font-size: 30px; display: inline; color: red; font-weight: bold;">
		    		10,000원
		    	</div>
		    	<br>
		    	<div align="center">
					<button type="button" style="background-color: #FF6633" class="btn btn-md" data-toggle="modal" 
					<c:if test="${nowLogon!=null}">data-target="#ticketModal"</c:if>
					<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if>>이용권 구매하기</button>
				</div>
				<br>
		    </div>
  		</div>
    </div>
     <br><br><br><br><br><br><br><br><br><br>
	
	<div class="div_root">
		<div class="row">
			<div class="col-sm-4 col-md-6" style="background-color: #000033; color: white; border-radius: 100px 0px 0px 100px;">
			    <p style="font-size: 50px">COMMING</p>
			    <p style="font-size: 50px">SOON</p>
		    </div>
			<div class="col-sm-4 col-md-6" style="background-color: #660033; color: white; border-radius: 0px 100px 100px 0px;">
		    	<p style="font-size: 50px">COMMING</p>
			    <p style="font-size: 50px">SOON</p>
		    </div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	
	<div class="div_root" style="background-color: #DDDDDD">
		<div style="text-align: center;">
			<br><br>
			<div style="font-size: 30px; color: green;">
				세스코의 다양한 음악을 만나보세요!
			</div>
			<div style="font-size: 50px; color: black; display: inline; font-weight: bold;">
				당신이 원한 당신을 위한
			</div>
			&nbsp;
			<div style="font-size: 50px; color: red; display: inline; font-weight: bold;">
				놀라운 혁신!
			</div>
			<br><br>
			<div align="center" class="col-sm-6 col-md-6">
				<button type="button" style="background-color: #FF3333; color: white;"
					 class="btn btn-lg" data-toggle="modal"
					<c:if test="${nowLogon!=null}">data-target="#cashModal"</c:if>
					<c:if test="${nowLogon==null}">onclick="goLogin()"</c:if> >
					캐시 충전하기
				</button>
			</div>
			<div class="col-sm-4 col-md-5" align="left" style="font-size: 18px; font-weight: bold;">
				<li>구입한 곡은 무제한 듣기를 할 수 있습니다.</li>
				<li>한번 구입한 MP3는 평생 소유할 수 있습니다.</li>
				<li>세스코 캐시로는 곡구매, 앨범구매만 가능 합니다.</li>
			</div>
			<br><br><br><br>
		</div>
	</div>
	
	
	<br><br><br><br><br><br><br>

	<div align="center">
		<div style="text-align: left; font-size: 30px; font-weight: bolder;">이용 안내</div>
		<pre style="font-size: 15px; background-color: white; border: 0; text-align: left;">
			<li>음원 권리사의 요청으로 특정 음원의 경우 음악듣기, 저장, 다운로드 서비스 이용이 제한될 수 있습니다.</li>
			<li>각종 이용권 관리는 세스코 홈페이지에 접속 후 마이페이지>이용권 관리에서 가능합니다.</li>
			<li>30일 무제한 듣기 이용권 경우 기간이 만료된 후에는 이용이 불가 합니다.</li>
			<li>충전하신 세스코캐시는 마이페이지>캐시 관리에서 확인하실 수 있습니다.</li>
			<li>충전하신 세스코캐시를 이용하여 벅스에서 서비스 하고 있는 유료 컨텐츠를 구매하실 수 있습니다.<br>
(MP3구입 등의 유료 서비스 이용 가능)</li>
		</pre>
	</div>





<!-- 캐시 충전 Modal -->

<div id="cashModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header" style="background-color: #CCFFFF">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <div style="font-size: 30px; font-weight: bold; " class="modal-title">캐시 충전</div>
      </div>
      <div class="modal-body" style="font-size: 20px; font-weight: bold; ">
      	<div>
			캐시와 현금은 1대1 비율이며	<br>
			세스코 캐시로는 곡, 앨범을 구매할 수 있으며<br>
			이용권은 캐시로 구매하실 수 없습니다. 
		</div>
	<form name="cashFrm">
		<table class="table">
			<tr>
				<th style="font-size: 18px; font-weight: bold;">캐시 구매 량</th>
				<td><label class="radio-inline">
						<input type="radio" name="cashAmount" value="5000" checked="checked">5천원
					</label>
					<label class="radio-inline">
						<input type="radio" name="cashAmount" value="10000">만원
					</label>
					<label class="radio-inline">
						<input type="radio" name="cashAmount" value="30000">3만원
					</label>
					<label class="radio-inline">
						<input type="radio" name="cashAmount" value="50000">5만원
					</label>
				</td>
			</tr>
			<tr>
				<th style="font-size: 18px; font-weight: bold;">충전 방식</th>
				<td>
					<div style="font-size: 18px;">
						<input type="radio" name="way" value="phone" checked="checked">
						&nbsp;&nbsp;&nbsp;&nbsp;휴대폰 결제
					</div>
					<br>
					<div style="font-size: 18px;">
						<input type="radio" name="way" value="card">
						&nbsp;&nbsp;&nbsp;&nbsp;카드 결제
					</div>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="button" class="btn btn-success" onclick="goCashCharge()">충전하기</button>
				</td>
			</tr>
		
		</table>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>


<!-- 이용권 구매 Modal -->
<div id="ticketModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header" style="background-color: #CCFFFF">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <div style="font-size: 30px; font-weight: bold;" class="modal-title">이용권 구매</div>
      </div>
      <div class="modal-body">
      	<div style="font-size: 20px; font-weight: bold;">
	      	이용권은 30일 무제한 노래 듣기와 노래 다운로드가 있으며<br>
	      	이용권은 세스코캐시로 구매하실 수 없습니다.
      	</div>
		<br>
			<form name="ticketFrm">
		<table class="table">
			<tr>
				<th style="font-size: 18px; font-weight: bold;">구매하실 이용권을 선택하세요</th>
				<td>
					<div style="font-size: 18px;">
						<input type="radio" name="remainMusic" value="50" checked="checked">
						&nbsp;&nbsp;&nbsp;&nbsp;노래 30일 무제한듣기, 50곡 다운로드 무료 5000원
					</div>
					<br>
					<div style="font-size: 18px;">
						<input type="radio" name="remainMusic" value="100">
						&nbsp;&nbsp;&nbsp;&nbsp;노래 30일 무제한듣기, 100곡 다운로드 무료 10000원
					</div>
				</td>
			</tr>
			<tr>
				<th style="font-size: 18px; font-weight: bold;">충전 방식</th>
				<td>
					<div style="font-size: 18px; font-weight: bold;">
						<input type="radio" name="way" value="phone" checked="checked">
						&nbsp;&nbsp;&nbsp;&nbsp;휴대폰 결제
					</div>
					<br>
					<div style="font-size: 18px; font-weight: bold;">
						<input type="radio" name="way" value="card">
						&nbsp;&nbsp;&nbsp;&nbsp;카드 결제
					</div>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="button" class="btn btn-success" onclick="goTiCharge()">구매하기</button>
				</td>
			</tr>
		
		</table>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	
	<script type="text/javascript">	<!-- 캐시충전 function -->
		function goCashCharge(){
			
			var way=cashFrm.way.value;
			
			cashFrm.method="post";
			
			if(way=="phone"){
				var url="phoneChargeForm";
				var title="phoneChargeForm"
				
				window.open("", title, "width=700, height=600");
				
				cashFrm.target=title;
				cashFrm.action=url;
				cashFrm.submit();
				
			}else{
				var url="cardChargeForm";
				var title="cardChargeForm"
				window.open("", title, "width=700, height=600");
				cashFrm.target=title;
				cashFrm.action=url;
				cashFrm.submit();
			}
			
			
		}
	</script>
	
		
	<script type="text/javascript">		<!-- 이용권 구매 function -->
	function goTiCharge(){
		
		var way=ticketFrm.way.value;
		
		ticketFrm.method="post";
		
		if(way=="phone"){
			var url="phoneChargeForm";
			var title="phoneChargeForm"
			window.open("", title, "width=700, height=600");
			ticketFrm.target=title
			ticketFrm.action=url;
			ticketFrm.submit();
			
		}else{
			var url="cardChargeForm";
			var title="cardChargeForm"
			window.open("", title, "width=700, height=600");
			ticketFrm.target=title
			ticketFrm.action=url;
			ticketFrm.submit();
		}
		
		
	}
	
	function goLogin(){		//로그인 안됐을때 로그인으로
		alert("로그인이 필요한 서비스입니다.");
		location.href="/springPro/JH/02_log/login";
	}
	
	</script>