 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	h2 {
	text-align: center;
	margin: 50px auto;
	padding: 10px;
	border-bottom: 1px solid black;
	width: 180px;
	}
	table {
	margin: 0 auto;
	padding: 0;
	box-sizing: border-box;
	text-align: center;
	}
	table td {
		width: 150px;
		height: 60px;
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
<div class="listall">
	<h2>공지사항</h2>
	<div class="search">
		<!-- 검색 추가하기 -->
		<form method="get" action="/notice/list">
			<Select name="type">
				<option id="T" value="T" <c:out value="${pageMaker.cri.type =='T' ? 'selected' : ''}" />>제목</option>
				<option id="C" value="C" <c:out value="${pageMaker.cri.type =='C' ? 'selected' : ''}" />>내용</option>
			</Select>
			<input type="text" name="keyword" value='${pageMaker.cri.keyword}' required />
			<button type="submit">검색</button>
		</form>
	</div>
	<div id="tableline">
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
						<td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd" /></td>
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
	<!-- 페이징 추가하기 -->
	<div class="pgnum">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/notice/list?pageNum=${pageMaker.startPage-1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">prev</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li>
					<a href="/notice/list?pageNum=${num}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li>
					<a href="/notice/list?pageNum=${pageMaker.endPage+1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">next</a>
				</li>
			</c:if>
		</ul>
	</div>
		<sec:authentication property="principal" var="pinfo" />
		<sec:authorize access="isAuthenticated()">
			<!-- 로그인한 사용자랑 글쓴이랑 같아야함 -->
			<c:if test="${pinfo.username eq 'admin'}">
				<button onclick="location.href='/notice/register'">글쓰기</button>
			</c:if>
		</sec:authorize>
</div>

<%@ include file="../includes/footer.jsp"%>