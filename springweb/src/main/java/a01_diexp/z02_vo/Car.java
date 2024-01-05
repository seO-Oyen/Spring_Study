package a01_diexp.z02_vo;

public class Car {
	// kind, cc, maxVel
	private String kind;
	private int cc;
	private int maxVel;
	public Car() {
		// TODO Auto-generated constructor stub
	}
	public Car(String kind, int cc, int maxVel) {
		this.kind = kind;
		this.cc = cc;
		this.maxVel = maxVel;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public int getMaxVel() {
		return maxVel;
	}
	public void setMaxVel(int maxVel) {
		this.maxVel = maxVel;
	}
	
	
}
