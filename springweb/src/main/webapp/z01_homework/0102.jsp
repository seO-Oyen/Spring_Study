<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--

1. mybatis 활용하기 위한 환경 설정 파일과 설정값을 지정하세요
- 스프링 설정에 DB연결정보 등록
(dispatcher-servlet.xml)
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
	destroy-method="close"> <!-- 자원해제시 사용하는 메서드 선언 -->
	<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
	<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
	<property name="username" value="scott"/>
	<property name="password" value="tiger"/>
</bean>

<bean id="sqlSessionFactory" 
	class="org.mybatis.spring.SqlSessionFactoryBean">
	<property name="dataSource" ref="dataSource" />
	<property name="configLocation"
		value="classpath:/resource/mybatis.Spring.xml"></property>
</bean>

- 매퍼 작성 후 등록
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
		<property name="basePackage" value="springweb.a02_mvc.a03_dao" />
</bean>
이 방식 또는
@Mapper

- 메서드() 별로 쿼리문 작성
<resultMap type="employee" id="empRst">
	<result column="empno" property="no" />
	<result column="ename" property="name" />
	<result column="sal" property="salary" />
	<result column="job" property="grade" />
</resultMap>

<select id="getEmployee" resultMap="empRst">
	SELECT *
	from emp02
	WHERE job LIKE '%'||#{ job }||'%'
		AND ename LIKE '%'||#{ ename }||'%'
</select>

- mapper 인터페이스를 스프링 Bean으로 등록하고 주입받아 사용
System.out.println("# resultMap 활용 예제 #");
for (Employee empl : dao.getEmployee("A", "")) {
	System.out.print(empl.getNo() + "\t");
	System.out.print(empl.getName() + "\t");
	System.out.print(empl.getSalary() + "\t");
	System.out.println(empl.getGrade());
}


1. dao와 XXXMapper.xml의 sql을 활용한 설정 관계를 조회 내용을 예제로 처리하세요.
- <mapper namespace="springweb.a02_mvc.a03_dao.Z0102_Dao">
	: dao와 mapper를 연결 시켜준다.
- <select id="getEmpList" 
			resultType="emp" 
			parameterType="emp">
	select : select 문
	id : Dao의 메서드명
	resultType : 반환값
	parameterType : 파라미터값
- <resultMap type="employee" id="empRst">
		<result column="empno" property="no" />
		<result column="ename" property="name" />
		<result column="sal" property="salary" />
		<result column="job" property="grade" />
	</resultMap>
	resultMap : vo의 필드명과 컬럼명이 다를때 사용
- <select id="getEmployee" resultMap="empRst">
	resultMap : <resultMap> 에 쓰인 내용들을 쓸수있다. id로 구분한다.
- <insert id="insertEmp" parameterType="empDto">
	insert : insert 문을 쓸 수 있다.

2. memeber01 테이블을 id, pwd로 검색해서 데이터 있는 여부 처리를 mybatis로 처리하세요
- 처리 완료
- Mapper
	<select id="getMember" resultType="member">
		SELECT *
		FROM member01
		WHERE id = #{ id }
			AND pwd = #{ pwd }
	</select>
- Dao
	public Member getMember(Member sch);
- service
	Member member = dao0102.getMember(new Member("himan", "7777"));
	if (member != null) {
		System.out.println("멤버 값 있음");
	} else {
		System.out.println("없움");
	}

3. select * from member01 where name like '%'||''||'%'로 mybatis을  List<Member>처리하세요
- 처리 완료
- Mapper
	<select id="getMemberList" parameterType="String" resultType="member">
		SELECT * 
		FROM member01
		WHERE name LIKE '%'||#{ name }||'%'
	</select>
- Dao
	public List<Member> getMemberList(String name);
- Service
	System.out.println("# 2번 #");
	for (Member mem : dao0102.getMemberList("길")) {
		System.out.print(mem.getMno() + "\t");
		System.out.print(mem.getName() + "\t");
		System.out.print(mem.getId() + "\t");
		System.out.print(mem.getPwd() + "\t");
		System.out.print(mem.getAuth() + "\t");
		System.out.println(mem.getPoint());
	}

4. member01 입력 처리하는 예제를 처리하세요.
- 처리 완료
- Mapper
	<insert id="insertMember" parameterType="member">
	INSERT INTO member01 values(
		#{ mno } ,
		#{ name },
		#{ id },
		#{ pwd },
		#{ auth },
		#{ point }
	)
	</insert>
- Dao
	public int insertMember(Member insert);
- Service
System.out.println("# 등록 #");
		System.out.println("member 등록 건수 : " 
			+ dao0102.insertMember(new Member(4, "goodday", "good123", 
				"최길동", "normal", 1500)));
--%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2></h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="제목" name="" class="form-control mr-sm-2" /> <input
					placeholder="내용" name="" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">
			<col width="10%">
			<col width="50%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
			<thead>

				<tr class="table-success text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="사원명 입력"
									name="ename">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="직책명 입력"
									name="job">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>