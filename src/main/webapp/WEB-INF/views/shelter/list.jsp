<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
	<h1>보호 리스트</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>품종</td>
			<td>작성자</td>
			<td>성별</td>
			<td>공고시작</td>
			<td>공고마감</td>
			<td>상태</td>
			<td>등록일</td>
		</tr>
		<c:forEach items="${list}" var="shelter">
			<tr>
				<td><c:out value="${shelter.sno}" /></td>
				<td>
					<a href="/shelter/get?sno=${shelter.sno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
						<img src="/display?fileName=${shelter.fullName}"/>
					</a>
				</td>
				<td><a href="/shelter/get?sno=${shelter.sno}"><c:out value="${shelter.category}" /></a></td>
				<td><c:out value="${shelter.userid}" /></td>
				<td><c:out value="${shelter.gender}" /></td>
				<td><c:out value="${shelter.stperiod}" /></td>
				<td><c:out value="${shelter.endperiod}" /></td>
				<td><c:out value="${shelter.state}" /></td>
				<td><c:out value="${shelter.regdate}" /></td>
			</tr>
			
		</c:forEach>
	</table>
<%@ include file="../includes/footer.jsp" %>  