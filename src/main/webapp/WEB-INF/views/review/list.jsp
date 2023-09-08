<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	h2 {
	text-align: center;
	}
</style>

	<h2>입양후기</h2>
	<c:if test="${list.size() != 0}">
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

<%@ include file="../includes/footer.jsp" %>  