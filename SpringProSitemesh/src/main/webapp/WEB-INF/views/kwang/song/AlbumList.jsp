<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
a {
	cursor: pointer;
}
</style>

<script type="text/javascript">
	var checkbox;
	function checkAll2() {
		var test = document.frm2;
		checkbox = test.num;
		if (checkbox.length) {
			for (var i = 0; checkbox.length; i++) {
				checkbox[i].checked = frm2.all.checked;
			}
		} else {
			checkbox.checked = frm2.all.checked;
		}
	}
	
</script>

<style type="text/css">

.song {
	color: black;
}

.arti {
	color: black;
	width: 150px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}


.al {
	color: black;
	width: 190px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>


<form name="frm2">

<div class="container-fluid">
	<div class="row-fluid">
	<div class="col-sm-12">
	<br>
<c:forEach var="each" items="${ listb }">

			<div class="col-sm-2" align="center">
				<div onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
						data-toggle="tooltip" title="${ each.albumName }-페이지이동">
				<img src="/springPro/resources/filepath/album/${ each.photoSysName }"
					class="img-rounded" alt="Cinque Terre" width="185" height="160">
				</div>
				<br>
				<div class="al" align="center" style="font-size: 20px;  font-weight: bold;">
				<!-- 앨범 이름 -->
					<a
						onClick="location.href='/springPro/albumInfo?name=${each.albumName}'"
						data-toggle="tooltip" title="${ each.albumName }-페이지이동"><nobr>${ each.albumName }</nobr></a>
				</div>
				<div class="arti" align="center">
					<a
						onClick="location.href='/springPro/artistInfo?name=${each.artistName}'"
						data-toggle="tooltip" title="${ each.artistName }-페이지이동"><nobr>${ each.artistName }</nobr></a>
				</div>
				<div class="al" align="center">
					${ each.dateOfIssue }
				</div>
				<div>&nbsp;</div>
			</div>
			

</c:forEach>
	</div>
	</div>
</div>



</form>










