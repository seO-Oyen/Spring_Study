package a01_diexp.z04_vo;

public class CarDriver {
	private String name;
	private Car car;
	public CarDriver() {
		// TODO Auto-generated constructor stub
	}
	public CarDriver(String name) {
		this.name = name;
	}
	public void driving() {
		System.out.println(name+" 차를 몰려고 합니다!!");
		if(car!=null) {
			System.out.println("드라이브를 합니다.");
			System.out.println("차량 정보");
			System.out.println("차종:"+car.getKind());
			System.out.println("배기량:"+car.getCc()+"cc");
			System.out.println("최고속도:"+car.getMaxVel()+"km/h");
		}else {
			System.out.println("소유한 차가 없군요.. ㅠㅠ");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	
	// byName : set property명과 객체의 id와 같고 매개변수가 Car이어야한다.
	public void setCar02(Car car) {
		this.car = car;
	}
	
}
