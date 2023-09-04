<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>Animal-Lover</title>
</head>
<body>
<header>
	<div>
		<div><a href="/">로고</a></div>
		<div>
		<sec:authentication property="principal" var="pinfo" />
			<ul>
				<li>
					<sec:authorize access="isAnonymous()">
						<a href="/Login">로그인</a>
						<a href="/member/join">회원가입</a>
					</sec:authorize>
				</li>
				<li>
					<sec:authorize access="isAuthenticated()">
						<a href="/Logout">로그아웃</a>
						<a href="/member/mypage">내 정보</a>
					</sec:authorize>
				</li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="/">소개</a></li>
				<li><a href="/shelter/list">입양하기</a></li>
				<li><a href="/review/list">입양후기</a></li>
				<li><a href="/notice/list">공지사항</a></li>
			</ul>
		</div>
	</div>

</header>