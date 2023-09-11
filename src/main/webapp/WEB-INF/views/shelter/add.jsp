<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>

<h2>예약하기</h2> 

<form action="/shelter/add" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
날짜 <input type="date" name="chdate"/>
시간 
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
</form>
 
<script>
//아이디 중복테스트
let csrfHeaderName = "${_csrf.headerName}";
let csrfTokenValue = "${_csrf.token}";
$('.id_input').on("propertychange change keyup paste input", function() {
	var userid = "";
	userid = $(".id_input").val();
	var data = {
		"userid" : userid
	}
	$.ajax({
		type : 'POST',
		url : '/shelter/chAdd',
		data : data,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success : function(result) {
			// console.log("성공 여부" + result);
			if (result != 'fail') {
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_2').css("display", "none");
			} else {
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
			}
		}// success 종료
	}); // ajax 종료	
}); //function 종료

	if(){
		$("#selectBox option[value='10:00~10:30']").remove();
	}
	
</script>
<%@ include file="../includes/footer.jsp"%>