package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.AlbumCommentBean;

@Repository("adminAlbumDao")
public class AdminAlbumDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<AlbumBean> selectList(PageBean pBean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectList("mapperAdminAlbum.selectList",pBean);
		
	}
	public List<AlbumBean> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminAlbum.selectListA",pBean);
	}

	public int insertOne(AlbumBean bean) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.insert("mapperAdminAlbum.insertOne",bean);
	}
	

	public AlbumBean selectOne(Integer num) {
		// TODO Auto-generated method stub
		
		return this.sqlSessionTemplate.selectOne("mapperAdminAlbum.selectOne", num);
	}


	public int updateOne(AlbumBean bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminAlbum.updateOne", bean);
	}
	
	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminAlbum.deleteOne", num);
	}


	public List<AlbumCommentBean> commentSelectList(Integer albumNum) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminAlbum.commentSelectList",albumNum);
	}


	public int commentInsertOne(AlbumCommentBean bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.insert("mapperAdminAlbum.commentInsertOne",bean);
	}


	public int commentUpdateOne(AlbumCommentBean bean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminAlbum.commentUpdateOne", bean);
	}


	public int commentDeleteOne(Integer num) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.update("mapperAdminAlbum.commentDeleteOne", num);
	}





}
