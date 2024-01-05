package springweb.a02_mvc.a03_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import springweb.z01_vo.Depart;
import springweb.z01_vo.Emp;
import springweb.z01_vo.Employee;
import springweb.z01_vo.Job;
import springweb.z01_vo.Location;

// springweb.a02_mvc.a03_dao.A01_Dao
public interface A01_Dao {
	
	// 여기에 인터페이스를 통해서 추상메서드(입력/리턴) 선언하면
	// mybatis에서 선언된 프레임워크에 의해서 실제 객체를 만들어 준다.
	//			인터페이스 			Mapper.xml 연동규칙
	// 규칙 1: 인터페이스명			namespace명
	
	public List<Emp> getEmpList(Emp sch);
	public int getCountEmp();
	public int getCountDept();
	//public Emp getEmp();
	public Emp getEmp(int empno);
	public String getDnameByDeptno(int deptno);
	
	/*
	ex) 처리 메서드 선언, mapper.xml선언, service단에서 부서의 건수 : @@
	select count(*) from dept
	*/
	
	public List<Location> getLocations();
	
	public List<Job> getJobs();

	/*
	SELECT *
	FROM emp
	WHERE job LIKE '%'||#{ job }||'%'
		AND ename LIKE '%'||#{ ename }||'%';
	*/
	public List<Employee> getEmployee(@Param("job")String job,
								@Param("ename")String ename);
	
	public List<Depart> getDeparts(@Param("dname")String name,
							@Param("loc")String loc);
}
