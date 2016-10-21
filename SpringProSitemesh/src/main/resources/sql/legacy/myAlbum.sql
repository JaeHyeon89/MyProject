
	select * from userAlbum;
	
	create table userAlbum(
		userNum			number(10) primary key,
		albumName1		varchar2(200),	
		albumName2 		varchar2(200),
		albumName3		varchar2(200),
		albumContent1	varchar2(2000),
		albumContent2	varchar2(2000),
		albumContent3	varchar2(2000)
	);

	-- 구매내역의 num은 userInfo의 num, 중복 가능
	alter table userAlbum add constraint userAlbum_userNum_fk
			foreign key(userNum) references userInfo(num);

	insert into userAlbum values
	(1, '내 앨범1번', '귀찮을 때 듣는음악', 'saa', '10009,10012,10013,10014', '10012,10015,10087', null);

	update userAlbum set albumContent1 = '1,2,3,4,5' where userNum = 1;
	
	
	insert into userAlbum values
	(userInfo_seq.currval, null, null, null, null, null, null);
	

	select * from tempMusic where num = 4 or num = 2 or num = 22;
	
	create table tempMusic(
		num			number(10) 		primary key,
		albumName	varchar2(200) 	not null,
		songName	varchar2(200)	not null,
		artistName	varchar2(200)	not null
	);
	
	insert into tempMusic values(1,	'싸이 7집', '나팔 바지', '싸이');
	insert into tempMusic values(2,	'누군가의 앨범', '누군가의 노래', '누군가');
	insert into tempMusic values(3,	'이름없는 앨범', '이름없는 노래', '이름없는 가수');
	insert into tempMusic values(4,	'싸이 1집', '새', '싸이');
	insert into tempMusic values(5,	'싸이 2집', '챔피언', '싸이');
	insert into tempMusic values(6,	'귀찮은 앨범', '귀찮은 노래', '귀찮은 가수');
	
	
	
	
	drop table userAlbum purge;
	
	
	
	
	
	
	
	