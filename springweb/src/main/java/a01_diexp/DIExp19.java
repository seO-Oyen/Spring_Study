package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z02_vo.Person;
import a01_diexp.z02_vo.Product;


public class DIExp19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로
		String path="a01_diexp\\di19.xml";
		AbstractApplicationContext ctx = 
				new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Product prod = ctx.getBean("prod", Product.class);
		System.out.println("컨테이너의 객체 호출:"+prod);
		prod.setName("사과");
		
		Person person = ctx.getBean("person", Person.class);
		System.out.println("컨테이너의 객체 호출 : " + person);
		person.setName("홍길동");
		
		System.out.println(prod.getName());
		System.out.println(person.getName());
		
		// 3. 자원해제 
		ctx.close();
		System.out.println("종료@!!");
	}

}
