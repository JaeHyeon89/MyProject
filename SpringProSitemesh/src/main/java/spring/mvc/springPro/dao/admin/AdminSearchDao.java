package spring.mvc.springPro.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserInfo;

@Repository("adminSearchDao")
public class AdminSearchDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	

	public List<SongBean> resultSongList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminSearch.resultSongList",pBean);
	}


	public List<AlbumBean> resultAlbumList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminSearch.resultAlbumList",pBean);
	}


	public List<ArtistBean> resultArtistList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminSearch.resultArtistList",pBean);
	}


	public List<UserInfo> resultUserList(PageBean pBean) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectList("mapperAdminSearch.resultUserList",pBean);
	}

}
