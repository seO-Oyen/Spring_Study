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
[1단계:개념] 1. 정규화는 어떤 필요성 때문하는 하지는 예를 들어 기술하세요
[1단계:개념] 2. 정규화의 5단계와 핵심 내용을 기술하세요
[1단계:확인] 3. 아래 제1정규화 대상테이블을 제1정규화 처리하여, 출력하세요
1) 다음 표는 학생의 수업 성적에 관한 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 학생번호 | 학생이름 | 과목1 | 과목2 | 과목3 |
|---------|---------|-------|-------|-------|
| 1       | Alice   | 90    | 85    | 78    |
| 2       | Bob     | 76    | 88    | 92    |
| 3       | Carol   | 95    | 91    | 87    |
2) 다음 표는 학생의 과제 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 학생이름 | 과제1       | 과제2        | 과제3       |
|---------|------------|-------------|------------|
| Alice   | 95         | 88          | 76         |
| Bob     | 85         | 92          | 78         |
| Carol   | 91         | 87          | 90         |
3) 다음 표는 강의 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 강의번호 | 강의이름          | 담당교수        | 수강생1     | 수강생2      |
|---------|------------------|---------------|------------|-------------|
| 1       | Introduction to DB | Prof. Smith | Alice      | Bob         |
| 2       | Data Structures    | Prof. Johnson | Carol      | David       |
| 3       | Algorithms         | Prof. Lee    | Eve        | Frank       |
4) 다음 표는 주문 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 주문번호 | 고객이름 | 주문상세                                       |
|---------|---------|-----------------------------------------------|
| 1       | Alice   | 상품: iPhone, 수량: 2, 가격: 1000원     |
| 2       | Bob     | 상품: iPad, 수량: 1, 가격: 800원        |
| 3       | Carol   | 상품: MacBook, 수량: 3, 가격: 1200원 |

[1단계:확인] 4. 아래 제2정규화 대상테이블을 제2정규화 처리하여, 출력하세요
문제 1: 직원 근무 시간 테이블
| 직원ID | 프로젝트코드 | 직원이름 | 프로젝트명 | 근무시간 |
|--------|-------------|----------|------------|--------|
| 1001   | PRJ1        | John Doe | Alpha      | 30     |
| 1001   | PRJ2        | John Doe | Beta       | 20     |
| 1002   | PRJ1        | Jane Doe | Alpha      | 25     |
문제 2: 학생 취미 테이블
| 학생번호 | 학생이름 | 학생 전공 | 취미        |
|---------|----------|-----------|-------------|
| 001     | Alice    | 컴퓨터 과학 | 프로그래밍   |
| 001     | Alice    | 컴퓨터 과학 | 산악 자전거 |
| 002     | Bob      | 수학       | 체스        |
문제 3: 도서 대여 기록 테이블
| 대여번호 | 회원ID | 회원이름 | 책 제목 | 대여일자 |
|---------|-------|---------|---------|---------|
| 01      | A123  | John    | 해리 포터 | 2023-01-01 |
| 02      | B456  | Jane    | 지킬 박사와 하이드 | 2023-01-02 |
| 03      | A123  | John    | 호빗      | 2023-01-03 |
문제 4: 학생 시험 성적 테이블
| 학생번호 | 학생이름 | 과목코드 | 과목명 | 성적 |
|---------|----------|---------|--------|------|
| 1001    | Alice    | MAT101  | 수학    | 95   |
| 1001    | Alice    | PHY102  | 물리학  | 89   |
| 1002    | Bob      | MAT101  | 수학    | 78   |
문제 5: 직원 임금 테이블
| 직원ID | 부서코드 | 직원이름 | 부서명       | 시간당 임금 |
|--------|---------|----------|-------------|------------|
| E01    | D01     | John     | 개발         | 40         |
| E02    | D02     | Jane     | 마케팅       | 35         |
| E01    | D01     | John     | 개발         | 40         |
| E03    | D03     | Bob      | 인사         | 30         |
 # 조별로 파악사항(아래사항 조별로 취합 전달 17:20까지 전달)
1. 오늘 가장 어려웠던 부분 best3 및 내일 자세한 설명 필요한 부분
2. 오늘 지각(9:00기준)/수업시간 엄수(매시간:00)/과제제출 인원과 사유
3. 수업 시간 긍적적으로 집중하였는가?  


[1단계:개념] 1. 정규화는 주로 데이터 중복을 최소화하고, 데이터 무결성을 개선하기 위해 수행됩니다. 예를 들어, 한 데이터베이스 테이블에 중복된 데이터가 많으면, 데이터의 수정, 삭제, 삽입이 일어날 때 이러한 중복 데이터를 모두 찾아 일관성 있게 변경해야 합니다. 이 과정에서 실수가 발생할 수 있고, 이는 데이터의 무결성을 손상시킬 수 있습니다. 정규화를 통해 중복을 제거하면 이러한 문제를 방지할 수 있습니다.

[1단계:개념] 2. 정규화의 5단계와 핵심 내용은 다음과 같습니다:

- 제1정규화(1NF): 모든 컬럼이 원자값을 갖도록 하여 컬럼 내에서 값의 배열이나 중복을 제거합니다.
- 제2정규화(2NF): 1NF를 만족하며, 모든 비주요 속성이 기본 키에 완전 함수적으로 종속되도록 합니다. 즉, 부분적 종속을 제거합니다.
- 제3정규화(3NF): 2NF를 만족하며, 모든 비주요 속성이 기본 키에 대해 이행적으로 종속되지 않도록 합니다.
- BCNF (Boyce-Codd 정규형): 3NF를 만족하며, 모든 결정자가 후보 키가 되도록 합니다.
- 제4정규화(4NF): BCNF를 만족하며, 다치 종속성을 제거합니다.

