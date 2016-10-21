package spring.mvc.springPro.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminJK/total")
public class AdminTotalController {

	@RequestMapping("/{view}")
	public String works(@PathVariable String view){
		
		System.out.println("view : "+view);
		
		return "adminJK/total/"+view;
	}

}


