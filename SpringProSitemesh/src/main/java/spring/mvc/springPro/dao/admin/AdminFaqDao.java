package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.FAQBoard;

@Repository("adminFaqDao")
public class AdminFaqDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<FAQBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminFaq.selectList",pBean);
	}


	public int insertOne(FAQBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.insert("mapperAdminFaq.insertOne",bean);
	}
	

	public FAQBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("mapperAdminFaq.selectOne", num);
	}


	public int updateOne(FAQBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminFaq.updateOne", bean);
	}

	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminFaq.deleteOne", num);
	}
}
