---------------------------------------------			
---------------select--------------------------	
	select * from FAQ;
	select * from info;
	select * from userQuestion;
	

---------------------------------------------			
---------------create--------------------------		
	
	-- FAQ 게시판 --
	-- 넘버, 분류, 제목, 내용, 등록일 --
	create table FAQ(
		num			number(5) primary key,
		category	varchar2(200)  not null, -- 분류(환불/결제/회원정보 등)	
		title		varchar2(200) not null, -- 제목
		content		varchar2(2000) not null, -- 내용
		regDate		date					-- 등록일
	);
	create sequence FAQ_seq 
		increment by 1 start with 13001 nocycle nocache;
	
	
	-- 1:1문의 게시판 --
	-- 넘버, 답변 유무, 글쓴이, 분류, 제목, 내용, 등록일 --
	create table userQuestion(
		num 		number(10) primary key, 
		answer		number(10) not null, -- 답변 안했으면 0(기본값), 답변 완료라면 1
		writer		varchar2(200) not null, -- 글쓴이
		category	varchar2(200) not null, -- 분류(환불/회원정보..)
		title 		varchar2(200) not null, -- 제목
		content		varchar2(2000) not null, -- 내용
		regDate		date  not null-- 등록일
	);
	create sequence userQuestion_seq
		increment by 1 start with 13001 nocycle nocache;
	
	
	-- 공지&이벤트 게시판 --
	create table info(
		num 		number(10) primary key, 
		infoType	varchar2(200) not null, -- 공지사항 또는 이벤트
		title 		varchar2(200) not null, -- 제목
		content		varchar2(2000) not null, -- 내용
		regDate		date not null -- 등록일
	);
	create sequence info_seq
		increment by 1 start with 13001 nocycle nocache;
	
		
		
		
		
---------------------------------------------			
---------------drop--------------------------
		
	drop table info purge;
	drop sequence info_seq;

	drop table FAQ purge;
	drop sequence FAQ_seq;

	drop table userQuestion purge;
	drop sequence userQuestion_seq;
	
