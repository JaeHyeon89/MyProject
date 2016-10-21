package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.ArtistBean;
import spring.mvc.springPro.dao.admin.AdminArtistDao;

@Service("adminArtistService")
public class AdminArtistService extends DefaultTransactionDefinition {

	@Autowired
	AdminArtistDao adminArtistDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<ArtistBean> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminArtistDao.selectList(pBean);

	}
	
	public List<ArtistBean> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminArtistDao.selectListA(pBean);
	}

	public int insertOne(ArtistBean bean) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminArtistDao.insertOne(bean);

		try {

			if (res > 0) {
				tx.commit(status);
			} else {
				if (!status.isCompleted()) {
					tx.rollback(status);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	public ArtistBean selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminArtistDao.selectOne(num);
	}

	public int updateOne(ArtistBean bean) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminArtistDao.updateOne(bean);

		try {

			if (res > 0) {
				tx.commit(status);
			} else {
				if (!status.isCompleted()) {
					tx.rollback(status);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	public int deleteOne(Integer num) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminArtistDao.deleteOne(num);

		try {

			if (res > 0) {
				tx.commit(status);
			} else {
				if (!status.isCompleted()) {
					tx.rollback(status);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;

	}


}
