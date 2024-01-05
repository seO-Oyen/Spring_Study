package springweb.a02_mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import d01_dao.PreparedStmtDao;
import springweb.z01_vo.Dept;

@Controller
public class A04_MVC_DeptController {
	
	@Autowired(required = false)
	private PreparedStmtDao dao;
	
	// http://localhost:7080/springweb/deptList.do
	@RequestMapping("deptList.do")
	public String deptList(Dept sch, Model d) {
		if (sch.getDname() == null) sch.setDname("");
		if (sch.getLoc() == null) sch.setLoc("");
		
		d.addAttribute("dlist", dao.getDeptList(sch.getDname(), sch.getLoc()));
		
		return "WEB-INF\\views\\a03_mvc\\a02_deptList.jsp";
	}

}
