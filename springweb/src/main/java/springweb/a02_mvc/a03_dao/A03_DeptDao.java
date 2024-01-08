package springweb.a02_mvc.a03_dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import springweb.z01_vo.Dept;
import springweb.z01_vo.FileRep;

public interface A03_DeptDao {

	List<Dept> getDeptList(Dept sch);
	
	int insertDept(Dept ins);
	
	Dept getDept(int deptno);
	
	@Insert("insert into filerep\r\n"
			+ "values(#{no}, #{fname}, #{path}, sysdate, sysdate, #{etc})")
	int uploadFile(FileRep ins);
}
