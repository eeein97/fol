<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<h1>게시글 수정페이지</h1>
			<form class="shelter" method="post" action="/shelter/modify">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" ${review.title}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" ${review.content} required >내용</textarea></td>
					</tr>
				</table>		
				<!-- 새로 추가되는 부분 -->
				<div class="panel-heading">사진 첨부</div>
				<div>
					<input type="file" name="uploadFile" class="file_up" multiple />
				</div>
				<div class="uploadResult">
					<ul>
						<li><img src="/display?fileName=${review.fullName}"></li>
					</ul>
				</div>
				
				<div>	
					<input type="submit" value="등록" />
					<input type="reset" onclick="location.href='/review/list'" value="취소" />
				</div>
			</form>
			
<script>
$(".uploadResult").on("click", "button",function(){
    console.log("delete file");
    if(confirm("파일을 삭제하시겠습니까?")){
       let targetLi = $(this).closest("li");
       targetLi.remove();

$(document).ready(function() {
	//input태그 중 type이 file요소 선택
	//요소의 변경이 있으면 콜백함수 실행
	$("input[type='file']").change(function(){
		//가상의 폼을 생성(폼태그)
		let formData = new FormData();
		let inputFiles = $("input[name='uploadFile']");
		let files = inputFiles[0].files;
		console.log(files);
		for(let i=0; i<files.length; i++){
			formData.append("uploadFile", files[i]);
		}
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);
				showuploadResult(result);
			}
		})	
	})
	function showuploadResult(uploadResultArr) {
		//결과 배열이 null이거나 길이가 0이면 함수종료
		if(!uploadResultArr || uploadResultArr.length==0) {return}
		let uploadul = $(".uploadResult ul");
		let str ="";
		$(uploadResultArr).each(function(i, obj){
			console.log(obj);
			let fileCallpath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			let filePullpath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"' data-filename='"+obj.uuid+"_"+obj.fileName+"'"
			+"data-fullname='"+filePullpath+"' data-type='"+obj.image+"'>"
			+"<img src='/display?fileName="+fileCallpath+"' />"
			+"<button class='btn' data-file=\'"+fileCallpath+"\' data-type='image'>"
									//파일로 접근 					//타입으로 접근
			+"삭제</button></li>"
		})
		uploadul.append(str);
	}
	//삭제버튼 추가하기		 클릭하면      버튼에	이벤트 위임
	$(".uploadResult").on("click", "button" ,function(e) {
		//이벤트를 발생시키면 이벤트 발생시킨 객체를 this가 가르킴
		//커스텀 속성 dataset에 접근하는 방식 ==> data("키이름")
		let targetFile = $(this).data("file"); //this = 버튼
		let type = $(this).data("type");
		let targetLi = $(this).closest("li");
		//closest(00) = 00에 가까운
		$.ajax ({
			url:'/deleteFile',
			data: {fileName: targetFile, type: type},	//post전송시 데이터를 가지고 감
			dataType: 'text',
			type:'POST',
			success: function(result){
				alert(result);
			}
		})
		targetLi.remove();
		
	})
	//전송버튼 누를 때 파일관련 데이터도 같이 전송
	$("input[type=submit]").on("click", function(e){
		//연결된 이벤트 제거 (submit전송 제거)
		e.preventDefault();
		//폼선택 formObj에 할당
		let formObj = $("form.shelter");
		let str ="";
		let li = $(".uploadResult ul li");

		str += "<input type='text' name='fileName' value='"+li.data("filename")+"'/>"
		str += "<input type='text' name='uploadPath' value='"+li.data("path")+"'/>"
		str += "<input type='text' name='fileType' value='"+li.data("type")+"'/>"
		str += "<input type='text' name='fullName' value='"+li.data("fullname")+"'/>"
		//form에 데이터 추가 append()메소드 submit()전송하기
		formObj.append(str).submit();
	})

})
</script>
			
<%@ include file="../includes/footer.jsp" %>  