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
		<c:forEach items="${list}" var="check">
			<ul>
				<li>
					<div>
						<p><c:out value="${check.chno}" /></p>
						<a href="/shelter/get?sno=${check.chno}&pageNum=${pageMaker.cri.pageNum}
						&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
							<img src="/display?fileName=${review.fullName}"/>
						</a>
						<div>
							<a href="/review/view?chno=${check.chno}&pageNum=${pageMaker.cri.pageNum}
							&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
							<h6><c:out value="${check.username}" /></h6></a>
							<p><c:out value="${check.phone}" /></p>
							<p><fmt:formatDate value="${check.chdate}" pattern="yyyy-MM-dd" /></p>
							<p><fmt:formatDate value="${check.regdate}" pattern="yyyy-MM-dd" /></p>
						</div>
					</div>	
				</li>
			</ul>
		</c:forEach>
	</c:if>
	<c:if test="${list.size() == 0}">
		<ul>
	  		<li>
	  			등록된 후기가 없습니다.
	  		</li>
	  	</ul>
  	</c:if>
</sec:authorize>
<%@ include file="../includes/footer.jsp"%>