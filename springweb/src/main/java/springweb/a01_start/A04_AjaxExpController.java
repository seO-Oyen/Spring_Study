package springweb.a01_start;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.a02_mvc.a02_service.A02_DeptService;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Person;
import springweb.z01_vo.Product;

@Controller
public class A04_AjaxExpController {
	
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
	
	@GetMapping("ajax06.do")
	public String ajax06(Model d) {
		d.addAttribute("product", new Product("사과", 3000, 3));
		return "pageJsonReport";
	}
	
	@GetMapping("ajax07.do")
	public String ajax07(Model d) {
		d.addAttribute("person", new Person("홍길동", 14, "서울"));
		
		return "pageJsonReport";
	}
	
	@GetMapping("ajaxFrm01.do")
	public String ajaxFrm01(Model d) {
		
		return "WEB-INF\\views\\a01_start\\a13_ajaxForm.jsp";
	}
	
	@GetMapping("ajaxFrm02.do")
	public String ajaxFrm2() {
		
		return "WEB-INF\\views\\a01_start\\a14_ajaxForm.jsp";
	}
	
	@GetMapping("ajaxFrm03.do")
	public String ajaxFrm3() {
		
		return "WEB-INF\\views\\a01_start\\a15_ajaxForm.jsp";
	}
	
	@Autowired(required = false)
	private A02_DeptService service;
	
	@GetMapping("ajax10.do")
	public String ajax10(Dept dept ,Model d) {
		d.addAttribute("deptList", service.getDeptList(dept));
		
		return "pageJsonReport";
	}
	
	@GetMapping("ajax21.do")
	public String ajax21(Person p) { // Model + 요청값
		
		return "pageJsonReport";
	}
	
	@GetMapping("ajaxFrm04.do")
	public String ajaxFrm4() {
		
		return "WEB-INF\\views\\a01_start\\a16_ajaxForm.jsp";
	}
	
}
