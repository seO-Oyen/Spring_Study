package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Person;

public class DIExp16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로
		String path="a01_diexp\\di16.xml";
		AbstractApplicationContext ctx = 
				new GenericXmlApplicationContext(path);
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Person p01 = ctx.getBean("p01", Person.class);
		System.out.println("컨테이너의 객체 호출:"+p01);
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
		
		Person p02 = ctx.getBean("p02", Person.class);
		System.out.println("컨테이너의 객체 호출:"+p01);
		System.out.println(p02.getName());
		System.out.println(p02.getAge());
		System.out.println(p02.getLoc());
		
		Person p03 = ctx.getBean("p03", Person.class);
		System.out.println("컨테이너의 객체 호출:"+p01);
		System.out.println(p03.getName());
		System.out.println(p03.getAge());
		System.out.println(p03.getLoc());
		
		// 3. 자원해제 
		ctx.close();
		System.out.println("종료@!!");
	}

}
