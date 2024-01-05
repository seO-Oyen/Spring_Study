package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Member;

public interface Z0102_Dao {
	
	public Member getMember(Member sch);
	
	public List<Member> getMemberList(String name);
	
	public int insertMember(Member insert);

}
