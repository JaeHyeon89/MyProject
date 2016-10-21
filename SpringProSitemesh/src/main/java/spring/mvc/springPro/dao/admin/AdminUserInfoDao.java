package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.user.UserInfo;

@Repository("adminUserInfoDao")
public class AdminUserInfoDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<UserInfo> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminUserInfo.selectList",pBean);
		
	}


	public int insertOne(UserInfo bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminUserInfo.insertOne",bean);
	}
	

	public UserInfo selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminUserInfo.selectOne", num);
	}


	public int updateOne(UserInfo bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminUserInfo.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminUserInfo.deleteOne", num);
	}
}
