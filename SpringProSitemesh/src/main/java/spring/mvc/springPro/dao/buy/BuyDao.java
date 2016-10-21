package spring.mvc.springPro.dao.buy;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.bean.buy.BankBean;
import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.buy.UserBuyList;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.SongBean;



@Repository("buyDao")
public class BuyDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public PhoneBean phoneSelectOne(PhoneBean pBean) {
		
		return sqlSessionTemplate.selectOne("mapperBuy.phoneSelOne", pBean);
	}

	public int updateCash(UserInfo user) {
		
		return sqlSessionTemplate.update("mapperBuy.updateCash", user);
	}

	public int updatePhone(PhoneBean phoneBean) {
		return sqlSessionTemplate.update("mapperBuy.updatePhone", phoneBean);
	}

	public UserInfo userSelOne(String id) {
		return sqlSessionTemplate.selectOne("mapperBuy.userSelOne", id);
	}

	public int insertBuyList(UserBuyList buyList) {
		return sqlSessionTemplate.insert("mapperBuy.insertBuyPhoneList", buyList);
	}

	public BankBean bankSelectOne(BankBean bBean) {
		return sqlSessionTemplate.selectOne("mapperBuy.bankSelOne", bBean);
	}

	public int updateBank(BankBean bankBean) {
		return sqlSessionTemplate.update("mapperBuy.updateBank", bankBean);
	}

	public int insertTiBuyList(UserBuyList buyList) {
		
		return sqlSessionTemplate.insert("mapperBuy.insertTiBuyList", buyList);
	}

	public int updateTicket(UserInfo user) {
		return sqlSessionTemplate.update("mapperBuy.updateTicket", user);
	}

	public UserBuyList selBuyListOne(UserBuyList tmp) {
		return sqlSessionTemplate.selectOne("mapperBuy.selBuyListOne", tmp);
	}

	public SongBean selSongOne(int num) {
		return sqlSessionTemplate.selectOne("mapperBuy.selectOne", num);
	}

	public int insertTiBuyListMusic(UserBuyList each) {
		return sqlSessionTemplate.update("mapperBuy.insertTiBuyListMusic", each);
	}

	public AlbumBean albumSelOne(int albumNum) {
		return sqlSessionTemplate.selectOne("mapperBuy.albumSelOne", albumNum);
	}

	public List<SongBean> selSongList(AlbumBean albumBean) {
		return sqlSessionTemplate.selectList("mapperBuy.selSongList", albumBean);
	}
	
	
	
}
