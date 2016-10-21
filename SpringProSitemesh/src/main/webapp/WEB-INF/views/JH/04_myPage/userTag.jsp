<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<div class="btn-group">
  <button type="button" class="btn btn-primary" onclick="goUpdate(1)">개인 정보 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(2)">비밀번호 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(3)">장르/태그 등록 및 수정</button>
  <button type="button" class="btn btn-primary" onclick="goUpdate(4)">회원 탈퇴</button>
</div>

    
<h3>태그 및 장르 선택</h3>

<div align="center" style="border-top: 2px solid black; width:60%;">
<form action="userTag" method="post">
<table class="table" style="text-align: center; width: 60%"  >
	<tr>
		<th colspan="2" style="text-align: center">장르 및 테마 변경</th>
	</tr>
	
	<tr>
		<th>장르 선택</th>
		<td>
			<input type="checkbox" value="발라드" name="genre" />발라드&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="댄스" name="genre" />댄스&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="팝" name="genre" />팝<br>
			<input type="checkbox" value="알앤비" name="genre" />알앤비&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="힙합" name="genre" />힙합&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="락" name="genre" />락<br>
			<input type="checkbox" value="인디" name="genre" />인디&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="OST" name="genre" />OST&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="메탈" name="genre" />메탈<br>
			<input type="checkbox" value="일렉트로닉" name="genre" />일렉트로닉&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="기타" name="genre" />기타&nbsp;&nbsp;&nbsp;
			<span  style="display: none;">
			<input type="checkbox" value="def" name="genre" checked="checked" />선택안함
			</span>
		</td>
	</tr>
	
	<tr>
		<th>테마 선택</th>
		<td>
			<input type="checkbox" value="잔잔한" name="favorTheme" />잔잔한&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="신나는" name="favorTheme" />신나는&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="감성적" name="favorTheme" />감성적&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="달달한" name="favorTheme" />달달한<br>
			<input type="checkbox" value="운전할때" name="favorTheme" />운전할때&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="운동할때" name="favorTheme" />운동할때&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="클럽/파티" name="favorTheme" />클럽/파티&nbsp;&nbsp;&nbsp;<br>
			<input type="checkbox" value="크리스마스" name="favorTheme" />크리스마스
			<input type="checkbox" value="카페" name="favorTheme" />카페&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="휴식/명상" name="favorTheme" />휴식/명상&nbsp;&nbsp;&nbsp;
			<span  style="display: none;">
			<input type="checkbox" value="def" name="favorTheme" checked="checked" />선택안함
			</span>
		</td>
	</tr>
	
	<tr>
		<th>자주 듣는 시간</th>
		<td>
			<input type="checkbox" value="하루를 시작할때" name="favorTheme" />하루를 시작할때&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="집으로 가는길" name="favorTheme" />집으로 가는길&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="밤/새벽" name="favorTheme" />밤/새벽<br>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="등록하기" />
		</td>
	</tr>
	
</table>
</form>
</div>











