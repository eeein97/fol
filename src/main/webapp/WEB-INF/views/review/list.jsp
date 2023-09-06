<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	h2 {
	text-align: center;
	}
</style>
	<h2>입양후기</h2>

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
						<h6><c:out value="${review.title}" /></h6>
						<c:out value="${review.content}" /></a>
						<fmt:formatDate value="${shelter.regdate}" pattern="yyyy-MM-dd" />
					</div>
				</div>	
			</li>
		</ul>		
		</c:forEach>
		
	</table>
<%@ include file="../includes/footer.jsp" %>  