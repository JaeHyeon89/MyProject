package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.dao.admin.AdminUserQuestionDao;

@Service("adminUserQuestionService")
public class AdminUserQuestionService extends DefaultTransactionDefinition{

	@Autowired
	AdminUserQuestionDao adminUserQuestionDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<UserQuestionBoard> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminUserQuestionDao.selectList(pBean);
	}
	
	public List<UserQuestionBoard> selectListA(PageBean pBean) {
		// TODO Auto-generated method stub
		return adminUserQuestionDao.selectListA(pBean);
	}
	
	public List<UserQuestionBoard> selectList2() {
		// TODO Auto-generated method stub

		return adminUserQuestionDao.selectList2();
	}

	public int insertOne(UserQuestionBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminUserQuestionDao.insertOne(bean);

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
	
	public UserQuestionBoard selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminUserQuestionDao.selectOne(num);
	}

	public int updateOne(UserQuestionBoard bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminUserQuestionDao.updateOne(bean);

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
		res = adminUserQuestionDao.deleteOne(num);

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
