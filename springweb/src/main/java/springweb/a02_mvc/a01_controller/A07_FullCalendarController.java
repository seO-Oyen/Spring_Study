package springweb.a02_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A07_FullCalendarController {
	
	@GetMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a03_mvc\\a12_fullcalendar.jsp";
	}

}
