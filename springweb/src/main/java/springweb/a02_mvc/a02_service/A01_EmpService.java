package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A01_Dao;
import springweb.a02_mvc.a03_dao.A02_Dao;
import springweb.a02_mvc.a03_dao.Z0102_Dao;
import springweb.z01_vo.Depart;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.EmpDTO;
import springweb.z01_vo.Employee;
import springweb.z01_vo.Job;
import springweb.z01_vo.Job_History;
import springweb.z01_vo.Location;
import springweb.z01_vo.Member;
import springweb.z01_vo.Region;

// 서비스(모델데이터를 만들고, 조건이나 반복문등
 // 알고리즘이 필요한 부분을 처리하는 부분

@Service
public class A01_EmpService {
	@Autowired
	private A01_Dao dao;
	
	@Autowired(required = false)
	private A02_Dao dao2;
	
	@Autowired(required = false)
	private Z0102_Dao dao0102;
	
	public List<Emp> getEmpList(Emp sch) {
		if (sch.getEname() == null) sch.setEname("");
		if (sch.getJob() == null) sch.setJob("");
		System.out.println("서비스단 호출(dao 처리) 건수 : "
					+ dao.getEmpList(sch).size());
		
		/*System.out.println("사원정보 갯수 : " + dao.getCountEmp());
		System.out.println("부서정보 갯수 : " + dao.getCountDept());
		System.out.println("부서이름 : " + dao.getDnameByDeptno(20));
		Emp emp = dao.getEmp(7369);
		System.out.println("사원명 : " + emp.getEname());
		System.out.println("직책명 : " + emp.getJob());*/
		
		/*System.out.println("# 위치정보 #");
		for(Location loc : dao.getLocations()) {
			System.out.print(loc.getCountry_id() + "\t");
			System.out.print(loc.getCity() + "\t");
			System.out.println(loc.getStreet_address());
		}*/
		
		/*System.out.println("# 직업 정보 #");
		for (Job job : dao.getJobs()) {
			System.out.print(job.getJob_id() + "\t");
			System.out.print(job.getJob_title() + "\t");
			System.out.print(job.getMin_salary() + "\t");
			System.out.println(job.getMax_salary());
		}*/
		
		/*System.out.println("# resultMap 활용 예제 #");
		for (Employee empl : dao.getEmployee("A", "")) {
			System.out.print(empl.getNo() + "\t");
			System.out.print(empl.getName() + "\t");
			System.out.print(empl.getSalary() + "\t");
			System.out.println(empl.getGrade());
		}*/
		
		/*System.out.println("# depart #");
		for (Depart depart : dao.getDeparts("", "")) {
			System.out.print(depart.getNo() + "\t");
			System.out.print(depart.getName() + "\t");
			System.out.println(depart.getLocation());
		}*/
		
		/*System.out.println("등록한 데이터 건수 : " + dao2.insertEmp(
					new EmpDTO(1002, "마길동", "인사", 7550, "2024-01-01", 
							4000, 100, 10)
				));*/
		
		/*System.out.println("부서 등록한 데이터 건수 : " 
							+ dao2.insertDept(new Dept(14, "개발", "판교")));*/
		
		/* 0102 과제 */
		/*Member member = dao0102.getMember(new Member("himan", "7777"));
		
		if (member != null) {
			System.out.println("멤버 값 있음");
		} else {
			System.out.println("없움");
		}
		
		System.out.println("# 2번 #");
		for (Member mem : dao0102.getMemberList("길")) {
			System.out.print(mem.getMno() + "\t");
			System.out.print(mem.getName() + "\t");
			System.out.print(mem.getId() + "\t");
		 	System.out.print(mem.getPwd() + "\t");
			System.out.print(mem.getAuth() + "\t");
			System.out.println(mem.getPoint());
		}
		
		System.out.println("# 등록 #");
		System.out.println("member 등록 건수 : " 
					+ dao0102.insertMember(new Member(4, "goodday", "good123", "최길동", "normal", 1500)));*/
		
		System.out.println("# 보다 간편한 sql 처리 #");
		for (Region rg : dao2.getRegionList("A")) {
			System.out.print(rg.getRegion_id() + "\t");
			System.out.println(rg.getRegion_name());
		}
		
		System.out.println("# 간편한 sql 처리 2 #");
		for (Job_History jh : dao2.getJobHistory("M")) {
			System.out.print(jh.getEmployee_id() + "\t");
			System.out.print(jh.getStart_Date() + "\t");
			System.out.print(jh.getJob_id() + "\t");
			System.out.println(jh.getDepartment_id());
		}
		
		
		return dao.getEmpList(sch);
	}
}
