package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.ArtistBean;

@Repository("adminArtistDao")
public class AdminArtistDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<ArtistBean> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminArtist.selectList",pBean);
		
	}
	public List<ArtistBean> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminArtist.selectListA",pBean);
	}

	public int insertOne(ArtistBean bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminArtist.insertOne",bean);
	}
	

	public ArtistBean selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminArtist.selectOne", num);
	}


	public int updateOne(ArtistBean bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminArtist.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminArtist.deleteOne", num);
	}



}
