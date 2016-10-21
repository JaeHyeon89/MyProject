package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.bean.song.SongBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.dao.admin.AdminSearchDao;

@Service("adminSearchService")
public class AdminSearchService extends DefaultTransactionDefinition{

	@Autowired
	AdminSearchDao adminSearchDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;


	public List<SongBean> resultSongList(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminSearchDao.resultSongList(pBean);
	}

	public List<AlbumBean> resultAlbumList(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminSearchDao.resultAlbumList(pBean);
	}

	public List<ArtistBean> resultArtistList(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminSearchDao.resultArtistList(pBean);
	}

	public List<UserInfo> resultUserList(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminSearchDao.resultUserList(pBean);
	}

}
