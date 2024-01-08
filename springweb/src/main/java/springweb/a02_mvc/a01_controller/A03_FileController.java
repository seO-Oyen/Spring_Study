package springweb.a02_mvc.a01_controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a02_service.A02_DeptService;
import springweb.z01_vo.DeptFile;

@Controller
public class A03_FileController {
	// get방식과 post방식을 명시하여 같은 url을 선언할 때는 호출이 가능하다.
	@GetMapping("fileUpload.do")
	public String fileUploadFrm() {

		return "WEB-INF\\views\\a03_mvc\\a05_fileUploadFrm.jsp";
	}

	// 공통으로 선언된 내용을 문자열로 할당되어 사용할 수 있음
	@Value("${file.upload}")
	String path;

	@PostMapping("fileUpload.do")
	public String fileUpload(@RequestParam("report") MultipartFile report, Model d) {
		String fname = report.getOriginalFilename();
		// String path =
		// "C:\\b02_javaexp\\workspace\\git\\Spring_Study\\springweb\\src\\main\\webapp\\z02_upload\\";

		try {
			report.transferTo(new File(path + fname));

			if (fname != null && !fname.equals("")) {
				d.addAttribute("msg", "파일 업로드 성공");
			} else {
				d.addAttribute("msg", "파일 업로드 실패");
			}

		} catch (IllegalStateException e) {
			System.out.println("에러 1 : " + e.getMessage());
			d.addAttribute("msg", "파일 업로드 실패");
		} catch (IOException e) {
			System.out.println("에러 2 : " + e.getMessage());
			d.addAttribute("msg", "파일 업로드 실패");
		}

		return "WEB-INF\\views\\a03_mvc\\a05_fileUploadFrm.jsp";
	}

	// http://localhost:7080/springweb/fileUpload02.do
	@GetMapping("fileUpload02.do")
	public String fileUpload02Frm() {
		return "WEB-INF\\views\\a03_mvc\\a06_fileUploadFrm.jsp";
	}
	
	@Autowired(required = false)
	private A02_DeptService service;
	
	@PostMapping("fileUpload02.do")
	public String fileUpload02(DeptFile df, Model d) {
		System.out.println("# 부서정보 파일 업로드 #");
		System.out.println("부서명 : " + df.getDname());
		System.out.println("첫번째 파일명 : " + df.getReports()[0].getOriginalFilename());
		System.out.println("첫번째 파일명 : " + df.getEtc());
		
		d.addAttribute("msg", service.uploadFile(df));
		
		return "WEB-INF\\views\\a03_mvc\\a06_fileUploadFrm.jsp";
	}
}
