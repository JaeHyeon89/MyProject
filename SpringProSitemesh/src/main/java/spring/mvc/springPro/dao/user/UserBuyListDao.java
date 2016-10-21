package spring.mvc.springPro.dao.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.user.UserBuyList;
import spring.mvc.springPro.bean.user.UserInfo;

@Repository("uBuyListDao")
public class UserBuyListDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Object> getBuyList(UserInfo bean) {
		return sqlSessionTemplate.selectList("mapperMypage.getBuyList", bean);
	}

	public int refundCash(UserBuyList buyList) {
		return sqlSessionTemplate.insert("mapperMypage.refundCash", buyList);
	}

//	public List<Integer> getSongBuyList(UserInfo bean) {
//		return sqlSessionTemplate.selectList("mapperMypage.getSongBuyList", bean);
//	}

	
	
}
