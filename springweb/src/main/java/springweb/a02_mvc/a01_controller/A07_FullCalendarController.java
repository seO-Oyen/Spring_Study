package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import springweb.a02_mvc.a02_service.A07_CalendarService;
import springweb.z01_vo.Calendar;

@Controller
public class A07_FullCalendarController {
	@Autowired(required = false)
	private A07_CalendarService service;
	// http://localhost:7080/springweb/calendar.do
	@GetMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a03_mvc\\a12_fullcalendar.jsp";
	}
	// http://localhost:7080/springweb/calList.do
	@GetMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("callist", service.getCalList());
		return "pageJsonReport";
	}	
	
	@PostMapping("insertCalendar.do")
	public String insertCalendar(Calendar ins, Model d) {
		
		// 입력 후 등록/성공 실패
		d.addAttribute("msg", service.insertCalendar(ins));
		
		return "pageJsonReport";
	}
	
	@GetMapping("insertCalendar.do")
	public String insertCalendarFrm() {
		return "WEB-INF\\views\\a01_start\\a17_calendarInsForm.jsp";
	}
}
