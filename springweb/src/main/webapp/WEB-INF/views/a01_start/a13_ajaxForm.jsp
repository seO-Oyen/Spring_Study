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
		$("#ajax01").click(function() {
			$.ajax({
				url: "${path}/ajax01.do",
				dataType: "json",
				success: function(data) {
					/* alert(data) */
					/*
					controller에 의해 문자열로 된 json 형식을 비동기적으로 js로 객체화하여 사용하여
					출력한다.
					*/
					var p01 = data
					alert(p01.name)
					/* $("h2").append("#" + p01.name) */
				},
				error: function(err) {
					console.log(err)
				}
			})
		})
		
		$("#ajax02").click(function() {
			$.ajax({
				url: "${path}/ajax02.do",
				dataType: "json",
				success: function(data) {
					var p01 = data
					$("tbody").append("")
					$("tbody").append("<tr><td>" + p01.name + "</td><td>" + p01.age + "</td><td>" + p01.loc + "</td></tr>")
					/* $("tbody").append("<td>" + p01.age + "</td>")
					$("tbody").append("<td>" + p01.loc + "</td>")
					$("tbody").append("") */
				},
				error: function(err) {
					console.log(err)
				}
			})
		})
		
		$("#ajax03").click(function() {
			$.ajax({
				url: "${path}/ajax03.do",
				dataType: "json",
				success: function(data) {
					var p01 = data
					alert(p01.names[1])
				},
				error: function(err) {
					console.log(err)
				}
			})
		})
		
		$("#ajax07").keyup(function() {
			/* console.log(event.keyCode) */
			if (event.keyCode == 13) {
				$.ajax({

				})
			}
		})
		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>ajax연습</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="제목" name="" class="form-control mr-sm-2" /> <input
					placeholder="내용" name="" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="button" id="ajax01">ajax01.do</button>
				<button class="btn btn-info" type="button" id="ajax02">ajax02.do</button>
				<button class="btn btn-info" type="button" id="ajax03">ajax03.do</button>
				<button class="btn btn-info" type="button" id="ajax04">ajax04.do</button>
				<button class="btn btn-info" type="button" id="ajax05">ajax05.do</button>
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
				</tr>
			</thead>
			<tbody>
				
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