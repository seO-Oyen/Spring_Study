package springweb.z01_vo;

public class Member {
	
	private int mno;
	private String id;
	private String pwd;
	private String name;
	private String auth;
	private int point;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	public Member(String id, String pwd, String name, String auth, int point) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.auth = auth;
		this.point = point;
	}
	public Member(int mno, String id, String pwd, String name, String auth, int point) {
		super();
		this.mno = mno;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.auth = auth;
		this.point = point;
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
