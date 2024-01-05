package springweb.a02_mvc;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// springweb.a02_mvc.A01_MVC_StartController
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import a01_diexp.z01_vo.Person;
import springweb.z01_vo.Movie;
// springweb.a02_mvc.A01_MVC_StartController
@Controller
public class A01_MVC_StartController {
	// http://localhost:7080/springweb/call10.do
	
	/*
	요청값이 없을 때도 처리, 요청값이 있을 때도 처리할려면 defaultValue=""
	*/
	@RequestMapping("call10.do")
	public String call10(
				@RequestParam(value = "name",
						defaultValue = "") String name,
				Model d          
			) {
		// 요청값에 따른 권한 설정
		String auth = "";
		if (name.equals("홍길동")) {
			auth = "관리자";
		} else if (!name.equals("")) {
			auth = "일반사용자";
		}
		
		// 넘겨줄 모델 데이터 설정
		d.addAttribute("auth", auth);
		return "WEB-INF\\views\\a02_modelView\\a03_callAuth.jsp";
	}
	
	@RequestMapping("call11.do")
	public String call11(Model d) {
		d.addAttribute("name", "마길동");
		d.addAttribute("age", 29);
		d.addAttribute("person", new Person("홍길동", 25, "서울"));
		/*
		# controller단에서 위와 같이 설정된 모델 데이터를 view단에서
			아래와 같이 호출할 수 있다.
		${ name }
		${ age + 10 }
		${ person.name } ==> person.getName()
		${ person.age }
		${ person.loc }
		*/
		// ex) fruit 과일명 전달 선언과 할당
		//		price 과일의 가격
		d.addAttribute("fruit", "사과");
		d.addAttribute("price", 3000);
		d.addAttribute("m01", new Movie("2023/12/23", "아쿠아맨", 5));
		
		return "WEB-INF\\views\\a02_modelView\\a05_modelKind.jsp";
	}
	
	@RequestMapping("call12.do")
	public String call12(Model d) {
		// 배열형 데이터
		// 1. 단순 배열
		d.addAttribute("fruits", new String[] {"사과", "바나나", "딸기"});
		// ==> view단 ${ fruits[0] }, ${ fruits[1] }, ${ fruits[2] }
		
		// 2. List형
		d.addAttribute("names", Arrays.asList("홍길동", "김길동", "신길동"));
		// ==> view 단에서 ${ name.get(0) } ...
		// ==> <c:forEach var="name" items="${ names }">
		//		${ name }
		
		return "WEB-INF\\views\\a02_modelView\\a06_modelKind.jsp";
	}
	
}
