package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.SongBean;

@Repository("adminSongDao")
public class AdminSongDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<SongBean> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminSong.selectList",pBean);
		
	}
	public List<SongBean> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminSong.selectListA",pBean);
	}

	public int insertOne(SongBean bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminSong.insertOne",bean);
	}
	

	public SongBean selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminSong.selectOne", num);
	}


	public int updateOne(SongBean bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminSong.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminSong.deleteOne", num);
	}



}
