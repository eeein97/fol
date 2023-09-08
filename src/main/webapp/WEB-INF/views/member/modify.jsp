<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="../includes/header.jsp"%>
	<sec:authentication property="principal" var="pinfo" />
	<sec:authorize access="isAuthenticated()">
		<c:if test="${pinfo.username ne mypage.userid}">
			<h2>유효하지 않은 페이지입니다.</h2>
			<button onclick="location.href='/'" >메인화면으로 돌아가기</button>
		</c:if>
		<c:if test="${pinfo.username eq mypage.userid}">
			<form class="notice" method="post" action="/member/modify">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName" value="${mypage.userName}" required readonly /></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birth" value="${mypage.birth}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" name="phone" value="${mypage.phone}" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${mypage.email}" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" value="${mypage.address}" /></td>
					</tr>
				</table>
				<button>변경</button>
				<input type="reset" onclick="location.href='/member/mypage?userid=${mypage.userid}'" value="돌아가기" >
			</form>
		</c:if>
		
	</sec:authorize>
<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
//전화번호 하이픈(-)
$('input[name=phone]').on("keyup", function() {
	$(this).val($(this).val().replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));
	});

</script>
