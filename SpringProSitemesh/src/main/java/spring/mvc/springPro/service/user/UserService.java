package spring.mvc.springPro.service.user;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UpdateAlbumBean;
import spring.mvc.springPro.bean.user.UserAlbum;
import spring.mvc.springPro.bean.user.UserBuyList;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.bean.user.UserTheme;
import spring.mvc.springPro.dao.buy.PhoneDao;
import spring.mvc.springPro.dao.song.SongDao;
import spring.mvc.springPro.dao.user.UserAlbumDao;
import spring.mvc.springPro.dao.user.UserBuyListDao;
import spring.mvc.springPro.dao.user.UserInfoDao;
import spring.mvc.springPro.dao.user.UserThemeDao;


@Service("uServ")
public class UserService extends DefaultTransactionDefinition{

	@Resource(name="uInfoDao")
	UserInfoDao uInfoDao;
	
	@Resource(name="uBuyListDao")
	UserBuyListDao uBuyListDao;
	
	@Resource(name="uThemeDao")
	UserThemeDao uThemeDao;
	
	@Resource(name="pDao")
	PhoneDao pDao;
	
	@Resource(name="uAlbumDao")
	UserAlbumDao uAlbumDao;
	
	@Resource(name="songDao")
	SongDao songDao;

	@Autowired
	PlatformTransactionManager tx;
	
	TransactionStatus status;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	
	//회원 가입
	public Object insertOne(UserInfo bean) {
		
		String randomNick = "회원" + new Date().getTime();
		
		bean.setNickName(randomNick);
		status = tx.getTransaction(this);
		
		int res = (int)uInfoDao.insertOne(bean);
		
		if(res>0){
			int res2 = uAlbumDao.insertAlbum(bean);
			if(res2>0){
				tx.commit(status);
				System.out.println("앨범 생성까지 완료");
			}else{
				tx.rollback(status);
				System.out.println("앨범 생성 실패");
			}
		}else {
			tx.rollback(status);
			System.out.println("회원가입 오류");
		}
		return res;
	}


	public Object idCheck(UserInfo bean) {
		
		UserInfo res = (UserInfo) uInfoDao.idCheck(bean);
		return res;
	}


	public Object selectOne(UserInfo bean) {
		UserInfo res = (UserInfo) uInfoDao.selectOne(bean);
		if(res != null){
			return res;
		}else {
			return null;
		}
		
	}


//	구매내역 가져오기
	public List<Object> getBuyList(UserInfo bean) {
		status = tx.getTransaction(this);
		
//		List<Integer> tempList = uBuyListDao.getSongBuyList(bean);
//		if(tempList != null){
//			List<SongBean> songList = songDao.getSongList(tempList);
//		}
		
		
		
		List<Object> listc = uBuyListDao.getBuyList(bean);
		if(listc != null){
			tx.commit(status);
			return listc;
		}else {
			System.out.println("구매내역 가져오기에서 문제 발생");
			tx.rollback(status);
			return null;
		}
	}

//	테마 등록
	public boolean insertTheme(UserTheme theme) {
		status = tx.getTransaction(this);
		int res = (int) uThemeDao.insertTheme(theme);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("테마 저장 실패");
			tx.rollback(status);
			return false;
		}
		
	}


	public boolean updateInfoTag(UserInfo info) {
		status = tx.getTransaction(this);
		int res = (int) uInfoDao.updateTag(info);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("유저테이블 태그번호 변경 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean updateTheme(UserTheme theme) {
		status = tx.getTransaction(this);
		int res = (int) uThemeDao.updateTheme(theme);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("유저테이블 태그번호 변경 실패");
			tx.rollback(status);
			return false;
		}
	}


	public Object nickCheck(UserInfo bean) {
		return uInfoDao.nickCheck(bean);
	}


	public boolean updatePassword(UserInfo info) {
		status = tx.getTransaction(this);
		int res = (int) uInfoDao.updatePassword(info);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("유저 비밀번호 변경 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean dropInfo(UserInfo bean) {
		status = tx.getTransaction(this);
		int res = (int) uInfoDao.dropInfo(bean);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("유저 탈퇴처리 실패");
			tx.rollback(status);
			return false;
		}
	}

	// 휴대폰 인증
	public boolean phoneCheck(PhoneBean phoneBean) {
		PhoneBean res = (PhoneBean) pDao.selectOne(phoneBean);
		if(res != null){
			return true;
		}else {
			return false;
		}
		
	}


	public List<UserInfo> getFriendList(UserInfo info) {
		return uInfoDao.getFriendList(info);
	}


	public Object searchUserById(String searchName) {
		return uInfoDao.searchById(searchName);
	}


	public Object searchUserByNick(String searchName) {
		return uInfoDao.searchByNick(searchName);
	}

	public boolean addFriend(UserInfo bean) {
		status = tx.getTransaction(this);
		
		int res = uInfoDao.addFriend(bean);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("친구목록 추가 실패");
			tx.rollback(status);
			return false;
		}
	}


	public UserAlbum getMyAlbum(UserInfo info) {
		return uAlbumDao.getMyAlbum(info);
	}


	public boolean updateAlbum(UpdateAlbumBean updateAlbum) {
		status = tx.getTransaction(this);
		
		int res = uAlbumDao.updateAlbum(updateAlbum);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("앨범 목록에서 삭제 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean delFriend(UserInfo info) {
		status = tx.getTransaction(this);
		
		int res = uInfoDao.delFriend(info);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("친구 목록에서 삭제 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean addAlbum(UpdateAlbumBean updateAlbum) {
		status = tx.getTransaction(this);
		
		int res = uAlbumDao.updateAlbum(updateAlbum);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("친구 목록에서 삭제 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean updateInfo(UserInfo bean) {
		status = tx.getTransaction(this);
		
		int res = uInfoDao.updateInfo(bean);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("회원정보 수정 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean cashRefund(UserBuyList buyList) {
		status = tx.getTransaction(this);
		
		int res = uBuyListDao.refundCash(buyList);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("환불 : 구매내역 변경에서 실패");
			tx.rollback(status);
			return false;
		}
	}


	public boolean cashRefund(UserInfo bean) {
		status = tx.getTransaction(this);
		
		int res = uInfoDao.refundCash(bean);
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("환불 : 유저정보에서 실패");
			tx.rollback(status);
			return false;
		}
	}


	public Object findId(UserInfo bean) {
		Object res = uInfoDao.findId(bean);
		return res;
	}


	public Object findPw(UserInfo bean) {
		Object res = uInfoDao.findPw(bean);
		return res;
	}


	public Object userPhoneCheck(PhoneBean phoneBean) {
		return uInfoDao.userPhoneCheck(phoneBean);
	}


	public SongBean getBuyedSong(SongBean temp) {
		return songDao.getBuyedSong(temp);
	}

	
	
}

