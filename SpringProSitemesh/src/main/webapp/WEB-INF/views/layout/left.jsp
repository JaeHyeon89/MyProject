<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="nav nav-pills nav-stacked" data-spy="affix" >

<br>
<a href="/springPro/buyPage">
	<button type="button" class="btn btn-default" style="font-size: 15px; height: 30px">
		<p><span style="color: red;" class="glyphicon glyphicon-shopping-cart"></span>구매 하기</p>
	</button>
</a>

	<div class="panel-group">
		<!-- 음악 -->
		<div class="panel panel-warning" style="border-color: white;">
			<div class="panel-body">
				<h2 class="panel-title">
					<i class="material-icons" style="font-size: 18px">music_video</i>
					<span class="text-muted">HOT CHART</span> 
					<a data-toggle="collapse" href="#menu2333">
						<i class="material-icons" style="font-size: 18px">arrow_drop_uparrow_drop_down</i>
					</a>
				</h2>
			</div>
			<div id="menu2333" class="panel-collapse collapse in">
				<div class="list-group" style="margin-left: 30px;">
					<div>
						<a class="list-group-item" href="/springPro/kwang/total">세스코 차트</a>
					</div>
					<div>
						<a class="list-group-item" href="/springPro/kwang/album">앨범 차트</a>
					</div>
					<div>
						<a class="list-group-item" href="/springPro/kwang/theme2">테마별</a>
					</div>
					<div>
						<a class="list-group-item" href="/springPro/kwang/genre">장르별</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 재현앨범 -->
		<div class="panel panel-warning" style="border-color: white;">
			<div class="panel-body">
				<h2 class="panel-title">
					<i class="material-icons" style="font-size: 18px">music_video</i>
					<span class="text-muted">마이 앨범</span> 
					<a data-toggle="collapse" href="#menu3444">
						<i class="material-icons" style="font-size: 18px">arrow_drop_uparrow_drop_down</i>
					</a>
				</h2>
			</div>
			<div id="menu3444" class="panel-collapse collapse in">
				<div class="list-group" style="margin-left: 30px;">
					<div>
						<a class="list-group-item" href="/springPro/JH/04_myPage/myAlbum/go">마이 앨범</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


