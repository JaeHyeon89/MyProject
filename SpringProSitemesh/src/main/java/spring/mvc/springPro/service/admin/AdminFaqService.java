package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.FAQBoard;
import spring.mvc.springPro.dao.admin.AdminFaqDao;

@Service("adminFaqService")
public class AdminFaqService extends DefaultTransactionDefinition{

	@Autowired
	AdminFaqDao adminFaqDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<FAQBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminFaqDao.selectList(pBean);

	}

	public int insertOne(FAQBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminFaqDao.insertOne(bean);

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
	
	public FAQBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminFaqDao.selectOne(num);
	}

	public int updateOne(FAQBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminFaqDao.updateOne(bean);

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
		res = adminFaqDao.deleteOne(num);

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