[1단계:확인] 3. 제1정규화 처리된 테이블은 다음과 같습니다:

1) 학생의 수업 성적 테이블
| 학생번호 | 학생이름 | 과목   | 성적 |
|---------|---------|--------|------|
| 1       | Alice   | 과목1  | 90   |
| 1       | Alice   | 과목2  | 85   |
| 1       | Alice   | 과목3  | 78   |
| 2       | Bob     | 과목1  | 76   |
| 2       | Bob     | 과목2  | 88   |
| 2       | Bob     | 과목3  | 92   |
| 3       | Carol   | 과목1  | 95   |
| 3       | Carol   | 과목2  | 91   |
| 3       | Carol   | 과목3  | 87   |

2) 학생의 과제 정보 테이블
| 학생이름 | 과제   | 점수 |
|---------|--------|------|
| Alice   | 과제1  | 95   |
| Alice   | 과제2  | 88   |
| Alice   | 과제3  | 76   |
| Bob     | 과제1  | 85   |
| Bob     | 과제2  | 92   |
| Bob     | 과제3  | 78   |
| Carol   | 과제1  | 91   |
| Carol   | 과제2  | 87   |
| Carol   | 과제3  | 90   |

3) 강의 정보 테이블
| 강의번호 | 강의이름          | 담당교수        | 수강생   |
|---------|------------------|---------------|----------|
| 1       | Introduction to DB | Prof. Smith | Alice    |
| 1       | Introduction to DB | Prof. Smith | Bob      |
| 2       | Data Structures    | Prof. Johnson | Carol    |
| 2       | Data Structures    | Prof. Johnson | David    |
| 3       | Algorithms         | Prof. Lee    | Eve      |
| 3       | Algorithms         | Prof. Lee    | Frank    |

4) 주문

 정보 테이블
| 주문번호 | 고객이름 | 상품명   | 수량 | 가격 |
|---------|---------|--------|-----|------|
| 1       | Alice   | iPhone | 2   | 1000 |
| 2       | Bob     | iPad   | 1   | 800  |
| 3       | Carol   | MacBook| 3   | 1200 |

[1단계:확인] 4. 제2정규화 처리된 테이블은 다음과 같습니다:

문제 1: 직원 근무 시간 테이블

직원 테이블 (Employees)
| 직원ID | 직원이름 |
|--------|----------|
| 1001   | John Doe |
| 1002   | Jane Doe |

프로젝트 테이블 (Projects)
| 프로젝트코드 | 프로젝트명 |
|-------------|------------|
| PRJ1        | Alpha      |
| PRJ2        | Beta       |

근무 시간 테이블 (Work Hours)
| 직원ID | 프로젝트코드 | 근무시간 |
|--------|-------------|--------|
| 1001   | PRJ1        | 30     |
| 1001   | PRJ2        | 20     |
| 1002   | PRJ1        | 25     |

문제 2: 학생 취미 테이블

학생 테이블 (Students)
| 학생번호 | 학생이름 | 학생 전공 |
|---------|----------|-----------|
| 001     | Alice    | 컴퓨터 과학 |
| 002     | Bob      | 수학       |

취미 테이블 (Hobbies)
| 학생번호 | 취미        |
|---------|-------------|
| 001     | 프로그래밍   |
| 001     | 산악 자전거 |
| 002     | 체스        |

문제 3: 도서 대여 기록 테이블

회원 테이블 (Members)
| 회원ID | 회원이름 |
|-------|---------|
| A123  | John    |
| B456  | Jane    |

대여 기록 테이블 (Rentals)
| 대여번호 | 회원ID | 책 제목 | 대여일자 |
|---------|-------|---------|---------|
| 01      | A123  | 해리 포터 | 2023-01-01 |
| 02      | B456  | 지킬 박사와 하이드 | 2023-01-02 |
| 03      | A123  | 호빗      | 2023-01-03 |

문제 4: 학생 시험 성적 테이블

학생 테이블 (Students)
| 학생번호 | 학생이름 |
|---------|----------|
| 1001    | Alice    |
| 1002    | Bob      |

과목 테이블 (Subjects)
| 과목코드 | 과목명 |
|---------|--------|
| MAT101  | 수학    |
| PHY102  | 물리학  |

성적 테이블 (Grades)
| 학생번호 | 과목코드 | 성적 |
|---------|---------|------|
| 1001    | MAT101  | 95   |
| 1001    | PHY102  | 89   |
| 1002    | MAT101  | 78   |

문제 5: 직원 임금 테이블

직원 테이블 (Employees)
| 직원ID | 직원이름 |
|--------|----------|
| E01    | John     |
| E02    | Jane     |
| E03    | Bob      |

부서 테이블 (Departments)
| 부서코드 | 부서명       |
|---------|-------------|
| D01     | 개발         |
| D02     | 마케팅       |
| D03     | 인사         |

임금 테이블 (Wages)
| 직원ID | 부서코드 | 시간당 임금 |
|--------|---------|------------

|
| E01    | D01     | 40         |
| E02    | D02     | 35         |
| E03    | D03     | 30         |



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
		<h2>타이틀</h2>

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