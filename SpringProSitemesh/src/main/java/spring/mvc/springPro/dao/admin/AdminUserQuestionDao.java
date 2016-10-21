package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.bean.song.GenreList;

@Repository("adminUserQuestionDao")
public class AdminUserQuestionDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<UserQuestionBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminUserQuestion.selectList",pBean);
	}

	public List<UserQuestionBoard> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminUserQuestion.selectListA",pBean);
	}
	
	public List<UserQuestionBoard> selectList2() {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminUserQuestion.selectList2");
		
	}

	public int insertOne(UserQuestionBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.insert("mapperAdminUserQuestion.insertOne",bean);
	}
	

	public UserQuestionBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("mapperAdminUserQuestion.selectOne", num);
	}


	public int updateOne(UserQuestionBoard bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminUserQuestion.updateOne", bean);
	}

	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminUserQuestion.deleteOne", num);
	}


}
