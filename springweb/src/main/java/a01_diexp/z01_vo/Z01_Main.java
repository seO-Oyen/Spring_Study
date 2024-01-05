package a01_diexp.z01_vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Z01_Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HandPhone h1 = new HandPhone("010-5555-9999","SKT");
		HPUser hu1 = new HPUser("홍길동");
		hu1.usePhone();
		hu1.setHandPhone(h1);
		hu1.usePhone();
		
		Car c1 = new Car("그랜저",3500,250);
		CarDriver cd1 = new CarDriver("홍드라이버");
		cd1.driving();
		cd1.setCar(c1);
		cd1.driving();
		
		List<Product> addList = new ArrayList<Product>();
		addList.add(new Product("사과",2000,2));
		addList.add(new Product("바나나",4000,5));
		addList.add(new Product("딸기",12000,3));
		addList.add(new Product("오렌지",2200,5));
		
		ShoppingMall sm = new ShoppingMall("온라인 청과물");
		sm.showProductInfo();
		sm.setPlist(addList);
		sm.showProductInfo();
		
		OnDisk od = new OnDisk("즐거운 온 영화관");
		od.showMembers();
		List<Member> members = new ArrayList<Member>();
		members.add(new Member("himan","7777","홍길동","관리자",30000));
		members.add(new Member("higirl","7777","마현정","관리자",12000));
		members.add(new Member("goodman","7777","오길동","관리자",3000));
		members.add(new Member("badgirl","7777","신현아","관리자",4000));
		members.add(new Member("gooddays","7777","이길동","관리자",10000));
		od.setMembers(members);
		od.showMembers();
	}

}
