package spring.mvc.springPro.dao.user;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.springPro.bean.user.UserTheme;

@Repository("uThemeDao")
public class UserThemeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public Object insertTheme(UserTheme theme) {
		return sqlSessionTemplate.insert("mapperUserTheme.insertTheme", theme);
	}

	public int updateTheme(UserTheme theme) {
		return sqlSessionTemplate.update("mapperUserTheme.updateTheme", theme);
	}

}
