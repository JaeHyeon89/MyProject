<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="navbar navbar-fixed-top navbar">
	<div class="container-fluid"
		style="background-color: blue; opacity: 0.7;">
		
		<div class="row">
			<div class="col-sm-2" style="color: white;" onclick="location.href='/springPro/adminJK/total'"><h2>관리자 페이지</h2></div>
			
			<form action="/springPro/adminJK/search/selectList" method="get">
				<div class="col-sm-6" style="margin: 20px;">
					<input type="search" maxlength="20" name="search" class="form-control"
						style="border-radius: 100px 100px 100px 100px; display: inline; width: 400px; border: 3px;" />
					<button type="submit" class="btn btn-info btn-sm">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</div>
			</form>
		</div>
	</div>
</div>