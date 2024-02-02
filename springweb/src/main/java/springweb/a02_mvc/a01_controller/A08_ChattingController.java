package springweb.a02_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class A08_ChattingController {

	@GetMapping("chatting.do")
	public String chatting() {
		return "WEB-INF\\views\\a03_mvc\\a13_chatting.jsp";
	}
	
}
