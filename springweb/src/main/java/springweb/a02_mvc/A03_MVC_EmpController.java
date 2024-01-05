package springweb.a02_mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import d01_dao.PreparedStmtDao;
import springweb.z01_vo.Emp;

@Controller
public class A03_MVC_EmpController {
	// 컨테이너에 있는 객체 자동 할당 처리
	@Autowired(required = false)
	private PreparedStmtDao dao;
	
	// http://localhost:7080/springweb/empList.do
	@RequestMapping("empList.do")
	public String empList(Emp sch, Model d) {
		// 요청값이 없을때는 ""으로 처리
		if (sch.getEname() == null) sch.setEname("");
		if (sch.getJob() == null) sch.setJob("");
		
		d.addAttribute("empList", dao.getEmpList(sch));
		
		return "WEB-INF\\views\\a03_mvc\\a01_empList.jsp";
	}

}
