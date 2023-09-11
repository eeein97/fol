<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<sec:authentication property="principal" var="pinfo" />
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username ne pageMaker.cri.writer}">
		<h2>유효하지 않은 페이지입니다.</h2>
		<button onclick="location.href='/'" >메인화면으로 돌아가기</button>
	</c:if>
	<c:if test="${list.size() != 0}">
		<h2>내 예약목록</h2>
		<table>
			<tr>
				<td>공고번호</td>
				<td>이미지</td>
				<td>신청인</td>
				<td>날짜</td>
				<td>시간</td>
				<td>신청일</td>
			</tr>
			<c:forEach items="${list}" var="check">
				<tr>
					<td><c:out value="${check.sno}" /></td>
					<td>
						<a href="/review/view?rno=${check.rno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
							<img src="/display?fileName=${check.fullName}"/>
						</a>
					</td>
					<td><c:out value="${check.username}" /></td>
					<td><fmt:formatDate value="${check.chdate}" pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${check.chtime}" /></td>
					<td><fmt:formatDate value="${check.regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>	
			</c:forEach>
		</table>
	</c:if>
</sec:authorize>
<%@ include file="../includes/footer.jsp"%>