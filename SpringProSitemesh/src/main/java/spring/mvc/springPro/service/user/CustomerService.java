package spring.mvc.springPro.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.springPro.bean.customer.UserQuestionBoard;
import spring.mvc.springPro.bean.user.UserInfo;
import spring.mvc.springPro.dao.user.CustomerDao;

@Service("cServ")
public class CustomerService extends DefaultTransactionDefinition {

	@Autowired
	CustomerDao cDAO;
	
	@Autowired
	PlatformTransactionManager tx;
	
	TransactionStatus status;
	
	
	public List<Object> getFAQ() {
		List<Object> listc = cDAO.getFAQList();
		
		return listc;
	}

	public List<Object> getInfo() {
		List<Object> listc = cDAO.getInfoList();
		
		return listc;
	}

	public boolean insertQuestion(UserQuestionBoard bean){
		status = tx.getTransaction(this);
		int res = (int) cDAO.insertQuestion(bean);
		
		if(res>0){
			tx.commit(status);
			return true;
		}else {
			System.out.println("테마 저장 실패");
			tx.rollback(status);
			return false;
		}
		
	}

	public List<Object> getMyInquire(UserInfo bean) {
		List<Object> listc = cDAO.getMyInquire(bean);
		
		return listc;
	}

	public List<Object> getUserFAQ() {
		return cDAO.getUserFAQ();
	}
	
	public List<Object> getPayFAQ() {
		return cDAO.getPayFAQ();
	}
	
	public List<Object> getMusicFAQ() {
		return cDAO.getMusicFAQ();
	}

	public boolean countMyQuestion(UserInfo bean) {
		List<Object> listc = cDAO.countMyQuestion(bean);
		
		if(listc.size() >= 5){
			return false;
		}else {
			return true;
		}
	}
	
}
