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
[1단계:개념] 1. 스프링의 요청값 VO 처리시, 404가 나는 경우를 수업의 예제를 들어 설명하세요
[1단계:확인] 2. 스프링의 로그인화면을 구성하여 Member로 요청값을 받아서 처리하되, login.do로 초기화면과 결과가 처리되는 코드를 처리해보세요.
		himan/7777일때만 로그인 성공
[1단계:개념] 3. 스프링에서 DI, IOC, DL개념을 찾아서 정리를 해보고, 오늘 코드한 소스에 연결하여 설명하세요.
[1단계:확인] 4. 아래 DIHome10.java/dih10.xml을 만들어 처리하세요
		1) Car 클래스를 만들고, 이 클래스에 color, brand, year 세 개의 속성을 추가하세요. 그 후, 이 클래스의 객체를 생성하고 각 속성을 출력해보세요.
		2) Account 클래스를 만들고, balance(잔액), deposit(입금), withdraw(출금) 속성을 만들어 할당 처리해보세요.
[1단계:개념] 5. 데이터베이스의 엔티티, 속성, 엔티티타입, 개체인스턴스를 구분하여 설명하세요.
[1단계:확인] 6. 도서대출관리시스템에서 사용자, 대출, 도서의 erd를 속성을 도출하고 erd를 그려서 제출시 캡쳐하세요

 # 조별로 파악사항(아래사항 조별로 취합 전달 17:20까지 전달)
1. 오늘 가장 어려웠던 부분 best3 및 내일 자세한 설명 필요한 부분
2. 오늘 지각(9:00기준)/수업시간 엄수(매시간:00)/과제제출 인원과 사유
3. 수업 시간 긍적적으로 집중하였는가?  

이 질문들은 소프트웨어 개발 및 설계에 관한 다양한 개념과 실습을 다루고 있습니다. 각 질문에 대한 답변을 아래와 같이 제공하겠습니다.

### 1. 스프링의 요청값 VO 처리시 404 오류
- **개념 설명**: 스프링에서 VO(Value Object)를 사용하여 요청값을 처리할 때, 404 오류가 발생하는 일반적인 경우는 컨트롤러의 매핑 URL이 잘못되었거나, 해당 URL을 처리할 컨트롤러 메서드가 없는 경우입니다. 예를 들어, `@RequestMapping` 어노테이션이 잘못된 URL에 대해 설정되었거나, URL 패턴이 잘못 지정된 경우에 이런 오류가 발생할 수 있습니다.

### 2. 스프링의 로그인 화면 구성 및 처리
- **코드 예시**: 아래는 스프링을 사용하여 로그인 화면을 구성하고 `login.do` URL을 통해 로그인 요청을 처리하는 간단한 예시입니다. 여기서는 `himan/7777` 조합으로 로그인 시 성공하는 로직을 구현합니다.
  
  ```java
  @Controller
  public class LoginController {

      @RequestMapping(value = "/login.do", method = RequestMethod.GET)
      public String initialLoginForm() {
          return "login"; // 초기 로그인 화면으로 이동
      }

      @RequestMapping(value = "/login.do", method = RequestMethod.POST)
      public String processLogin(Member member, Model model) {
          if ("himan".equals(member.getUsername()) && "7777".equals(member.getPassword())) {
              model.addAttribute("message", "로그인 성공");
              return "loginSuccess";
          } else {
              model.addAttribute("message", "로그인 실패");
              return "login";
          }
      }
  }
  ```
  - 여기서 `Member` 클래스는 사용자 이름과 비밀번호를 포함합니다.

### 3. 스프링의 DI, IOC, DL 개념 정리 및 연결
- **개념 설명**:
  - **DI (Dependency Injection)**: 객체 간의 의존성을 외부에서 주입하는 기법. 객체는 필요한 의존성을 직접 생성하지 않고, 외부(스프링 컨테이너)로부터 주입받습니다.
  - **IOC (Inversion of Control)**: 프로그램의 제어 흐름을 개발자가 아닌 외부(스프링 프레임워크)가 관리하는 원칙. 객체의 생명 주기와 의존성 관리를 컨테이너가 담당합니다.
  - **DL (Dependency Lookup)**: 컨테이너에서 필요한 객체를 검색하는 과정. 의존성을 주입받는 대신 필요할 때 직접 컨테이너를 조회합니다.

  이 개념들은 스프링 프레임워크의 핵심 원칙으로, 객체가 서로 긴밀하게 결합되는 것을 방지하고, 유연하고 확장 가능한 애플리케이션 개발을 가능하게 합니다. 예를 들어, 로그인 컨트롤러에서 `Member` 객체를 처리하는 경우, DI를 통해 필요한 서비스 또는 DAO 객체들을 주입받을 수 있습니다.

### 4. DIHome10.java/dih10.xml 생성 및 처리
- **Car 클래스 및 Account 클래스 작성**:
  - `Car` 클래스는 `color`, `brand`, `year` 속성을 가집니다.
  - `Account` 클래스는 `balance`, `deposit`, `withdraw` 메서드를 포함합니다.
  - 이러한 클래스들은 스프링의 DI를 사용하여 속성을 설정하고, `dih10

.xml` 파일에서 이들 객체의 인스턴스를 정의할 수 있습니다.

### 5. 데이터베이스 개념 설명
- **엔티티**: 데이터베이스에 저장되는 실체 또는 객체. 예를 들어, "사용자", "도서", "대출" 등이 엔티티가 될 수 있습니다.
- **속성**: 엔티티의 특성을 나타내는 항목. 예를 들어, 사용자 엔티티의 속성은 이름, 이메일 등이 될 수 있습니다.
- **엔티티 타입**: 유사한 성격을 가진 엔티티들의 집합. 예를 들어, 모든 "사용자" 엔티티들은 "사용자" 엔티티 타입에 속합니다.
- **개체 인스턴스**: 각 엔티티 타입의 실제 예. 예를 들어, 특정 사용자 "홍길동"은 "사용자" 엔티티 타입의 인스턴스입니다.

### 6. 도서대출관리시스템 ERD
- **속성 도출 및 ERD 작성**:
  - 사용자: 사용자ID, 이름,  주소 등
  - 대출: 대출일, 반납일, 대출 상태 등
  - 도서: 도서SN, 제목, 저자, 출판일 등


이 설명들은 기본적인 개념과 예시를 제공합니다. 실제 애플리케이션에서는 이러한 개념들이 더 복잡한 방식으로 적용될 수 있습니다.


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
		var id = "${member.id}"	
		var pwd = "${member.pwd}"
		//alert(id+":"+pwd)
		if(id!="" && pwd!=""){ // 초기화면이 아닐 때.
			// 입력값이 있을 때..
			if(id=="himan" && pwd == "7777"){
				alert("로그인 성공")
			}else{
				alert("로그인 실패")
			}
		}
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>로그인</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="아이디입력" name="id" class="form-control mr-sm-2" /> 
				<input placeholder="패스워드입력" name="pwd" type="password" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">로그인</button>
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