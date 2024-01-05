package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A02_DeptService;
import springweb.z01_vo.Dept;

@Controller
public class A02_DeptController {
	@Autowired(required = false) 
	private A02_DeptService service;
	
	@RequestMapping("deptList02.do")
	public String deptList(Dept sch, Model d) {
		d.addAttribute("dlist", service.getDeptList(sch));
		
		return "WEB-INF\\views\\a03_mvc\\a02_deptList.jsp";
	}
	
	@RequestMapping("insertDeptFrm.do")
	public String insertDeptFrm() {
		
		return "WEB-INF\\views\\a03_mvc\\a03_deptInsert.jsp";
	}
	
	@RequestMapping("insertDept.do")
	public String insertDept(Dept ins, Model d) {
		d.addAttribute("msg", service.insertDept(ins) > 0 ? "등록성공" : "등록실패");
		
		return "WEB-INF\\views\\a03_mvc\\a03_deptInsert.jsp";
	}
}
