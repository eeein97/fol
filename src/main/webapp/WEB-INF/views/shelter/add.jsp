<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>

<h2>예약하기</h2> 

<form action="/shelter/add" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="userId" value="<sec:authentication property="principal.username"/>" />
	<table>
			
		<tr>
			<td>이미지</td>
			<td><img src="/display?fileName=${shelter.fullName}"/></td>
		</tr>
		<tr>
			<td>공고번호</td>
			<td><input type="text" name="chno" value="${shelter.sno}" required readonly /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName" value="${myInfo.userName}"/></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone" value="${myInfo.phone}"/></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><input type="date" name="chdate"/></td>
		</tr>
		<tr>
			<td>시간</td>
			<td>
				<select name="chtime">
				    <option value="">시간을 선택하세요.</option>
				    <option value="10:00~10:30">10:00~10:30</option>
				    <option value="10:30~11:00">10:30~11:00</option>
				    <option value="11:00~11:30">11:00~11:30</option>
				    <option value="11:30~12:00">11:30~12:00</option>
				    <option value="13:00~13:30">13:00~13:30</option>
				    <option value="13:30~14:00">13:30~14:00</option>
				    <option value="14:00~14:30">14:00~14:30</option>
				    <option value="14:30~15:00">14:30~15:00</option>
				    <option value="15:00~15:30">15:00~15:30</option>
				    <option value="15:30~16:00">15:30~16:00</option>
				    <option value="16:00~16:30">16:00~16:30</option>
				    <option value="16:30~17:00">16:30~17:00</option>
				</select>
			</td>
		</tr>
	</table>
	
	<button type="submit">등록</button>
	<button type="reset">취소</button>
</form>
 
<%@ include file="../includes/footer.jsp"%>