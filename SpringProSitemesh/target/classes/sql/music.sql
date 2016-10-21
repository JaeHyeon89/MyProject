---------------------------------------------			
---------------select--------------------------	
	
	select * from album;
	select * from song order by num;
	select * from theme;
	select * from genre;
	select * from artist;
	select * from albumComment;
		
	
	
	
---------------------------------------------			
---------------create--------------------------	
	
	create table album(
		num						number(5) primary key,
		albumName				varchar2(200) not null,
		artistName				varchar2(200),
		photoSysName			varchar2(200),  --사진파일이름(경로) 
		photoOrgName			varchar2(200),  
		sysName					varchar2(200),  --노래파일이름(경로) 
		orgName					varchar2(200),
		musicStyle				varchar2(200),	--장르 태그
		albumIntro				varchar2(200),	--앨범 설명
		recomCount 				number(10),		--추천 수
		totalCount				number(10),		--평점 토탈
		avgCount				number(5,1),	--평점 평균
		dateOfIssue				date,			--발매일
		regDate					date
	);
	create sequence album_seq
		increment by 1 start with 13001 nocycle nocache;
		
-- 사진 경로, 파일 경로
-- 곡 재생 누적 횟수, 다운로드  누적 횟수 , 추천 등수
-- 추천한 경우 판단
	
	create table song(
		num						number(5) primary key,
		albumName				varchar2(200) not null,
		songName 				varchar2(200),
		artistName				varchar2(200),	
		lyrics					varchar2(4000),	--가사 
		songIntro				varchar2(200),	--곡 설명
		youtube					varchar2(200),	--유투브명
		photoSysName			varchar2(200),  --사진파일이름(경로) 
		photoOrgName			varchar2(200), 
		sysname					varchar2(200),  --노래파일이름(경로) 
		orgname					varchar2(200),
		musicStyle				varchar2(200),	--장르 태그
		themeTag				varchar2(200),	--테마 태그
		recomCount				number(10),		--추천 카운트
		dateOfIssue				date,			--발매일
		regDate					date
	);
	create sequence song_seq
		increment by 1 start with 13001 nocycle nocache;
		
	
		
	create table theme(
		num						number(5) primary key,
		theme					varchar2(200) unique
	);
	create sequence theme_seq
		increment by 1 start with 1001 nocycle nocache;
		
		
		
	create table genre(
		num						number(5) primary key,
		genre					varchar2(200) unique
	);
	create sequence genre_seq
		increment by 1 start with 1001 nocycle nocache;
	
	
	
	create table artist(
		num						number(5) primary key,
		artistName				varchar2(200) not null,
		member					varchar2(200),	--구성원
		nationality				varchar2(200),	--국적
		photoSysName			varchar2(200),  --사진파일이름(경로) 
		photoOrgName			varchar2(200),
		sysname					varchar2(200),	--노래파일이름(경로) 
		orgname					varchar2(200),
		debut					date			--데뷔년도
	);
	create sequence artist_seq
		increment by 1 start with 14001 nocycle nocache;
	
	
		
	create table albumComment(
		num						number(5) primary key,
		albumNum				number(5),
		writer					varchar2(200),	
		content					varchar2(200),	
		regdate					date
	);
	create sequence albumComment_seq
		increment by 1 start with 13001 nocycle nocache;
	
	

	
		
		
---------------------------------------------			
---------------drop--------------------------		
		
	
	drop table album purge;
	drop sequence album_seq;
	
	drop table song purge;
	drop sequence song_seq;
	
	drop table theme purge;
	drop sequence theme_seq;
	
	drop table genre purge;
	drop sequence genre_seq;
	
	drop table artist purge;
	drop sequence artist_seq;
	
	drop table albumComment purge;
	drop sequence albumComment_seq;

	
