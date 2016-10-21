<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<!-- Latest compiled JavaScript   -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- 마테리얼 온라인 -->
<!-- <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.green-cyan.min.css"> -->
<!-- <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->

<!-- 마테리얼 다운 -->
<!-- <link rel="stylesheet" href="springPro/resources/mdl/material.min.css"> -->
<!-- <script src="springPro/resources/mdl/material.min.js"></script> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">


<!-- 검색 자동완성 사용시 필요 -->
<link href="/springPro/resources/js/jquery-ui.css" rel="stylesheet">
<script src="/springPro/resources/js/jquery-ui.js"></script>

<style type="text/css">
#term {
	width: 250px;
	border-radius: 100px 100px 100px 100px;
	display: inline;
}

@font-face {
	font-family: "nbrR";
	font-style: normal;
	font-weight: 400;
	src: url("/springPro/resources/fonts/NANUMBARUNPENR.TTF")
		format("truetype");
}

@font-face {
	font-family: "nbrB";
	font-style: normal;
	font-weight: 400;
	src: url("/springPro/resources/fonts/NANUMBARUNPENB.TTF")
		format("truetype");
}

@font-face {
	font-family: "ngB";
	font-style: normal;
	font-weight: 400;
	src: url("/springPro/resources/fonts/NANUMBARUNGOTHICBOLD.TTF")
		format("truetype");
}

@font-face {
	font-family: "ngR";
	font-style: normal;
	font-weight: 400;
	src: url("/springPro/resources/fonts/NANUMBARUNGOTHIC.TTF")
		format("truetype");
}

.menuBold {
	font-weight: bold;
}

body {
	/*  		font-family: 'Nanum Gothic', cursive;  */
	/*  		font-family: 'Nanum Brush Script', serif; */
	font-family: 'ngR', cursive;
}
</style>


</head>
<body style="width: 1600px;">
	<div>

		<!-- 탑 :  decorators.xml 에서 가져옴 -->
		<!-- 	<div class="container"> -->
		<header class="container-fluid" style="overflow: auto; width: 1500px">
			<c:choose>
				<c:when test="${ nowLogon.id == null }">
					<page:applyDecorator name="top" />
				</c:when>
				<c:otherwise>
					<page:applyDecorator name="logTop" />
				</c:otherwise>
			</c:choose>
		</header>
		<!-- 	</div> -->

		<div class="container-fluid" style="margin-top: 120px;">
			<div class="menuBold">
				<page:applyDecorator name="left" />
			</div>
			<div
				style="margin-left: 180px; min-height: 600px; border-left: 2px solid #DCEBFF">

				<!-- 몸통 : decorators.xml 에서 가져옴 -->
				<decorator:body />
			</div>

			<div class="navbar navbar-fixed-bottom navbar" align="right">
				<iframe style="width: 100%; height: 50px; border: none;" src="" name="iframe_a"></iframe>
			</div>

			<footer style="background-color: blue; opacity: 0.7; color: white;">
				<address style="text-align: center">
					㈜세스코 | 13487 경기도 성남시 분당구 대왕판교로 645번길 16 플레이뮤지엄 | 대표이사 : 홍길동 | 고객센터 : <a href="www.naver.com">세스코 고객센터</a> / 1234-5678 (유료)<br />
					사업자등록번호 : 123-45-67890 | 통신판매업 신고번호 : 제 2015-경기성남-9999호 | <a href="#" target="_blank">사업자정보 확인</a> | © 세스코 Corp. All rights reserved.
				</address>
			</footer>
		</div>
	</div>
</body>
</html>