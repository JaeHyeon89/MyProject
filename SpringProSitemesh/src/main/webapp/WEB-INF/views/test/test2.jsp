<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>


<script type="text/javascript">
	var httpRequest = null;

	function getXMLHttpRequest() {

		if (window.ActiveObject) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");

				} catch (e1) {
					return null;
				}
			}

		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();

		} else {
			return null;
		}

	}

	function bbbData(aaa) {
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callBack;
		httpRequest.open("Get", "/springPro/adminJK/music/album/insertOne"
				+ "?num=" + aaa, true);
		httpRequest.send(null);
		$("#myModal").modal();
	}

	function callBack() {

		if (httpRequest.readyState == 4) {
			alert("콜백");
			if (httpRequest.status == 200) {
				var data = httpRequest.responseText;
				alert("data = " + data);

				var target = document.getElementsByTagName("bbb");
				target.item(0).innerHTML = data;
			} else {
				alret("#### 실패 : " + httpRequest.status);

			}

		}
	}
</script>








<h2>test2</h2>
<a onclick="bbbData('aaa')">회사 소개</a>


<div class="container">
	<h2>Large Modal</h2>
	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Large Modal</button>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">

					<%--         		<page:applyDecorator name="left"/> --%>
					<%-- 				<jsp:include page="/WEB-INF/views/adminJK/music/album/insertForm.jsp"></jsp:include> --%>
					<bbb> </bbb>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>
	<h1>Some text to enable scrolling</h1>