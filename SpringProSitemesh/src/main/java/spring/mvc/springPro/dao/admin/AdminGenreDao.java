package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.GenreList;

@Repository("adminGenreDao")
public class AdminGenreDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<GenreList> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminGenre.selectList",pBean);
		
	}
	
	public List<GenreList> selectList2() {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminGenre.selectList2");
		
	}


	public int insertOne(GenreList bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminGenre.insertOne",bean);
	}
	

	public GenreList selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminGenre.selectOne", num);
	}


	public int updateOne(GenreList bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminGenre.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminGenre.deleteOne", num);
	}
}
