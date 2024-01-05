package springweb.z01_vo;

import java.util.Date;

public class Job_History {
	private int employee_id;
	private Date start_Date;
	private Date end_date;
	private String job_id;
	private int department_id;
	
	public Job_History() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Job_History(int employee_id, Date start_Date, Date end_date, String job_id, int department_id) {
		super();
		this.employee_id = employee_id;
		this.start_Date = start_Date;
		this.end_date = end_date;
		this.job_id = job_id;
		this.department_id = department_id;
	}
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getStart_Date() {
		return start_Date;
	}
	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

}
