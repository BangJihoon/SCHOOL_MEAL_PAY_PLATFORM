<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<!-- 애니메이션 참조 -->
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"> </script>
	<script src ="js/livevalidation_standalone.js"> </script>
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
<!--           -->	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<META NAME="viewpoint" CONTENT="width=device-width, initial-scale=1,shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<TITLE>학식이- 학식결제,식권관리</TITLE>
<style>
.br12{
font-size: 50px;
background-image:url("img/a.jpg");
background-size: 150px 70px;
background-repeat: no-repeat;
color:#000000;
}
</style>
</head>
<body style="background:rgba(71, 99, 255, 0.1);">
	<%
		// 로그인이 된 정보 담기
		String userID = null;
		// 세션이 존재하면 아이디값을 받아 관리
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

<!--   네비게이션바     -->

  	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="brandLogo" href="index.jsp">SKU Bab </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">	
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div id="navbar1" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">	
	  			<li class="nav-item active"> 
	  				<a class="nav-link" id="navfont" href="index.jsp">메 인</a>
	  			</li>
	  			
				<li class="nav-item dropdown"> 
					<a class="nav-link dropdown-toggle" id="navfont" data-toggle="dropdown"> 식 당 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item"  id="navfont" href="buildingH.jsp">한림관</a>
						<a class="dropdown-item" id="navfont"  href="buildingB.jsp">북악관</a>
						<a class="dropdown-item"  id="navfont" href="buildingC.jsp">청운관</a>
					</div>
				</li>
				
	  			<li class="nav-item dropdown"> 
					<a class="nav-link dropdown-toggle" id="navfont" data-toggle="dropdown"> 카 페 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item"  id="navfont" href="#">Olive Green</a>
						<a class="dropdown-item" id="navfont"  href="#">Cafe SP</a>
						<a class="dropdown-item"  id="navfont" href="#">Cafe SB</a>
						<a class="dropdown-item"  id="navfont" href="#">Laural</a>
					</div>
				</li>
	  			
	  			<li> 
	  				<a class="nav-link" id="navfont" href="review.jsp">후 기</a>
	  			</li>
			</ul>
		
			<% 	
		 	if(userID!=null){				
			%>
			<ul class="nav navbar-nav navbar-right">	
				<li><a class="dropdown-item" href="#">My Ticket</a></li>		
				<li><a class="dropdown-item" href="logoutAction.jsp">Logout</a></li>		
			</ul>
 			<%
		 	}else if(userID ==null){
		 	%>
			<ul class="nav navbar-nav navbar-right">					
				<li><a class="nav-link" href="join.jsp">Join</a></li>
				<li><a class="nav-link" href="login.jsp">Login</a></li>
			</ul>
 			<%
		 	}
			%>
			
		</div>
	</nav>
 
	<script>
	function passwordCheckedFuntion(){
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		if(pw1 !=pw2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지않습니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}
	function emailCheckedFuntion(){
		var email = $('#email').val();
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var result = re.test(email);
		if(!result){
			$('#emailCheckMessage').html('이메일 형식이 올바르지 않습니다.');
		}else{
			$('#emailCheckMessage').html('');
		}
	}
	//-----------------ID 유효성 검사		
	
	function userIDCheckedFuntion() { 
		var userID = $('#userID').val();
	    var re = /^[a-zA-Z0-9]{5,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		if(re.test(userID)){ 
			$('#userIDCheckMessage').html('');
		}
		else{
		$('#userIDCheckMessage').html('아이디는 영문,숫자 5~20자 이내 여야 합니다.');
		}
	}
	function pwformCheckedFuntion() { 
		var pw1 = $('#pw1').val();
	    var re = /^[a-zA-Z0-9]{5,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		if(re.test(pw1)){ 
			$('#pwformCheckMessage').html('');
		}
		else{
		$('#pwformCheckMessage').html('비밀번호는 영문,숫자 5~20자 이내 여야 합니다.');
		}
	} 
	function IDDuplication(){
		var userID = $('#userID').val();
		var re = /^[a-zA-Z0-9]{5,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
			if(!(re.test(userID))){ 				
				alert('아이디는 영문,숫자 5~20자 이내 여야 합니다.');
				return;
			}
		location.href="idCheckAction.jsp?userID="+userID;
	}
	function emailDuplication(){
		var email = $('#email').val();
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(!(re.test(email))){
			alert('이메일 형식이 올바르지 않습니다.');
			return;
		}
		location.href="emailCheckAction.jsp?email="+email;
	}
	</script>
	
<!-- 회원가입 양식         -->
	<div class="container">							<!-- 부트스트랩 제공 css 80%, 가운데정렬  -->
	<div class="form-inline my-5" ></div>			<!-- 위에서 5줄 띄우기 -->
	 	<div class="joinbox">						<!-- 위아래 패딩, 배경이미지 등 -->
	 	
	 	<form name=join method="post" action="joinAction.jsp">
		 	<h1 style="text-align: center;">회원가입</h1>	 	
		 	<table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd;">
		 		<thead><br><br>
		 			<tr>
		 				<td colspan="4"><h4>Register Form </h4></td>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			
		 			
		 			
		 			<tr>
		 				<td><h5>이름</h5></td>
		 				<td colspan="3"><input type="text" class="form-control" placeholder="이름을 입력해주세요 " name="name" maxlength="20"></td>
		 			</tr>
		 			<tr>
		 				<td><h5>E-mail</h5></td>
		 				<td colspan="2">
		 					<input name="email" id="email" type="text" placeholder="이메일을 입력해주세요" onkeyup="emailCheckedFuntion();" class="form-control"  size="20">
		 					<p style='color:red; text-align:left;' id="emailCheckMessage"></p>
		 				</td>
		 				<td>
		 					<input type="button" class=" btn btn-success form-control" onclick="emailDuplication()" value ="메일확인">
		 				</td>
		 			</tr>
		 			<tr>
		 				<td colspan="4"><h4>기본정보 </h4></td>
		 			</tr>
		 			<tr>
		 				<td style="width:110px;"> <h5>아이디</h5>
		 				<td colspan="2"> 
		 					<input type="text" class="form-control" placeholder="아이디를 입력해주세요 " onkeyup="userIDCheckedFuntion()" name="userID" id="userID" maxlength="20"> 
		 					<p style='color:red; text-align:left;' id="userIDCheckMessage"> </p>
		 				</td>	 				
		 				<td style="width:110px;"> 
		 					<input type="button" class=" btn btn-success" onclick="IDDuplication()" value ="중복확인"> 
		 				</td>
			 			
		 			</tr>
		 			<tr>
		 				<td > <h5>비밀번호</h5></td>
		 				<td colspan="3"> 
		 					<input type="password" class="form-control" id="pw1" onkeyup="pwformCheckedFuntion()" placeholder="비밀번호를 입력해주세요" name="userPW" maxlength="20">
		 					<p style='color:red; text-align:left;' id="pwformCheckMessage"> </p>
		 				</td>
		 				
		 			</tr>
		 			<tr>	 				
		 				<td>
		 					<h5>비번 확인</h5>
		 				</td>
		 				<td colspan="3">
		 					<input type="password" class="form-control" id="pw2" onkeyup="passwordCheckedFuntion();" placeholder="비밀번호를 확인합니다 " maxlength="20">
			 				<p style='color:red; text-align:left;' id="passwordCheckMessage"> </p>
						</td>
		 			</tr>
		 		</tbody>
		 		
		 		<tfoot>
		 			<tr><td colspan="4">
		 				<input type="submit" class="btn btn-primary form-control" style=" height:70px; font-size:2.0em; font-weight:bolder; solid:#FFE3EE; " value ="가 입" >	
		 			</td></tr>
		 		</tfoot>
		 	</table>
	 	</form>	
	 	</div>
	 	</div>
	 			
	 	<div class="form-inline my-5" ></div>



<!--   footer    -->
    <footer style="background-color: skyblue; color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
                    <br>
                    <p>불편 피드백은 메일로 주세요 <br>jihoon289@naver.com</p>
           			  <h5><strong> CopyRight &copy; OWL Right Reserved</strong></h5>
           			  <br><br>
                </div>
            </div>
        </div>
    </footer>
			     
			
</body> 
</html>
