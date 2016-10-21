package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.song.ThemeList;
import spring.mvc.springPro.dao.admin.AdminThemeDao;

@Service("adminThemeService")
public class AdminThemeService extends DefaultTransactionDefinition{

	@Autowired
	AdminThemeDao adminThemeDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<ThemeList> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminThemeDao.selectList(pBean);

	}
	
	public List<ThemeList> selectList2() {
		// TODO Auto-generated method stub

		return adminThemeDao.selectList2();

	}

	public int insertOne(ThemeList bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminThemeDao.insertOne(bean);

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
	
	public ThemeList selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminThemeDao.selectOne(num);
	}

	public int updateOne(ThemeList bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminThemeDao.updateOne(bean);

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
		res = adminThemeDao.deleteOne(num);

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
