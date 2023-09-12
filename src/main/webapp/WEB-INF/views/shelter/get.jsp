<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
.bigPictureWrapper {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background: rgba(0, 0, 0, 0.5);
	display: none;
	justify-content: center;
	align-items: center;
	color: #fff;
	}
	h2 {
	text-align: center;
	}
	table {
	margin: 0 auto;
	padding: 0;
	box-sizing: border-box;
	text-align: center;
	}
	table td {
		width: 150px;
		height: 40px;
		border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>

	<h2>상세조회 페이지</h2>
	<table>
	
		<tr>
			<td colspan="2"><img src="/display?fileName=${shelter.fullName}"/></td>
		</tr>
		<tr>
			<td>[<c:out value="${shelter.category}" />] <!-- 종류 등 --></td>
			<td>품종</td>
		</tr>
		<tr>
			<td>성별</td> 
			<td><c:out value="${shelter.gender}" /></td>
		</tr>
		<tr>
			<td>색상</td> 
			<td><c:out value="${shelter.color}" /></td>
		</tr>
		<tr>
			<td>무게</td> 
			<td><c:out value="${shelter.weight}" /></td>
		</tr>
		<tr>
			<td>출생</td> 
			<td><c:out value="${shelter.birth}" /></td>
		</tr>
		<tr>
			<td>공고기간</td>
			<td><c:out value="${shelter.stperiod}" /> ~ <c:out value="${shelter.endperiod}" /></td>
		</tr>
		<tr>
			<td>특이사항</td> 
			<td><c:out value="${shelter.content}" /></td>
		</tr>
		<tr>
			<td>보호센터</td>  
			<td><c:out value="${shelter.center}" /></td>
		</tr>
		<tr>
			<td>담당부서</td>  
			<td><c:out value="${shelter.department}" /></td>
		</tr>
		<tr>
			<td>발견지역</td> 
			<td><c:out value="${shelter.region}" /></td>
		</tr>
		<tr>
			<td>입양상태</td> 
			<td><c:out value="${shelter.state}" /></td>
		</tr>
		<tr>
			<td colspan="2"><img src="../resources/img/댕냥.jpg"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="location.href='/shelter/list'" value="목록" />
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
					<c:if test="${pinfo.username eq shelter.userid}">
						<button onclick="location.href='/shelter/modify?sno=${shelter.sno}'">수정</button>
						
						<form method="post" action="/shelter/remove">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" value="${shelter.sno}" name="sno" />
							<button type="submit">삭제</button>
						</form>
					</c:if>
					<button onclick="location.href='/shelter/add?sno=${shelter.sno}&userid=${pinfo.username}&fileName=${shelter.fullName}'">예약</button>
				</sec:authorize>
			</td>
		</tr>	
	</table>
	<div class="uploadResult">
		<ul>
		</ul>
	</div>
	
	<script>
		$(document).ready(function() {
			//스스로 실행되는 함수
			(function() {
				let sno = '<c:out value="${shelter.sno}" />';
				$.getJSON("", {sno : sno}, 
				function(arr) {
					console.log(arr);
					//이미지 나타내기
					let str = "";
					$(arr).each(function(i, attach){
						let fileCallpath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'"
					str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div><img src='/display?fileName="+fileCallpath+"'/></div></li>"
					})
					$(".uploadResult ul").html(str);
				}) //end getJSON
			})();
		
	</script>
	
<%@ include file="../includes/footer.jsp"%>