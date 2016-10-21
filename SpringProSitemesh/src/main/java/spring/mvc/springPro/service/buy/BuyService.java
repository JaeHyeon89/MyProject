package spring.mvc.springPro.service.buy;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.buy.BankBean;
import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.buy.UserBuyList;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.dao.buy.BuyDao;


@Service("BuyService")
public class BuyService extends DefaultTransactionDefinition{
	
	@Resource(name="buyDao")
	BuyDao buyDao;
	
	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public PhoneBean phoneSelectOne(PhoneBean pBean) {	//핸드폰 사용자 가져오기
		
		return buyDao.phoneSelectOne(pBean);
	}

	public int updatePhoneCash(UserInfo user, PhoneBean phoneBean, UserBuyList buyList) {	//핸드폰 캐시충전
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateCash(user);

			int res2=this.buyDao.updatePhone(phoneBean); //핸드폰 사용액 증가시키기

			int res3=this.buyDao.insertBuyList(buyList);

			if(res1>0 && res2>0 && res3>0){
				tx.commit(status);
				res=1;
			}
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		return res;
	}


	public UserInfo userSelOne(String id) {
		return buyDao.userSelOne(id);
	}

	public BankBean bankSelectOne(BankBean bBean) {
		
		
		return buyDao.bankSelectOne(bBean);
	}

	public int updateCardCash(UserInfo user, BankBean bankBean, UserBuyList buyList) {	//카드 캐시충전
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateCash(user);
			
			int res2=this.buyDao.updateBank(bankBean); //은행 사용액 증가시키기
			
			int res3=this.buyDao.insertBuyList(buyList);
			
			if(res1>0 && res2>0 && res3>0){
				tx.commit(status);
				res=1;
			}
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		return res;
	}

	public int updatePhoneTicket(UserInfo user, PhoneBean phoneBean, UserBuyList buyList) { //핸드폰 이용권 구입
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateTicket(user);

			int res2=this.buyDao.updatePhone(phoneBean); //핸드폰 사용액 증가시키기

			int res3=this.buyDao.insertTiBuyList(buyList);

			if(res1>0 && res2>0 && res3>0){
				tx.commit(status);
				res=1;
			}
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		return res;
	}

	public int updateCardTicket(UserInfo user, BankBean bankBean, UserBuyList buyList) {
		
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateTicket(user);

			int res2=this.buyDao.updateBank(bankBean); //은행 사용액 증가시키기

			int res3=this.buyDao.insertTiBuyList(buyList);

			if(res1>0 && res2>0 && res3>0){
				tx.commit(status);
				res=1;
			}
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		return res;
	}

	public UserBuyList selBuyListOne(UserBuyList tmp) {
		return buyDao.selBuyListOne(tmp);
	}

	public SongBean selSongOne(int num) {
		return buyDao.selSongOne(num);
	}

	public int tiMusicCharge(UserInfo user, List<UserBuyList> buyListc) {
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateTicket(user);
			int res2;
			
			for(UserBuyList each : buyListc){
				res2=this.buyDao.insertTiBuyListMusic(each);
				if(res2==0){
					tx.rollback(status);
					return 0;
				}
			}
			
			tx.commit(status);
			res=1;
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		
		return res;
	}

	public int cashMusicCharge(UserInfo user, List<UserBuyList> buyListc) {
		int res=0;
		status=tx.getTransaction(this);
		
		try {
			int res1=this.buyDao.updateCash(user);
			int res2;
			
			for(UserBuyList each : buyListc){
				res2=this.buyDao.insertTiBuyListMusic(each);
				if(!(res2>0)){	//실패하면 롤백
					tx.rollback(status);
					return 0;
				}
			}
			if(!(res1>0)){	//실패하면 롤백
				tx.rollback(status);
				return 0;
			}
			
			tx.commit(status);
			res=1;
			
		} catch (Exception e) {
			tx.rollback(status);
			res=0;
		}
		
		
		return res;
	}

	public AlbumBean albumSelOne(int albumNum) {
		return this.buyDao.albumSelOne(albumNum);
	}

	public List<SongBean> selSongList(AlbumBean albumBean) {
		return this.buyDao.selSongList(albumBean);
	}
	
	
}
