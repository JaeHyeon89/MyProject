<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="table table-hover" style="text-align: center">
			<tr>
				<th colspan="5" style="text-align: center">
					${ myAlbumInfo.albumName2 }
				</th>
			</tr>
			<tr>
				<th colspan="5" style="text-align: left">
					<button class="btn btn-primary btn-sm">전체 선택</button>
					<button class="btn btn-primary btn-sm">선택 듣기</button>
					<button class="btn btn-primary btn-sm">선택 삭제</button>
				</th>
			</tr>
			<tr>
				<th>선 택</th>
				<th>제 목</th>
				<th>가 수</th>
				<th>앨 범</th>
				<th>삭 제</th>
			</tr>
		
		<c:choose>
			<c:when test="${ myAlbum2 != null }">
				<c:forEach var="each" items="${ myAlbum2 }">
					<tr>
						<td>
							<input type="checkbox" name="songCheck" value="${ each.num }" />		
						</td>
						<td>${ each.albumName }</td>
						<td>${ each.songName }</td>
						<td>${ each.artistName }</td>
						<td>
							<button type="button" class="btn btn-primary btn-sm"
							onclick="albumDel('${myAlbumInfo.albumContent2}',${each.num },'albumContent2')" 
							>
								삭제하기
							</button>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="4">
					아무것도 없어요
				</td>
			</c:otherwise>
		</c:choose>
		</table>












