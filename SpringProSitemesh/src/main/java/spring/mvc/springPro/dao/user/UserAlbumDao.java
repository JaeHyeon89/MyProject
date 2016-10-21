package spring.mvc.springPro.dao.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.user.UpdateAlbumBean;
import spring.mvc.springPro.bean.user.UserAlbum;
import spring.mvc.springPro.bean.user.UserInfo;

@Repository("uAlbumDao")
public class UserAlbumDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public UserAlbum getMyAlbum(UserInfo info) {
		return sqlSessionTemplate.selectOne("mapperUserAlbum.selectAlbum", info);
	}

	public int insertAlbum(UserInfo bean) {
		return sqlSessionTemplate.insert("mapperUserAlbum.insertAlbum", bean);
	}

	public int updateAlbum(UpdateAlbumBean updateAlbum) {
		return sqlSessionTemplate.update("mapperUserAlbum.updateAlbum", updateAlbum);
	}

	
	
}
