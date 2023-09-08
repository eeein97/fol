<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	table {
	margin: 0 auto;
	padding: 0;
	box-sizing: border-box;
	text-align: left;
	}
	table td {
		width: 150px;
		height: 40px;
	}
</style>
	<h1>상세조회 페이지</h1>
	<table>
		<tr>
			<td><h3><c:out value="${review.title}" /></h3></td>
		</tr>
		<tr>
			<td><img src="/display?fileName=${review.fullName}"/></td>
		</tr>
		<tr>
			<td><c:out value="${review.writer}" /> / <fmt:formatDate value="${review.regdate}" pattern="yyyy.MM.dd." /></td>
		</tr>
		<tr>
			<td><c:out value="${review.content}" /></td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="location.href='/review/list'" value="목록" />
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
					<c:if test="${pinfo.username eq 'admin'}">
						<button onclick="location.href='/review/modify?nno=${notice.nno}'">수정</button>
						<form method="post" action="/review/remove">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" value="${review.rno}" name="rno" />
							<button type="submit">삭제</button>
						</form>
					</c:if>
				</sec:authorize>
			<td>
		</tr>
	</table>
	
	
	<%@ include file="../includes/footer.jsp"%>
	