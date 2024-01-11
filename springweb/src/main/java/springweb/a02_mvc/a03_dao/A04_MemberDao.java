package springweb.a02_mvc.a03_dao;

import org.apache.ibatis.annotations.Select;

import springweb.z01_vo.Member;
// springweb.a02_mvc.a03_dao.A04_MemberDao
public interface A04_MemberDao {
	
	@Select("SELECT * FROM MEMBER "
		+ "WHERE id=#{id} AND pwd=#{pwd}")
	Member login(Member sch);
}
