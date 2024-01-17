<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
	.jumbotron{padding:2%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">

	var sessId = "${mem.id}"
	if(sessId==""){
		alert("로그인을 하여야 현재화면을 볼 수 있습니다\n로그인 페이지 이동")
		location.href="${path}/login.do"
	}
	$(document).ready(function(){
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				// 등록 처리 화면 로딩..
				location.href="${path}/insertBoardFrm.do";
			}
		})	
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>게시판 메인</h2>

</div>
<div class="container">
	<h4 align="right">
	  	<c:if test="${not empty mem.name}">${mem.name}님 로그인 중</c:if>
	</h4>	
	<form id="frm01" class="form"  method="post">
		<input type="hidden" name="curPage" value="${sch.curPage}" />
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="제목" name="title"  value="${sch.title}" class="form-control mr-sm-2" />
	    <input placeholder="작성자" name="writer"  value="${sch.writer}"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" id="regBtn" type="button">등록</button>
 	</nav>
 	<div class="input-group mt-3 mb-0">	
		<span class="input-group-text">총 : ${sch.count}건</span>
		<input type="text" class="form-control" style="width: 70%;">
		<span class="input-group-text">페이지 수</span>
		<select name="pageSize" class="form-control">
			<option>3</option>
			<option>5</option>
			<option>10</option>
			<option>20</option>
			<option>50</option>
		</select>
	</div>
	<script type="text/javascript">
		// 선택된 페이지 사이즈를 다음 호출된 페이지에서 출력
		$("[name=pageSize]").val("${sch.pageSize}")
		// 페이지 크기를 변경했을 때 선택된 페이지를 초기 페이지로 설정
		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1)
			$("form").submit()
		})
	</script>
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
        <th>조회수</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="bd" items="${boardList}">
    	<tr ondblclick="goDetail(${bd.no})"><td>${bd.cnt}</td>
    		<td class="text-left">
    			<c:if test="${bd.level>1}">
    				<c:forEach begin="2" end="${bd.level}">
    					&nbsp;&nbsp;&nbsp;
    				</c:forEach>
    				☞
    			</c:if>
    		${bd.title}</td>
    		<td>${bd.writer}</td>
    		<td><fmt:formatDate value="${bd.regdte }"/></td>
    		<td>${bd.readcnt}</td></tr>
    	</c:forEach>
    </tbody>
	</table> 
    <script type="text/javascript">
    	function goDetail(no){
    		location.href="${path}/board.do?no="+no
    	}
    	function goPage(pcnt) {
			$("[name=curPage]").val(pcnt)
			$("form").submit()
    	}
    </script>
    <ul class="pagination  justify-content-center">
	  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
	  <c:forEach var="pcnt" begin="1" end="${sch.pageCount}">
	  <li class="page-item ${sch.curPage==pcnt?'active':''}">
	  	<a class="page-link" href="javascript:goPage(${pcnt})">${pcnt}</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
</div>

</div>
</body>
</html>