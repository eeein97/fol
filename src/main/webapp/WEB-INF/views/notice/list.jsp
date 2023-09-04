 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>

<h2>공지사항a</h2>
<div>
	<table>
		<tr>
			<td>번호</td>
			<td>구분</td>
			<td>제목</td>
			<td>등록일</td>
		</tr>
		 <c:if test="${list.size() != 0}">
			<c:forEach items="${list}" var="notice">
				<tr>
					<td><c:out value="${notice.nno}" /></td>
					<td><c:out value="${notice.category}" /></td>
					<td><a href="/notice/view?nno=${notice.nno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
						<c:out value="${notice.title}" /></a>
					</td>
					<td><c:out value="${notice.regdate}" /></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${list.size()==0}">
		<tr>
  			<td colspan="4">
  				<p>등록된 공지사항이 없습니다.</p>
  			</td>
  		</tr>
  		</c:if>
	</table>
	<sec:authentication property="principal" var="pinfo" />
		<sec:authorize access="isAuthenticated()">
			<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
			<c:if test="${pinfo.username eq 'admin'}">
				<button onclick="location.href='/notice/register'">글쓰기</button>
			</c:if>
		</sec:authorize>
</div>
<%@ include file="../includes/footer.jsp"%>