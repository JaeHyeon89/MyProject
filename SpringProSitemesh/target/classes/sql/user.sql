---------------------------------------------			
---------------select--------------------------	
	
	select * from userInfo;
	select * from USERBUYLIST;
	select * from userTheme;

	
	
	
---------------------------------------------			
---------------create--------------------------	
	
	
	create table userInfo(
		num				number(10) primary key,
		id				varchar2(200) unique not null,
		pw				varchar2(200) not null,
		phone 			varchar2(200) not null,
		nickname 		varchar2(200) unique,
		adult			number(5)	not null,	-- 성인인증했는지 확인, 했다면 1, 아니면 0(기본값)
		grade			number(5),			-- 등급, 기본 0(기본값), 관리자99, 탈퇴 -1
		friends			varchar2(2000) null,-- 친구 목록, 유저의 고유번호가 ,로 구분되어 들어감
		
		tagSelect		number(5) not null,	-- 태그를 등록했는지 아닌지(최초만 확인), 등록했다면 1, 아니면 0(기본값)
		
		cash			number(5),			-- 잔여 캐시량
		remainMusic		number(5),			-- 티켓 사용중이라면 남은 곡 수
		ticketEnd		date,				-- 티켓 종료일
		
		regDate			date				-- 회원가입 날짜
	);
	create sequence userInfo_seq increment by 1 start with 13001 nocycle nocache; 

	

		
	-- 구매 내역
	create table userBuyList(
		num			number(10) not null,	-- 충전한 고객의 고유번호
		
		classify		varchar2(200) not null,	-- 구매 분류 ex) 캐시 충전일 시 - 캐시, 곡 구매일 시 - 곡 구매
		
		cashCharge		number(10), 			-- 캐시 충전이라면 얼마인지 기입
		
		ticket			varchar2(200),			-- 티켓 구매라면 티켓 이름이 들어감
		ticketEnd		date, 					--regDate(sysdate)에서 30일 추가
		chargeWay		varchar2(200), 			--충전 방식(휴대폰/카드/캐시)
		
		buyMusic		number(15),				--구매한 곡번호
		buyArticle		number(15),				--구매한 물품 번호
		
		regDate			date 					-- 구매한 날짜
	);
	-- 구매내역의 num은 userInfo의 num, 중복 가능

			
			

	-- userTheme의 userNum은 userInfo의 num, 중복 불가
	create table userTheme(
		num 			number(10) primary key,
		userNum			number(10) unique not null,
		genre			varchar2(2000) null, -- 클래식, 락, 힙합, 발라드...
		favorTheme		varchar2(2000) null, -- 잔잔한, 신나는, 감성적인, 우울한
		
		regDate			date not null
	);
	create sequence userTheme_seq 
		increment by 1 start with 11001 nocycle nocache; 	

			
			
			
			
			
			
---------------------------------------------			
---------------drop--------------------------
			
	drop table userInfo purge;
	drop sequence userInfo_seq;
	
	drop table userBuyList purge;
	
	drop table usertheme purge;
	drop sequence userTheme_seq;

