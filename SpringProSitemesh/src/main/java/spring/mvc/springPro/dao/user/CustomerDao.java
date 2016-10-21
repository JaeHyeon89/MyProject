package spring.mvc.springPro.dao.user;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.bean.user.UserInfo;

@Repository("cDAO")
public class CustomerDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<Object> getFAQList() {
		return sqlSessionTemplate.selectList("mapperCustomer.faqList");
	}

	public List<Object> getInfoList() {
		return sqlSessionTemplate.selectList("mapperCustomer.infoList");
	}

	public int insertQuestion(UserQuestionBoard bean) {
		return sqlSessionTemplate.insert("mapperCustomer.insertQuestion", bean);
	}

	public List<Object> getMyInquire(UserInfo bean) {
		return sqlSessionTemplate.selectList("mapperCustomer.myQuestion", bean);
	}

	public List<Object> getUserFAQ() {
		return sqlSessionTemplate.selectList("mapperCustomer.userFAQ");
	}

	public List<Object> getPayFAQ() {
		return sqlSessionTemplate.selectList("mapperCustomer.payFAQ");
	}

	public List<Object> getMusicFAQ() {
		return sqlSessionTemplate.selectList("mapperCustomer.musicFAQ");
	}

	public List<Object> countMyQuestion(UserInfo bean) {
		return sqlSessionTemplate.selectList("mapperCustomer.countQuestion", bean);
	}

	
	
}
