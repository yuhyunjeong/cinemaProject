<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">

<style type="text/css">

.mb-3{
 margin: auto;
}


</style>	
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	


		
});

function joinCheck() {
	//변수에 입력 값 담기	
	var id = document.getElementById("id"); //아이디
	var password = document.getElementById("password"); //비밀번호
	var name = document.getElementById("name"); //이름
	var phone = document.getElementById("phone");//핸드폰 번호
	var birth = document.getElementById("birth");//생일
	
	var pwdCheck = $("#pwdCheck").val();
	var idCheck = $("#id").val();
	
	
	if(pwdCheck==""){
		alert("비밀번호를 입력해주세요")
		pwdCheck.focus();

		return false;
	}else if(idCheck==""){
		alert("아이디를 입력해주세요")
		idCheck.focus();

		return false;
	}else{
		$("#mb").trigger("click");
	}
	
	
	//입력 값 전송
	//document.join.submit();
	document.getElementById("inForm").submit();

};

	
////////////아이디에 한글 입력 불가능 하도록
function chkCharCode(event) {
	const regExp = /[^0-9a-zA-Z]/g;
	  const ele = event.target;
	  if (regExp.test(ele.value)) {
	    ele.value = ele.value.replace(regExp, '');
	  }
	  
};



////////////휴대폰 번호, 생년월일에 숫자,- 이외에는 입력 불가능 하도록
function chkPhCode(event) {
	const regExp = /[^0-9\-]/g;
	  const ele = event.target;
	  if (regExp.test(ele.value)) {
	    ele.value = ele.value.replace(regExp, '');
	  }
	  
};



</script>
<body>
	<div class="col-sm-6, container" style="text-align: center; margin:0 auto;">
		<h1>Welcome to KLJ Movie</h1>
		
		<form name="inForm" id="inForm" method="post" action="${pageContext.request.contextPath}/member/join" onSubmit='return joinCheck()''>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
			<div class="card border-secondary mb-3" style="max-width: 40rem;"display:inline-block;>
				<div class="card-header">회원가입</div>
				<div class="card-body">					
					
					<div class="form-group">
						<label class="col-form-label"
							for="inputLarge">아이디</label> 
							<input
							class="form-control" type="text"
							placeholder="아이디를 입력해주세요." id="id"
							name="id"  required="required"
							onkeyup="chkCharCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()">
							<br>
							<input type="button" class="btn btn-success" id="check" name="check" value="중복체크">
							<div id="idCheck" name="idCheck"></div>
					</div>
					
					<div class="form-group">
						<label class="col-form-label mt-4"
							for="inputLarge">비밀번호</label> 
							<input
							class="form-control" type="password"
							placeholder="비밀번호를 입력해주세요." id="password"
							name="password" required="required"
							onKeyDown="if(event.keyCode == 13) joinCheck()">
					</div>
					
					<div class="form-group">
						<label class="col-form-label mt-4"
							for="inputLarge">비밀번호 확인</label> 
							<input
							class="form-control " type="password"
							placeholder="비밀번호를 다시 입력해주세요." id="pwdCheck"
							name="pwdCheck" required="required">
							<div id="pCheck" name="pCheck"></div>
					</div>
					
					<div class="form-group">
						<label class="col-form-label mt-4"
							for="inputLarge">이름</label> 
							<input
							class="form-control " type="text"
							placeholder="이름을 입력해주세요." id="name"
							name="name" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label mt-4"
							for="inputLarge">생년월일</label> 
							<input
							class="form-control " type="text"
							placeholder="0000-00-00 형식으로 입력해주세요." id="birth"
							name="birth" required="required"
							onkeyup="chkPhCode(event)" maxlength='10'>
					</div>
					
					<div class="form-group">
						<label class="col-form-label mt-4"
							for="inputLarge">연락처</label> 
							<input
							class="form-control" type="text"
							placeholder="000-0000-0000 형식으로 입력해주세요." id="phone"
							name="phone" required="required"
							onkeyup="chkPhCode(event)" onKeyDown="if(event.keyCode == 13) joinCheck()">
					</div>
					
					<br>
			
					<div>				
						<button class="btn btn-primary" onclick="joinCheck()">회원가입 완료</button>
						<button type="button"  id="mb" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#joinModal" style="display: none;">회원가입 완료</button>
					</div>
				
					<br>
				
				</div>
			</div>
		</form>
		
			<!-- Modal -->
		<div class="modal" id="joinModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">회원가입을 축하드립니다!</h5>	
					</div>
					<div class="modal-body">
						<p>로그인을 해주세요.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="joinCheck();">
						확인</button>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript">
$(function(){
	
	var idx = false;
	
	$("#check").click(function(){
		//alert(1);
		$.ajax({
			url:"idCheck",
			type:"post",
			data:{
				//아작스에 필수
				"${_csrf.parameterName}" : "${_csrf.token}",
				"id":$("#id").val()
			},
			success: function(data){
				console.log(data);
				if($.trim(data)=="YES"){
					if($("#id").val()!=''){
						
						idx=true;
						$("#id").attr("readonly",true);
						var html="<div>사용 가능한 아이디 입니다.</div>";
						$("#idCheck").empty();
						$("#idCheck").append(html);
					}
				}else{
					if($("#id").val()!=''){
						var html="<div style='color: orange;'><strong>사용 불가능한 아이디 입니다.</strong></div>";
						$("#idCheck").empty();
						$("#idCheck").append(html);
						
						 $('#id').val('');
						 $('#id').focus();	
					}
				}
			},
			
			
			
			
		});
		
		
	});
	
	$("#pwdCheck").blur(function(){
		  if($('#password').val() != $('#pwdCheck').val()){
			   	if($('#pwdCheck').val()!=''){
				   var html="<div style='color: orange;'><strong>비밀번호가 일치하지 않습니다.</strong></div>";
						$("#pCheck").empty();
						$("#pCheck").append(html);
				
				   	    $('#pwdCheck').val('');
				         $('#pwdCheck').focus();	
				    }
			   }else{
				var html="<div>비밀번호가 일치합니다.</div>";
				$("#pCheck").empty();
				$("#pCheck").append(html);
			}
		})  

	
	
});

</script>
	
</body>
</html>