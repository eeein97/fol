<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

	<sec:authentication property="principal" var="pinfo" />
	<sec:authorize access="isAuthenticated()">
		<c:if test="${pinfo.username ne mypage.userid}">
			<h2>유효하지 않은 페이지입니다.</h2>
			<button onclick="location.href='/'" >메인화면으로 돌아가기</button>
		</c:if>
		
		<c:if test="${pinfo.username eq mypage.userid}">
		<div>
			<button onclick="location.href='/review/myList?writer=${mypage.userid}'">내가 쓴글</button>
			<button onclick="location.href='/shelter/myList?userid=${mypage.userid}'">내 예약목록</button>
			<button onclick="location.href='/member/modify?userid=${mypage.userid}'">내 정보 변경</button>
		</div>
			<table>
				<tr>
					<td>아이디</td>
					<td><c:out value="${mypage.userid}" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><c:out value="${mypage.userName}" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><fmt:formatDate value="${mypage.birth}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><c:out value="${mypage.phone}" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><c:out value="${mypage.email}" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><c:out value="${mypage.address}" /></td>
				</tr>
			</table>
		</c:if>
	</sec:authorize>
		
<%@ include file="../includes/footer.jsp" %>  