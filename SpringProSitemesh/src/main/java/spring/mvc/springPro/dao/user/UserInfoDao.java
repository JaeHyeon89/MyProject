package spring.mvc.springPro.dao.user;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.buy.PhoneBean;
import spring.mvc.springPro.bean.user.UserInfo;


@Repository("uInfoDao")
public class UserInfoDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Object insertOne(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.insertOne", bean);
	}

	public Object idCheck(UserInfo bean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.idCheck", bean);
	}

	public Object selectOne(UserInfo bean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.selectOne", bean);
	}

	public Object updateTag(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.updateTag", bean);
	}

	public Object nickCheck(UserInfo bean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.nickCheck", bean);
	}

	public Object updatePassword(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.password", bean);
	}

	public Object dropInfo(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.dropInfo", bean);
	}

	public List<UserInfo> getFriendList(UserInfo bean) {
		return sqlSessionTemplate.selectList("mapperUserInfo.getFriendList", bean);
	}

	public Object searchById(String searchName) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.searchById", searchName);
	}

	public Object searchByNick(String searchName) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.searchByNick", searchName);
	}

	public int addFriend(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.addFriend", bean);
	}

	public int delFriend(UserInfo info) {
		return sqlSessionTemplate.update("mapperUserInfo.delFriend", info);
	}

	public int updateInfo(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.updateInfo", bean);
	}

	public int refundCash(UserInfo bean) {
		return sqlSessionTemplate.update("mapperUserInfo.refundCash", bean);
	}

	public Object findId(UserInfo bean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.idFind", bean);
	}

	public Object findPw(UserInfo bean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.pwFind", bean);
	}

	public Object userPhoneCheck(PhoneBean phoneBean) {
		return sqlSessionTemplate.selectOne("mapperUserInfo.userPhone", phoneBean);
	}

}
