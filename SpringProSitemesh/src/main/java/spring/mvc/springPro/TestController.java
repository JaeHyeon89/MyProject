package spring.mvc.springPro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test/{view}")
public class TestController {

	@RequestMapping
	public String works(@PathVariable String view){
		System.out.println("view = "+view);
		
		return "test/"+view;
	}
}
