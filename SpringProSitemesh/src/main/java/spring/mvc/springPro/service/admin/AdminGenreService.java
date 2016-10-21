package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.GenreList;
import spring.mvc.springPro.dao.admin.AdminGenreDao;

@Service("adminGenreService")
public class AdminGenreService extends DefaultTransactionDefinition{

	@Autowired
	AdminGenreDao adminGenreDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<GenreList> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminGenreDao.selectList(pBean);

	}
	
	public List<GenreList> selectList2() {
		// TODO Auto-generated method stub

		return adminGenreDao.selectList2();

	}

	public int insertOne(GenreList bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminGenreDao.insertOne(bean);

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
	
	public GenreList selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminGenreDao.selectOne(num);
	}

	public int updateOne(GenreList bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminGenreDao.updateOne(bean);

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
		res = adminGenreDao.deleteOne(num);

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
