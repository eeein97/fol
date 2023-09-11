<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
/* 중복아이디 존재하지 않는경우 */
.id_input_re_1, .pw_input_re_1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2, .pw_input_re_2 {
	color: red;
	display: none
}
</style>

<h1>회원가입</h1>
<form action="/member/join" method="post" name="joinform">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName" /></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth" /></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>
				<input type="text" name="phone" class="phoneNumber" oninput="oninputPhone(this)" maxlength="14" />
			</td>
		</tr>
		<tr>
			<td>회원등급</td>
			<td>
				<select name="auth">
						<option value="ROLE_USER" selected>일반회원</option>
						<option value="ROLE_MEMBER">관리자회원</option>
						<option value="ROLE_ADMIN">운영자회원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="userid" class="id_input" /> 
				<span class="id_input_re_2">해당 아이디는 사용할 수 없습니다.</span> 
				<span class="id_input_re_1">사용 가능한 아이디 입니다.</span>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="userpw" id="pw1"/></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="pw2" />
			<span class="pw_input_re_2">비밀번호 불일치</span> 
			<span class="pw_input_re_1">비밀번호 일치</span>
		</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
			<input type="text" class="fis_email" />@
				<select class="las_email">
						<option value="">-선택-</option>
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@korea.com">korea.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@yahoo.com">yahoo.com</option>
				</select> 
				<input type="hidden" class="totalemail" name="email">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<div class="form-group">
					<input class="form-control addr1" style="width: 40%; display: inline;" 
					placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
					<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
				</div>
				<div class="form-group">
					<input class="form-control addr2" style="top: 5px;" placeholder="도로명 주소" 
					name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control addr3" placeholder="상세주소" name="addr3" id="addr3" type="text" />
				</div>
				<input type="hidden" class="totaladrress" name="address">
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="전송" class="joinSubbtn" /></td>
			<td><input type="reset" value="취소" /></td>
		</tr>
	</table>

</form>


<script>

	//전화번호 하이픈(-)
	$('input[name=phone]').on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, "")
				.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));
		});

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
			url : '/member/memberIdChk',
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

	//이메일, 주소 input합치기 보내기
	$('.joinSubbtn').on("click", function() {
		var addr1 = $('.addr1').val();
		var addr2 = $('.addr2').val();
		var addr3 =	$('.addr3').val();
		var adtotal = addr1+addr2+addr3;
		if (addr1 != "" && addr2 != "" && addr3 !="") {
			$('.totaladrress').val(adtotal);
		} else {
			alert("주소를 입력해주세요.");
		}
		
		var first = $('.fis_email').val();
		var last = $('.las_email').val();
		var emtotal = first + last;
		if (first != "" && last != "") {
			$('.totalemail').val(emtotal);
		} else {
			alert("이메일을 입력해주세요.");
		}
	});
	
	$('#pw2').on("propertychange change keyup paste input", function(){
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var pwMsg = document.getElementById('pwMsg');	
		
		if (pw1 == pw2) {
			$('.pw_input_re_1').css("display", "inline-block");
			$('.pw_input_re_2').css("display", "none");
		} else {
			$('.pw_input_re_2').css("display", "inline-block");
			$('.pw_input_re_1').css("display", "none");
		}
		
	})

	
	//주소 api	
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
<%@ include file="../includes/footer.jsp"%>