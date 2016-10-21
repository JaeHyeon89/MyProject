package spring.mvc.springPro.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.PageBean;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.dao.admin.AdminUserInfoDao;

@Service("adminUserInfoService")
public class AdminUserInfoService extends DefaultTransactionDefinition{

	@Autowired
	AdminUserInfoDao adminUserInfoDao;

	@Autowired
	PlatformTransactionManager tx;
	TransactionStatus status;

	public List<UserInfo> selectList(PageBean pBean) {
		// TODO Auto-generated method stub

		return adminUserInfoDao.selectList(pBean);

	}

	public int insertOne(UserInfo bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminUserInfoDao.insertOne(bean);

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
	
	public UserInfo selectOne(Integer num) {
		// TODO Auto-generated method stub
		return adminUserInfoDao.selectOne(num);
	}

	public int updateOne(UserInfo bean) {
		// TODO Auto-generated method stub
		
		// 진행 시점 잡기
		status = tx.getTransaction(this);
		
		int res = 0;
		res = adminUserInfoDao.updateOne(bean);

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
		res = adminUserInfoDao.deleteOne(num);

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
