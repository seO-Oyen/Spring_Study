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
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
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
	<form method="post" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
			부서번호</span>
		</div>
		<input type="number" name="deptno" class="form-control" value="${dept.deptno}" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				부서명</span>
		</div>
		<input name="dname" class="form-control" value="${dept.dname}" />	
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				부서위치</span>
		</div>
		<input name="loc" class="form-control" value="${dept.loc}" />	
	</div>		
	<div style="text-align:right;">
		<input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>

		<input type="button" class="btn btn-success" value="조회리스트" id="mainBtn"/>
	</div>	
		<script type="text/javascript">
			$("#regBtn").click(function(){
				if(confirm("등록하시겠습니까?")){
					if($("[name=deptno]").val()==""){
						alert("부서번호를 숫자형으로 입력하여야 합니다.")
						return;
					}
					$("form").submit()
				}
				
			})
			var msg = "${msg}"
			if(msg!=""){
				if(!confirm(msg+"\n계속 등록하시겠습니까?")){
					location.href="${path}/deptList02.do"
				}
			}
			$("#mainBtn").click(function(){
				location.href="${path}/deptList02.do"
			})
		</script>
	</form>	
</div>
</body>
</html>