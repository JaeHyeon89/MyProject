<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style type="text/css">
a {
	cursor: pointer;
}
.al { 
	color:black; 
  	width: 350px; 
 	text-overflow:ellipsis;  
 	overflow:hidden; 
 	white-space:nowrap; 
 }
 
 
</style>


<div style="font-size: 50px; font-weight: bolder;" align="center">
	<div style="display: inline; color: red;">
	'${ search }'
	</div>
	<div style="display: inline;">
		로 검색하신 결과는 ${ size }개 입니다.
	</div>
</div>	
	<br>
	
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div style="font-size: 25px;">
      <ul class="nav navbar-nav">
        <li><a href="/springPro/search/song?search=${ search }">곡</a></li>
        <li class="active"><a href="/springPro/search/album?search=${ search }">앨 범</a></li>
        <li><a href="/springPro/search/artist?search=${ search }">아티스트</a></li> 
        <li><a href="/springPro/search/lyrics?search=${ search }">가 사</a></li> 
      </ul>
    </div>
  </div>
</nav>
<br><br>
<c:choose>
	<c:when test="${ size>0 }">
		<div class="row">
			<c:forEach var="each" begin="${ pbean.startNum }" end="${ pbean.endNum }" items="${ albumListc }">
				<div class="col-sm-6">
					<hr>
					<div class="row">
						<!-- 앨범사진(누르면앨범정보) -->
						<div class="col-sm-4">
							<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
										data-toggle="tooltip" title="${ each.albumName }-페이지이동">
								<img src="/springPro/resources/filepath/album/${ each.photoSysName }"
								class="img-rounded" alt="Cinque Terre" width="200" height="200">
							</a>
						</div>
						<div class="col-sm-8">
							<!-- 앨범이름 -->
							<div style="font-size: 25px; font-weight: bold;" class="al">
								<a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
										data-toggle="tooltip" title="${ each.albumName }-페이지이동">
									${ each.albumName }
								</a>
							</div>
							<!-- 아티스트이름 -->
							<div style="font-size: 15px">
								<a  style="width:200; text-overflow:ellipsis; overflow:hidden; white-space:nowrap"
										onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
										data-toggle="tooltip" title="${ each.artistName }-페이지이동">
									${ each.artistName }
								</a>
							</div>
							<div style="font-size: 15px">
								${ each.dateOfIssue }
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div align="center">
			<ul class="pager">
				<c:if test="${ pbean.pageGrade !=0 }">
					<li class="previous"><a href="?nowPage=${ pbean.startPage-pbean.showPageCnt }&search=${search}">pre</a></li>
				</c:if>
				<c:forEach var="i" begin="${ pbean.startPage }" end="${ pbean.endPage }">
					<li><a href="?nowPage=${ i }&search=${search}">${ i }</a></li>
				</c:forEach>
				<c:if
					test="${ pbean.oneCount==pbean.rcvCount }">
					<li class="next"><a href="?nowPage=${ pbean.startPage+pbean.showPageCnt }&search=${search}">next</a></li>
				</c:if>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		모든 단어의 철자가 정확한지 확인해 보세요.<br>
		두 단어 이상일 경우 띄어쓰기를 확인하거나 단어 수를 줄여보세요.<br>
		아직 발매되지 않은 곡/앨범을 검색했을 수 있습니다.<br>
	</c:otherwise>
</c:choose>


