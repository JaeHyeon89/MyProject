
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
	
	drop table commentri purge;
	
	
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
	
	
	create table theme(
		num						number(5) primary key,
		theme					varchar2(200) unique
	);
	
	create table genre(
		num						number(5) primary key,
		genre					varchar2(200) unique
	);
	
	
	
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
	
	
	
	create table commentri(
		num						number(5),
		Writer					varchar2(200),	
		Content					varchar2(200),	
		regdate					date not null
	);
	
	create table albumComment(
		num						number(5) primary key,
		albumNum				number(5),
		writer					varchar2(200),	
		content					varchar2(200),	
		regdate					date
	);
	create sequence albumComment_seq
		increment by 1 start with 10001 nocycle nocache;
	
	
	create sequence album_seq
		increment by 1 start with 10101 nocycle nocache;
	create sequence song_seq
		increment by 1 start with 10101 nocycle nocache;
	create sequence theme_seq
		increment by 1 start with 11 nocycle nocache;
	create sequence genre_seq
		increment by 1 start with 11 nocycle nocache;
	create sequence artist_seq
		increment by 1 start with 10101 nocycle nocache;
	
	select count(*) as countNum from album;	

	select * from album;
	select * from song;
	select * from theme;
	select * from genre;
	select * from artist;
	select * from commentri;
	
	
	
	update album set recomCount=recomCount+1 where num=4;
	update song set recomCount=recomCount+1 where num=4;
	
	insert into album values (album_seq.nextval,'테스트앨범','테스트가수',
								'14/12/01',null,null,'발라드','테스트용이다',0,sysdate);
	insert into album values (album_seq.nextval,'테스트앨범2','테스트가수2',
								'15/12/01',null,null,'발라드','테스트용이다',0,sysdate);
	insert into album values (album_seq.nextval,'여기는 앨범테이블','테스트가수2',
								'15/12/01',null,null,'발라드','테스트용이다',0,sysdate);							
	
								
	insert into song values (song_seq.nextval,'테스트앨범2','테스트곡1','테스트곡1 가사입니다','테스트가수2',
								'15/12/01',null,null,'발라드','1,5','테스트용이다',0,sysdate);
	insert into song values (song_seq.nextval,'테스트앨범2','테스트곡2','테스트곡2 가사입니다','테스트가수2',
								'13/12/21',null,null,'발라드','1,5','테스트용이다',0,sysdate);
	insert into song values (song_seq.nextval,'테스트앨범2','테스트곡3','테스트곡3 가사입니다','테스트가수2',
								'11/12/04',null,null,'발라드','1,5','테스트용이다',0,sysdate);
	
	insert into theme values(theme_seq.nextval,'봄');
	insert into theme values(theme_seq.nextval,'여름');
	insert into theme values(theme_seq.nextval,'가을');
	insert into theme values(theme_seq.nextval,'겨울');
	insert into theme values(theme_seq.nextval,'운전할때');
	insert into theme values(theme_seq.nextval,'운동할때');
	insert into theme values(theme_seq.nextval,'자기전에');
	insert into genre values(genre_seq.nextval,'발라드');
								
	insert into artist values (artist_seq.nextval,null,null,'테스트가수1',
								'13/11/01','한국','솔로');
	insert into artist values (artist_seq.nextval,null,null,'테스트가수2',
								'15/12/01','한국','솔로');
								
	insert into commentri values (1,'글쓴이1','곡1의 댓글1',sysdate);
	insert into commentri values (2,'글쓴이1','곡2의 댓글1',sysdate);
	insert into commentri values (3,'글쓴이1','곡3의 댓글1',sysdate);
	insert into commentri values (1,'글쓴이1','곡1의 댓글2',sysdate);
	insert into commentri values (2,'글쓴이1','곡2의 댓글2',sysdate);