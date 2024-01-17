<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style>
td {
	text-align: center;
}

.input-group-text {
	width: 100%;
	background-color: linen;
	color: black;
	font-weight: bolder;
}

.input-group-prepend {
	width: 20%;
}

#chatArea {
	width: 80%;
	height: 200px;
	overflow-y: auto;
	text-align: left;
	border: 1px solid green;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").on("keypress", function(e) {
			if (e.keyCode == 13) { //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>메일발송</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">수신자</span>
				</div>
				<input type="text" name="receiver" placeholder="수신자 메일주소 입력"
					class="form-control" value="" />
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">발신자</span>
				</div>
				<input readonly class="form-control" value="kky77209@gmail.com" />
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">제목</span>
				</div>
				<input name="title" class="form-control" value="" />
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">메일내용</span>
				</div>
				<textarea id="chatArea" name="content" class="form-control"
					placeholder="메일내용 입력"></textarea>
			</div>
			<div style="text-align: right;">
				<input type="submit" class="btn btn-info" value="메일발송" id="regBtn" />
			</div>
			<script type="text/javascript">
				var msg = "${msg}"
				if (msg != "") {
					if (!confirm(msg + "\n계속 메일발송 하시겠습니까?")) {
						location.href = "${path}/deptList02.do"
					}
				}
			</script>
		</form>
	</div>
</body>
</html>