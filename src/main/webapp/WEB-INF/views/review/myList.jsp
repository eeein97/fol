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
		<h2>내글 목록</h2>
		<c:forEach items="${list}" var="review">
			<ul>
				<li>
					<div>
						<a href="/review/view?rno=${review.rno}&pageNum=${pageMaker.cri.pageNum}
						&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
							<img src="/display?fileName=${review.fullName}"/>
						</a>
						<div>
							<a href="/review/view?rno=${review.rno}&pageNum=${pageMaker.cri.pageNum}
							&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
							<h6><c:out value="${review.title}" /></h6></a>
							<p><c:out value="${review.content}" /></p>
							<p><fmt:formatDate value="${review.regdate}" pattern="yyyy-MM-dd" /></p>
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