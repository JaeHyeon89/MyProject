<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- <script id="_waulcp"> -->
<!-- 	var _wau = _wau || []; -->
<!-- 	_wau.push([ "tab", "fvmdb7hbc4ui", "lcp", "right-upper" ]); -->
<!-- 	(function() { -->
<!-- 		var s = document.createElement("script"); -->
<!-- 		s.async = true; -->
<!-- 		s.src = "http://widgets.amung.us/tab.js"; -->
<!-- 		document.getElementsByTagName("head")[0].appendChild(s); -->
<!-- 	})(); -->
<!-- </script> -->

</head>
<body>
	<header class="container-fluid" style="overflow: auto; width: 1000px">
		<page:applyDecorator name="admin_top" />
	</header>
	<div class="container-fluid" style="margin-top: 100px;">
		<div style="width: 130px;">
			<page:applyDecorator name="admin_left" />
		</div>
		<div style="margin-left: 150px; min-height: 700px;">
			<decorator:body />
		</div>
	</div>
	<div style="background-color: blue; opacity: 0.7; color: white;">
		<h2>관리자 모드</h2>
	</div>
</body>
</html>