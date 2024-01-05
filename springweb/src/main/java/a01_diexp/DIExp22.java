package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Car;
import a01_diexp.z05_vo.CarDriver;
import a01_diexp.z05_vo.HPUser;
import a01_diexp.z05_vo.HandPhone;

public class DIExp22 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로
		String path="a01_diexp\\di22.xml";
		AbstractApplicationContext ctx = 
				new GenericXmlApplicationContext(path);
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Car car = ctx.getBean("car", Car.class);
		System.out.println("컨테이너의 객체 호출:"+car);
		car.setKind("제규어소블린");
		car.setCc(4000);
		car.setMaxVel(300);
		
		CarDriver carDriver = ctx.getBean("carDriver", CarDriver.class);
		carDriver.setName("마길동");
		//carDriver.setCar(car); // 1:1관계 연관관계 설정
		carDriver.driving();
		
		System.out.println(car.getKind());
		
		System.out.println("=================");
		
		HandPhone handPhone = ctx.getBean("handPhone", HandPhone.class);
		handPhone.setPnumber("010-1111-2222");
		handPhone.setCompany("SKT");
		
		HPUser user = ctx.getBean("HPUser", HPUser.class);
		user.setName("홍길동");
		user.usePhone();
		
		
		// 3. 자원해제 
		ctx.close();
		System.out.println("종료@!!");
	}

}
