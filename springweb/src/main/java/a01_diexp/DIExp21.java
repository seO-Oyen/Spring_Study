package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z04_vo.Member;

public class DIExp21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로
		String path="a01_diexp\\di21.xml";
		AbstractApplicationContext ctx = 
				new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Member mem = ctx.getBean("member", Member.class);
		System.out.println("컨테이너의 객체 호출:"+mem);
		mem.setId("himan");
		mem.setName("홍길동");
		System.out.println("아이디 : " + mem.getId());
		System.out.println("이름 : " + mem.getName());
		
		// 3. 자원해제 
		ctx.close();
		System.out.println("종료@!!");
	}

}
