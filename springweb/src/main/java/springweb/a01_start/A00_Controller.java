package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// springweb.a01_start.A00_Controller
@Controller
public class A00_Controller {
	
	@RequestMapping("callConext.do")
	public String callSecu() {
		return "";
	}
}
