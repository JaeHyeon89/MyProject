<%@page import="spring.mvc.springPro.bean.user.UserInfo"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
a {
	cursor: pointer;
}
.al { 
	color:black; 
  	width: 125px; 
 	text-overflow:ellipsis;  
 	overflow:hidden; 
 	white-space:nowrap; 
 }
</style>
	
<c:if test="${ listc==null }">
	<script type="text/javascript">
		location.href="/springPro/";
	</script>
</c:if>	
	
<div class="container" style="width: 100%; background-color: #CCE1FF">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="10000" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    	<!-- 첫째 장 -->
      <div class="item active">
				<br>
				<div class="col-sm-6">
					<div style="font-size: 35px; font-weight: bold;">최신 앨범</div>
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<div style="font-size: 20px;"><a href="/springPro/kwang/album" style="color: black;">더 보기 ></a></div>
				</div>
				<br><br><br><br>
				<c:forEach var="each" begin="0" end="11" items="${ listc }">
					<div class="col-sm-2" align="center">
						<div>
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
										data-toggle="tooltip" title="${ each.albumName }-페이지이동">
							<img src="/springPro/resources/filepath/album/${ each.photoSysName }" style="border: 1px solid white;"
							class="img-rounded" alt="Cinque Terre" width="150" height="150">
							</a>
						</div>
						<br>
						<div class="al">
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'" 
								style="color: black; font-size: 17px"
								data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								${ each.albumName }
							</a>
						</div>
						<div class="al">
							<a  style="width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; font-size: 12px"
								onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
								data-toggle="tooltip" title="${ each.artistName }-페이지이동">
								${ each.artistName }
							</a>
						</div>
						<div>&nbsp;</div>
					</div>
				</c:forEach>
      </div>
		<!-- 두번째 장 -->
      <div class="item">
				<br>
				<div class="col-sm-6">
					<div style="font-size: 35px; font-weight: bold;">최신 앨범</div>
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<div style="font-size: 20px;"><a href="/springPro/kwang/album" style="color: black;">더 보기 ></a></div>
				</div>
				<br><br><br><br>
				<c:forEach var="each" begin="12" end="23" items="${ listc }">
					<div class="col-sm-2" align="center">
						<div>
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
										data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								<img src="/springPro/resources/filepath/album/${ each.photoSysName }" style="border: 1px solid white;"
								class="img-rounded" alt="Cinque Terre" width="150" height="150">
							</a>
						</div>
						<br>
						<div class="al">
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'" 
								style="color: black; font-size: 17px"
								data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								${ each.albumName }
							</a>
						</div>
						<div class="al">
							<a  style="width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; font-size: 12px""
								onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
								data-toggle="tooltip" title="${ each.artistName }-페이지이동">
								${ each.artistName }
							</a>
						</div>
						<div>&nbsp;</div>
					</div>
				</c:forEach>
      </div>
    
		<!-- 세번째 장 -->
      <div class="item">
				<br>
				<div class="col-sm-6">
					<div style="font-size: 35px; font-weight: bold;">최신 앨범</div>
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<div style="font-size: 20px;"><a href="/springPro/kwang/album" style="color: black;">더 보기 ></a></div>
				</div>
				<br><br><br><br>
				<c:forEach var="each" begin="24" end="35" items="${ listc }">
					<div class="col-sm-2" align="center">
						<div>
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
										data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								<img src="/springPro/resources/filepath/album/${ each.photoSysName }" style="border: 1px solid white;"
								class="img-rounded" alt="Cinque Terre" width="150" height="150">
							</a>
						</div>
						<br>
						<div class="al">
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'" 
								style="color: black; font-size: 17px"
								data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								${ each.albumName }
							</a>
						</div>
						<div class="al">
							<a  style="width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; font-size: 12px""
								onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
								data-toggle="tooltip" title="${ each.artistName }-페이지이동">
								${ each.artistName }
							</a>
						</div>
						<div>&nbsp;</div>
					</div>
				</c:forEach>
			</div>
      </div>
  </div>
</div>
	
	
	
	<br><br>
	
	
	