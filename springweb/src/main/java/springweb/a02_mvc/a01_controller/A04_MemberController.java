package springweb.a02_mvc.a01_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import springweb.a02_mvc.a02_service.A04_MemberService;
import springweb.z01_vo.Member;

@Controller
public class A04_MemberController {
	@Autowired(required = false)
	private A04_MemberService service;
	// http://localhost:7080/springweb/login.do
	@GetMapping("login.do")
	public String loginFrm() {
		return "WEB-INF\\views\\a03_mvc\\a07_login.jsp";
	}
	// member(입력), mem(DBsession)
	@PostMapping("login.do")
	public String login(Member mem, HttpSession session, Model d) {
		System.out.println("# 입력된 id #");
		System.out.println(mem.getId());
		// DB결과 확인한 service
		Member dbMem = service.login(mem);
		if(dbMem!=null) {
			// 데이터 있는 때, session 값 설정..
			session.setAttribute("mem", dbMem);
		}
		
		
		return "WEB-INF\\views\\a03_mvc\\a07_login.jsp";
	}	
}
