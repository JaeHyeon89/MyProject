package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.InfoBoard;

@Repository("adminInfoDao")
public class AdminInfoDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<InfoBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminInfo.selectList",pBean);
	}


	public int insertOne(InfoBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.insert("mapperAdminInfo.insertOne",bean);
	}
	

	public InfoBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("mapperAdminInfo.selectOne", num);
	}


	public int updateOne(InfoBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminInfo.updateOne", bean);
	}

	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminInfo.deleteOne", num);
	}
}
