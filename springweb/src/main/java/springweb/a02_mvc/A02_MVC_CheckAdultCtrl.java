package springweb.a02_mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class A02_MVC_CheckAdultCtrl {
	
	@RequestMapping("checkAdult.do")
	public String checkAdult(
				@RequestParam(value = "age", defaultValue = "0") int age,
				Model d
			) {
		String adultResult = "";
		if (age >= 18) {
			adultResult = "성인입니다.";
			
		} else if (age != 0) {
			adultResult = "미성년입니다.";
		}
		
		d.addAttribute("result", adultResult);
		return "WEB-INF\\views\\a02_modelView\\a04_checkAdult.jsp";
	}

}
