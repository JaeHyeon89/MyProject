<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        
<script src="/springPro/resources/js/external/jquery/jquery.js"></script>
<script src="/springPro/resources/js/jquery-ui.js"></script>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	alert("${msg}");
    </script>
	
	<div align="center"> 
		<h2>다 운 로 드</h2>
	</div>
	
	<table class="table">
		<tr>
			<th>노래 제목</th>
			<th>앨범 제목</th>
			<th>가수 이름</th>
			<th>다운로드</th>
		</tr>
		<c:forEach var="each" items="${ songList }">
			<tr class="info">
				<td>${ each.songName }</td>
				<td>${ each.albumName }</td>
				<td>${ each.artistName }</td>
				<td>
					<a href="/springPro/resources/filepath/song/${ each.sysName }" download="${ each.orgName }">
						다운로드<span class="glyphicon glyphicon-floppy-disk"></span>
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<br><br><br>
	<div align="center">
		<button type="button" class="btn btn-danger" onclick="self.close();">닫기</button>
	</div>
    