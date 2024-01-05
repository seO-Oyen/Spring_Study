package springweb.z01_vo;
// telNum=&name=
public class Phone {
	private String telNum;
	private String name;
	public Phone() {
		// TODO Auto-generated constructor stub
	}
	public Phone(String telNum, String name) {
		this.telNum = telNum;
		this.name = name;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
