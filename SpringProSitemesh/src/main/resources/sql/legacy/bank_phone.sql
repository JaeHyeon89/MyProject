
	drop table phone purge;
	drop sequence phone_seq;
	drop table bank purge;
	drop sequence bank_seq;

	--핸드폰 DB
	create table phone(
		num			number(20) primary key,
		tong		varchar2(200) not null,	--통신사이름
		phoneNum	varchar2(200) unique not null, --핸드폰 번호
		name		varchar2(200) not null,
		regNum		number(20)	not null,		--생년월일
		useMoney	number(20),	 				--사용액
		MaxMoney	number(20) 	not null,		--한도액
		regDate		date
	);
	
	create sequence phone_seq 
		increment by 1 start with 1 nocycle nocache; 
	
	--은행사 DB
	create table bank(
		num				number(20) primary key,
		bankName		varchar2(200) not null,		--은행사이름
		cardNum			varchar2(20) unique not null,	--카드번호
		name			varchar2(200) not null,		
		cvnNum			number(10)	not null,		--cvn비번
		useMoney		number(20),					--사용액
		maxMoney		number(20) not null,		--한도액
		regDate			date
	);
	
	create sequence bank_seq 
		increment by 1 start with 1 nocycle nocache; 
	
	select * from PHONE;
	select * from bank;
	
	delete  from PHONE where num=2;
	
	insert into PHONE values(phone_seq.nextval, 'skt', '01011111111', 'aa', 900101, 0, 3000000, sysdate);
	insert into PHONE values(phone_seq.nextval, 'kt', '01022222222', 'bb', 800101, 0, 50000, sysdate);
	
	insert into bank values(bank_seq.nextval, '농협', '1111111111111111', 'aa', 111, 0, 3000000, sysdate);
	insert into bank values(bank_seq.nextval, '신한', '2222222222222222', 'bb', 222, 0, 50000, sysdate);
	
		update phone set useMoney=10000 where num=3;
	

	