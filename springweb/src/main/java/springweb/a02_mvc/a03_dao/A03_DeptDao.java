package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Dept;

public interface A03_DeptDao {

	List<Dept> getDeptList(Dept sch);
	
	int insertDept(Dept ins);
	
}
