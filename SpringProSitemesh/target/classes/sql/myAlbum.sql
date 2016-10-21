
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
	
	drop table userAlbum purge;
	
	
	
	
	
	
	
	