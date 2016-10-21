package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.InfoBoard;
import spring.mvc.springPro.dao.admin.AdminInfoDao;

@Service("adminInfoService")
public class AdminInfoService extends DefaultTransactionDefinition{

	@Autowired
	AdminInfoDao adminInfoDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<InfoBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminInfoDao.selectList(pBean);

	}

	public int insertOne(InfoBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminInfoDao.insertOne(bean);

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
	
	public InfoBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminInfoDao.selectOne(num);
	}

	public int updateOne(InfoBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminInfoDao.updateOne(bean);

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
		res = adminInfoDao.deleteOne(num);

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
