package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// springweb.a01_start.A02_ReStartController
@Controller
public class A02_ReStartController {
	// restart.do 로
	// WEB-INF\views\a02_restart.jsp(스프링재시작^^) 호출되게
	// 1. 클래스 선언 할것
	//    패키지명, @Controller 선언.
	// 2. 컨테이너에 클래스 등록
	// 3. view(jsp 선언) WEB-INF\views\a02_restart.jsp
	// 4. 메서드 선언
	//    @RequestMapping
	//    public String restart(){
	//     	return "";
	//    }
	
	@RequestMapping("restart.do")
	public String restart() {
		return "WEB-INF/views/a01_start/a02_restart.jsp";
	}
}
