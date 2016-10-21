	select * from userInfo;
	select * from userTheme;

	update userInfo set friends = '2,3' where num = 1;
	select * from userInfo where (num = 1 or num = 2 or num = 3) and grade != -1 order by num;
	
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
	
		select userInfo_seq.currval from dual;
	create sequence userInfo_seq 
		increment by 1 start with 1 nocycle nocache; 
	
	insert into USERINFO values
	(userInfo_seq.nextval, 'aa', 'aa', 123, 123, 0, 0, null , 0,  1000, 10, sysdate, sysdate);
	insert into USERINFO values
	(userInfo_seq.nextval, 'bb', 'bb', 0102211, '닉네임', 0, -1, null, 0,  1000, 10, sysdate, sysdate);
	insert into USERINFO values
	(userInfo_seq.nextval, 'master', 'master', 333, '관리자', 1, 99, null, 1,  99999, 99, sysdate+30, sysdate);
	insert into USERINFO values
	(userInfo_seq.nextval, 'hogu', 'hogu', 333, '호구', 1, 0, null, 1, 99999, 99, sysdate+30, sysdate);
	insert into USERINFO values
	(userInfo_seq.nextval, 'qw', 'qw', 333, '친구가 많아', 1, 0, '1,2,3,4', 1, 99999, 99, sysdate+30, sysdate);
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
	
	create sequence userBuyList_seq 
		increment by 1 start with 1 nocycle nocache;
	
	-- 구매내역의 num은 userInfo의 num, 중복 가능
	alter table userBuyList add constraint userBuyList_num_fk
			foreign key(num) references userInfo(num);
			
	-- 1번 고객이 캐시 5000원을 휴대폰을 충전 	
	insert into USERBUYLIST values(1, '캐시 충전', 5000, null, null, '휴대폰', 0, 0, sysdate );
	
	-- 1번 고객이 3번곡을 구매 	
	insert into USERBUYLIST values(1, '곡 구매', 0, null, null, null, 3, 0, sysdate );
	
	-- 1번 고객이 5번곡을 구매 		
	insert into USERBUYLIST values(1, '곡 구매', 0, null, null, null, 5, 0, sysdate );
	
	-- 1번 고객이 30일 30곡 티켓을 카드로 구매
	insert into USERBUYLIST values(1, '이용권 구매', 0, '30일 30곡', sysdate+30, '카드', 0, 0, sysdate );
	
	-- 1번 고객이 2번 상품을 카드로 구매
	insert into USERBUYLIST values(1, '상품 구매', 0, null, null, '카드', 0, 2, sysdate );
	
	select * from USERBUYLIST;
	
	select id,pw from USERINFO where id='aa';
	
	
	
	-- userTheme의 userNum은 userInfo의 num, 중복 불가
	select * from userTheme;
	
	create table userTheme(
		num 			number(10) primary key,
		userNum			number(10) unique not null,
		genre			varchar2(2000) null, -- 클래식, 락, 힙합, 발라드...
		hearTime		varchar2(2000) null, -- 새벽, 아침, 오후, 밤
		favorTheme		varchar2(2000) null, -- 잔잔한, 신나는, 감성적인, 우울한
		
		regDate			date not null
	);
	
	create sequence userTheme_seq 
		increment by 1 start with 1 nocycle nocache; 
	
	alter table userTheme add constraint userTheme_num_fk
			foreign key(num) references userInfo(num);
			
	drop sequence userInfo_seq;
	drop sequence userBuyList_seq;
	drop sequence userTheme_seq;
	drop table userInfo purge;
	drop table userBuyList purge;
	drop table usertheme purge;
	insert into userInfo values(userInfo_seq.nextval, 'ab', 11, 11, 'guest'+userInfo_seq.currval, 11, sysdate);
	insert into userTheme values(11, 2,2,2,2);
