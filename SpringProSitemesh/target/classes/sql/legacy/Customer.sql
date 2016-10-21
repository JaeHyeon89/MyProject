
	select * from FAQ;
	select * from info;
	select * from userQuestion;
	
	-- FAQ 게시판 --
	-- 넘버, 분류, 제목, 내용, 등록일 --
	create table FAQ(
		num		number(5) primary key,
		category	varchar2(200)  not null, -- 분류(환불/결제/회원정보 등)	
		title	varchar2(200) not null, -- 제목
		content	varchar2(2000) not null, -- 내용
		regDate	date					-- 등록일
	);
	
	create sequence FAQ_seq 
		increment by 1 start with 1 nocycle nocache;
	
	insert into FAQ values(
		FAQ_seq.nextval, '결제/환불', '환불은 어떻게 하나요?', '그런거 없다', sysdate 
	);
	insert into FAQ values(
		FAQ_seq.nextval, '회원가입/변경/탈퇴', '아이디는 못 바꾸나요?', '어', sysdate 
	);
	insert into FAQ values(
		FAQ_seq.nextval, '음악재생', '재생이 안돼요.', '컴퓨터를 새로 사세요', sysdate 
	);
	insert into FAQ values(
		FAQ_seq.nextval, '결제/환불', '무통장 입금은 안되나요?', '번거롭게 하지말고 그냥 휴대폰으로 결제하세요', sysdate 
	);
	
	
	
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
		increment by 1 start with 1 nocycle nocache;
	
	insert into userQuestion values(
		userQuestion_seq.nextval, 0, '회원1', '결제/환불', '환불할래요', '내 돈 내놔',sysdate 
	);
		
	-- 공지&이벤트 게시판 --

	
	create table info(
		num 		number(10) primary key, 
		infoType	varchar2(200) not null, -- 공지사항 또는 이벤트
		title 		varchar2(200) not null, -- 제목
		content		varchar2(2000) not null, -- 내용
		regDate		date not null -- 등록일
	);
	
	create sequence info_seq
		increment by 1 start with 1 nocycle nocache;
		
		
	insert into info values(
		info_seq.nextval, '공지사항', '결제 좀 많이 하세요', '우리도 좀 먹고삽시다', sysdate
	);
	insert into info values(
		info_seq.nextval, '공지사항', '환불충들 보아라', '환불 좀 작작 해라', sysdate
	);
	insert into info values(
		info_seq.nextval, '이벤트', '팬 사인회 이벤트!', '그런거 없다', sysdate
	);
	insert into info values(
		info_seq.nextval, '이벤트', '추첨 이벤트 당첨자 발표!', '그리고 아무도 없었다', sysdate
	);
		
	drop table info purge;
	drop table FAQ purge;
	drop table userQuestion purge;
	drop sequence info_seq;
	drop sequence FAQ_seq;
	drop sequence userQuestion_seq;
	
