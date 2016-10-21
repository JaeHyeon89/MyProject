package spring.mvc.springPro.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//@Component
public class InterceptHandler extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUri = request.getRequestURI();
		System.out.println("pre핸들러");
		
		if(reqUri.contains("04_myPage/update")){
			System.out.println("하하");
			return true;
		}
		System.out.println("호호");
		return false;
	}
	
	
}
