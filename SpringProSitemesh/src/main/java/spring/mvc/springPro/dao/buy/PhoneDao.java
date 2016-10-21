package spring.mvc.springPro.dao.buy;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.buy.PhoneBean;

@Repository("pDao")
public class PhoneDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Object selectOne(PhoneBean phoneBean) {
		
		return sqlSessionTemplate.selectOne("mapperUserInfo.phoneCheck", phoneBean);
	}
	
}
