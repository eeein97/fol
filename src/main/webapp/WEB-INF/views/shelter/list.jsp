<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
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
	.search {
	margin: 10px;
	text-align: center;
	}
	ul { 
	width: 10%;
    margin: 20px auto;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
	}
	ul li {
	text-align: center;
	}
</style>

	<h2>보호리스트</h2>
	<div class="search">
		<!-- 검색 추가하기 -->
		<form method="get" action="/shelter/list">
			<Select name="type">
				<option id="D" value="D" <c:out value="${pageMaker.cri.type =='T' ? 'selected' : ''}" />>개</option>
				<option id="C" value="C" <c:out value="${pageMaker.cri.type =='C' ? 'selected' : ''}" />>고양이</option>
				<option id="A" value=A" <c:out value="${pageMaker.cri.type =='C' ? 'selected' : ''}" />>기타</option>
			</Select>
			<input type="text" name="keyword" value='${pageMaker.cri.keyword}' required />
			<button type="submit">검색</button>
		</form>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>품종</td>
			<td>지역</td>
			<td>성별</td>
			<td>공고시작</td>
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
				<td><c:out value="${shelter.state}" /></td>
				<td><fmt:formatDate value="${shelter.regdate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			
		</c:forEach>
	</table>
	<!-- 페이징 추가하기 -->
	<div class="pgnum">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/shelter/list?pageNum=${pageMaker.startPage-1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">prev</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li>
					<a href="/shelter/list?pageNum=${num}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li>
					<a href="/shelter/list?pageNum=${pageMaker.endPage+1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">next</a>
				</li>
			</c:if>
		</ul>
	</div>
		<sec:authentication property="principal" var="pinfo" />
		<sec:authorize access="isAuthenticated()">
			<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
			<c:if test="${pinfo.username eq 'admin'}">
				<button onclick="location.href='/shelter/register'">글쓰기</button>
			</c:if>
		</sec:authorize>
<%@ include file="../includes/footer.jsp" %>  