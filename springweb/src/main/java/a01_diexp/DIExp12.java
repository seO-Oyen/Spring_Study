package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Music;
import a01_diexp.z01_vo.Person;

public class DIExp12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로
		String path="a01_diexp\\di12.xml";
		AbstractApplicationContext ctx = 
				new GenericXmlApplicationContext(path);
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Person p01 = ctx.getBean("p01", Person.class);
		System.out.println("컨테이너의 객체 호출:"+p01);
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
		Music m01 = ctx.getBean("m01", Music.class);
		System.out.println("컨테이너 객체 호출:"+m01);
		System.out.println(m01.getMname());
		System.out.println(m01.getSinger());
		System.out.println(m01.getPubyear());
		
		
		// 3. 자원해제 
		ctx.close();
		System.out.println("종료@!!");
	}

}
