package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.AlbumBean;
import spring.mvc.springPro.bean.song.AlbumCommentBean;
import spring.mvc.springPro.dao.admin.AdminAlbumDao;

@Service("adminAlbumService")
public class AdminAlbumService extends DefaultTransactionDefinition {

	@Autowired
	AdminAlbumDao adminAlbumDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<AlbumBean> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminAlbumDao.selectList(pBean);

	}

	public List<AlbumBean> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminAlbumDao.selectListA(pBean);
	}
	
	public int insertOne(AlbumBean bean) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminAlbumDao.insertOne(bean);

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

	public AlbumBean selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminAlbumDao.selectOne(num);
	}

	public int updateOne(AlbumBean bean) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminAlbumDao.updateOne(bean);

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
		res = adminAlbumDao.deleteOne(num);

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

	public List<AlbumCommentBean> commentSelectList(Integer albumNum) {
		// TODO Auto-generated method stub
		return adminAlbumDao.commentSelectList(albumNum);
	}

	public int commentInsertOne(AlbumCommentBean bean) {
		// TODO Auto-generated method stub
		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminAlbumDao.commentInsertOne(bean);

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

	public int commentUpdateOne(AlbumCommentBean bean) {
		// TODO Auto-generated method stub

		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminAlbumDao.commentUpdateOne(bean);

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

	public int commentDeleteOne(Integer num) {
		// TODO Auto-generated method stub
		// 진행 시점 잡기
		status = tx.getTransaction(this);

		int res = 0;
		res = adminAlbumDao.commentDeleteOne(num);

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
