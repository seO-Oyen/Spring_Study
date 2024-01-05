package a01_diexp.z01_vo;

import java.util.List;
public class OnDisk {
	private String name;
	private List<Member> members;
	public OnDisk() {
		// TODO Auto-generated constructor stub
	}
	public OnDisk(String name) {
		this.name = name;
	}
	public void showMembers(){
		System.out.println(name+" 온라인 웹하드 보유 회원들");
		if(members!=null && members.size()>0) {
			System.out.println("이름\t아이디\t포인트");
			for(Member mem:members) {
				System.out.print(mem.getName()+"\t");	
				System.out.print(mem.getId()+"\t");	
				System.out.print(mem.getPoint()+"\n");
			}
			System.out.println("총 "+members.size()+"명 가입");
		}else {
			System.out.println("가입한 회원이 없네요!");
		}
	}	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Member> getMembers() {
		return members;
	}
	public void setMembers(List<Member> members) {
		this.members = members;
	}
	
}
