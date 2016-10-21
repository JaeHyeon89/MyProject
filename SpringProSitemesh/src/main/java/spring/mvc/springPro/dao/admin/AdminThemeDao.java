package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.ThemeList;

@Repository("adminThemeDao")
public class AdminThemeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<ThemeList> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminTheme.selectList",pBean);
		
	}
	
	public List<ThemeList> selectList2() {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminTheme.selectList2");
		
	}


	public int insertOne(ThemeList bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminTheme.insertOne",bean);
	}
	

	public ThemeList selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminTheme.selectOne", num);
	}


	public int updateOne(ThemeList bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminTheme.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminTheme.deleteOne", num);
	}
}
