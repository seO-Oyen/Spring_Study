package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A03_AjaxExpController {
	
	// http://localhost:7080/springweb/ajax01.do
	@GetMapping("ajax01.do")
	public String ajax01(Model d) {
		d.addAttribute("name", "홍길동");
		
		return "pageJsonReport";
	}
	
	@GetMapping("ajax02.do")
	public String ajax02(Model d) {
		d.addAttribute("name", "홍길동");
		d.addAttribute("age", 25);
		d.addAttribute("loc", "서울");
		
		return "pageJsonReport";
	}
	
	@GetMapping("ajax03.do")
	public String ajax03(Model d) {
		d.addAttribute("names", new String[] {"홍길동", "김길동", "신길동"});
		d.addAttribute("ages", new int[] {13, 28, 82});
		
		return "pageJsonReport";
	}

	@GetMapping("ajax04.do")
	public String ajax04(Model d) {
		d.addAttribute("item", "사과");
		d.addAttribute("price", 1000);
		d.addAttribute("cnt", 10);		
		
		return "pageJsonReport";
	}
	
}
