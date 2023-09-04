<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>

	<h1>상세조회 페이지</h1>
	<table>
		<tr>
			<td><c:out value="${notice.nno}" /></td>
		</tr>
		<tr>
			<td><c:out value="${notice.category}" /></td>
		</tr>
		<tr>
			<td><c:out value="${notice.writer}" /></td>
		</tr>
		<tr>
			<td><c:out value="${notice.title}" /></td>
		</tr>
		
		<c:if test="${not empty notice.fullName}">
			<tr>
				<td><img src="/display?fileName=${notice.fullName}"/></td>
			</tr>
		</c:if>
		<tr>
			<td><c:out value="${notice.content}" /></td>
		</tr>
		<tr>
			<td><c:out value="${notice.regdate}" /></td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="location.href='/notice/list'" value="목록" />
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
					<c:if test="${pinfo.username eq 'admin'}">
						<button onclick="location.href='/notice/modify?nno=${notice.nno}'">수정</button>
						<form method="post" action="/notice/remove">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" value="${notice.nno}" name="nno" />
							<button type="submit">삭제</button>
						</form>
					</c:if>
				</sec:authorize>
			<td>
		</tr>
	</table>
	
	
	<%@ include file="../includes/footer.jsp"%>
	