<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
 a { 
	cursor: pointer;
} 

</style>
	
<script type="text/javascript">
	
	function checkAll4(num){
		var aaa = ${param.theme };
		checkbox = aaa.num;
		if(checkbox.length){
			for(var i=0;checkbox.length;i++){
				checkbox[i].checked=aaa.all.checked;
			}
		}else{
			checkbox.checked=aaa.all.checked;
		}
	}
	
	function goCheckPlay(){
		var url="/springPro/checkPlay";
		var title="/springPro/checkPlay";
		window.open(url, title, 300, 300);
		frm1.target=title;
		frm1.method="post";
		frm1.action=url;
		frm1.submit();
	}
</script>


	
	
<form name="${param.theme }">
	
	
			<h2>테마별</h2>
			
			
<table class="table">
		<tr>
			<td colspan="1">
				<input type="checkbox" name="all" onclick="checkAll4(${param.theme })">
			</td>
			<td colspan="1">
				<input type="button" value="선택듣기" onclick="goCheckPlay4()">
			</td>
			<td>순 위</td>
			<td>곡이름</td>
			<td>아티스트</td>
			<td>앨 범</td>
			<td>가 사</td>
			<td>추 천</td>
			<td>재 생</td>
			<td>내앨범</td>
			<td>다 운</td>
			<td>뮤 비</td>
		</tr>
	</table>


	
	<table class="table">
		<c:if test="${ param.theme == 1 }">
		<c:set var="list" value="${ list01Theme }" />
		</c:if>
		<c:if test="${ param.theme == 2 }">
		<c:set var="list" value="${ list02Theme }" />
		</c:if>
		<c:if test="${ param.theme == 3 }">
		<c:set var="list" value="${ list03Theme }" />
		</c:if>
		<c:if test="${ param.theme == 4 }">
		<c:set var="list" value="${ list04Theme }" />
		</c:if>
		<c:if test="${ param.theme == 5 }">
		<c:set var="list" value="${ list05Theme }" />
		</c:if>
		<c:if test="${ param.theme == 6 }">
		<c:set var="list" value="${ list06Theme }" />
		</c:if>
		<c:if test="${ param.theme == 7 }">
		<c:set var="list" value="${ list07Theme }" />
		</c:if>
		<c:forEach var="each" items="${ list }" varStatus="status">
		<tr>
			<td colspan="1">
				<input type="checkbox" name="num" value="${ each.num }">
			</td>
			<td>${ status.count }</td>
			<!-- 곡이름-재생 -->
			<td onClick="window.open('/springPro/musicPlayer?num=${each.num}','300','300')">${ each.songName }</td>
			
			<td><a onClick="location.href='/springPro/artistInfo?name=${each.artistName}'">${ each.artistName }</a></td>
			
			<td><a onClick="location.href='/springPro/albumInfo?name=${each.albumName}'">${ each.albumName }</a></td>
			<!-- 가사버튼 -->
			<td onClick="window.open('/springPro/lyrics?num=${each.num}','500','500')" colspan="1">
				<input type="button" value="가사"> 
			</td>
			<!-- 추천버튼 -->
			<td onClick="window.open('/springPro/recommend?num=${each.num}','100','50')" colspan="1">
				<input type="button" value="추천" name="recommend">	
			</td>
			<!-- 재생버튼 -->
			<td colspan="1">
				<input type="button" value="재생" onClick="window.open('/springPro/musicPlayer?num=${each.num}','300','300')">
			</td>
			<!-- 담기버튼 -->
			<td colspan="1">
				<input type="button" value="담기" name="myAlbum"
				onClick="window.open('/springPro/myAlbum?num=${each.num}','500','500')">
			</td>
			<!-- 다운버튼 -->
			<td colspan="1">
				<input type="button" value="다운" name="down"
				onClick="window.open('/springPro/down?num=${each.num}','500','500')">
			</td>
			<!-- 뮤비버튼 -->
			<td colspan="1">
				<input type="button" value="뮤비" name="vedio">	
			</td>
		</tr>
		</c:forEach>
	</table>
</form>