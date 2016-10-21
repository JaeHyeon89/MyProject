<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<h2>MusicPlayer 페이지</h2>
<link rel="stylesheet" type="text/css" href="/springPro/resources/js/assets/css/normalize.css" />
  	<link rel="stylesheet" type="text/css" href="/springPro/resources/js/assets/css/theme-2.css" />
  	
  	<script src="/springPro/resources/js/assets/js/jquery.js"></script>
	<script src="/springPro/resources/js/assets/js/jquery.audioControls.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#playListContainer").audioControls({
				autoPlay : true,
				timer: 'increment',
				onAudioChange : function(response){
					$('.songPlay').text(response.title + ' ...');
				},
				onVolumeChange : function(vol){
					var obj = $('.volume');
					if(vol <= 0){
						obj.attr('class','volume mute');
					} else if(vol <= 33){
						obj.attr('class','volume volume1');
					} else if(vol > 33 && vol <= 66){
						obj.attr('class','volume volume2');
					} else if(vol > 66){
						obj.attr('class','volume volume3');
					} else {
						obj.attr('class','volume volume1');
					}
				}
			});
		});
	</script>
	
	
	<table style="width:100%">
<tr><td valign="top">
	<div class="containerPlayer">
		<div id="listContainer" class="playlistContainer">
		<ul id="playListContainer">
			
			<c:forEach var="each" items="${ songList }">
			 <li data-src="/springPro/resources/filepath/song/${ each.sysName }">
				<a href="#">
					${ each.songName } - ${ each.artistName }
				</a>
			</li>
			
			</c:forEach>
		</ul>
	</div>
		<div id="playerContainer">
		<div id="controlContainer">  
			
			<ul class="controls">
			<li>
				<a href="#" class="shuffle" data-attr="shuffled"></a>
			</li>
				<li>
					<a href="#" class="left" data-attr="prevAudio"></a>
				</li>
				<li>
					<a href="#" class="play" data-attr="playPauseAudio"></a>
				</li>
				<li>
					<a href="#" class="right" data-attr="nextAudio"></a>
				</li>
				<li>
					<a href="#" class="repeat" data-attr="repeatSong"></a>
				</li>
			</ul>
			<div class="audioDetails">
				<span class="songPlay"></span>
				<span data-attr="timer" class="audioTime"></span>
			</div>
			<div class="progress">
				<div data-attr="seekableTrack" class="seekableTrack"></div>
				<div class="updateProgress"></div>
			</div>
			
		</div>
		
		<div class="volumeControl">
			<div class="volume volume1"></div>
			<input class="bar" data-attr="rangeVolume" type="range" min="0" max="1" step="0.1" value="0.7" />
		</div>
	</div>
	</div>
	</td>
	<td valign='top' style='text-align:right;width:350px'>
	<script type="text/javascript">
    google_ad_client = "ca-pub-6904774409601870";
	google_ad_host = "pub-1556223355139109";
    google_ad_slot = "9830233637";
    google_ad_width = 300;
    google_ad_height = 600;
</script>
	</td></tr>
	</table>
	
	
	
	
	