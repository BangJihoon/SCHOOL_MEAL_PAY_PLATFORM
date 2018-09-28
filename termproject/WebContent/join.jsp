<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
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
				
	  			<li> 
	  				<a class="nav-link" id="navfont" href="index.jsp">카 페</a>
	  			</li>
	  			
	  			<li> 
	  				<a class="nav-link" id="navfont" href="index.jsp">결 제</a>
	  			</li>
			</ul>
			<form class="form-inline my-2 ">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요" aria-label="search">
			 	<button class="btn btn-outline-success my-2 mt-sm-0 type="submit">검색</button>
			</form>
			<% 	
		 	if(userID!=null){				
			%>
			<ul class="nav navbar-nav navbar-right">	
				<li><a class="dropdown-item" href="#">MyPage</a></li>		
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
 

<!-- 회원가입 양식 -->
	 <div class="container">
	 	<div class="form-inline my-3" ></div>
	 	<div class="joinbox">
	 	
	 	<div class="col-xl-6 offset-xl-3">
	 		<form name=join method="post" action="joinAction.jsp">
	 			<h1 style="text-align: center;">회원가입</h1>	 	
	 			<h4>회원양식 </h4> 		
	 			
				<input type="text" class="col-xl-8" placeholder="아이디 " name="userID" maxlength="20">	 		
				<input type="button" class=" btn btn-primary" onclick=sendit() style="background-color:gray;" value ="중복확인"><br><br>
 				<input type="password" class="col-xl-8" id="pw1" placeholder="비밀번호 " name="userPW" maxlength="20"><br><br> 		
 				<input type="password" class="col-xl-8" id="pw2" placeholder="비밀번호확인 " name="userPW" maxlength="20"><br><br>				
	 			<script type="text/javascript">
				
	 					var pw2 = new LiveValidation('pw2');
						pw2.add( Validate.Confirmation, { match: 'pw1' } );
				</script> 
		 		 
	 			
	 			<h4>who are u? </h4> 	 			
 				<input type="text" class="col-xl-8" placeholder="학번 " name="snum" maxlength="20">
 				<input type="button" class=" btn btn-primary" onclick=snumCheck()  style="background-color:gray;" value ="중복확인"><br><br> 
 				<input type="text" class="col-xl-10" placeholder="성 함 " name="name" maxlength="20">
 				<br><br>
	 			
	 			
	 			
	 			<div class="form-inline">
				<input name="email1" type="text"  placeholder="email" class="col-xl-4" id="email1" size="15"> 
				 @ <input name="email2" type="text" list="emails" placeholder="직접입력"  class="col-xl-4" id="email2" size="20"><br><br>
					<datalist id="emails">
					  <option value="gmail.com">
					  <option value="naver.com">
					  <option value="daum.net">
					  <option value="skuniv.ac.kr">
					</datalist>
				<input type="button" class=" btn btn-primary" style="background-color:gray; align-content: right;" value ="메일확인"><br><br> 	 	
				</div>	 <br><br>
			<!--  
 				<input type="text" class="col-xl-8" placeholder="생년월일 6자리" name="birth" maxlength="20"> 	<br><br>	
 				<input type="text" class="col-xl-8" placeholder="휴대폰 번호 " name="phone" maxlength="20"> 	<br><br>	
 			-->
	 			<input type="submit" class="col-xl-6 offset-3 btn btn-primary form-control " style="height:70px; font-size:2.0em; font-weight:bolder; solid:#FFE3EE; " 
	 				value ="가 입"  >
	 	
	 		</form>	 		
	 	</div>
	 </div>
	 	<br><br><br><br>
	 </div>

<!--   footer     -->
    <footer style="background-color: skyblue; color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
                    <br>
                    <h2><strong> 학식이는 서경대 컴퓨터과학과 학생의 캡스톤작품입니다 </strong>
                    </h2>
                    <p>불편 피드백은 메일로 주세요 <br>  </p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> jihoon289@naver.com</li>
           			  <h3><strong> copyright &copy; BANG Right Reserved</strong></h3>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
			     
			<script language=javascript> 

			//-----------------ID 유효성 검사		
			function isEng(str) { 
				for(var i=0;i<str.length;i++){ 
					achar = str.charCodeAt(i); 
				if( achar > 128 ){ 
					return false; 
					} 
				} 
				return true; 
			} 
			function islength(str) { 
				
				if( str.length>20 || str.length<5 ){ 
					return false; 
				}  
				return true; 
			} 
			
			function sendit() { 
				if (document.join.userID.value=="") { 
					alert("ID가 공백이네요."); 
					document.join.userID.focus(); 
					return false; 
				} 
				if(!isEng(document.join.userID.value)){ 
					alert('ID는 영어와 숫자만 사용할 수 있습니다.-_-'); 
					document.join.userID.focus(); 
					return false; 
					} 
				if(!islength(document.join.userID.value)){ 
					alert('ID는 영어와 숫자가 조합되어 5~20자리 이내 여야합니다.'); 
					document.join.userID.focus(); 
					return false; 
				}
				alert('사용가능한 아이디입니다.'); 
				return true; 
			} 
		//-----------------ID 유효성 검사
		
		
		//-----------------학번  유효성 검사		
				function isNum(str) { 
					for(var i=0;i<str.length;i++){ 
						achar = str.charCodeAt(i); 
					if( achar < 48 && achar >= 58){ 
						return false; 
						} 
					} 
					return true; 
				} 
				function isSnumLen(str) { 
					
					if( str.length != 10 ){ 
						return false; 
					}  
					return true; 
				} 
				
				function snumCheck() { 
					if (document.join.snum.value=="") { 
						alert("학번을 입력하세요."); 
						document.join.snum.focus(); 
						return false; 
					} 
					if(!isNum(document.join.snum.value)){ 
						alert('숫자만 입력해주세요.'); 
						document.join.snum.focus(); 
						return false; 
						} 
					if(!isSnumLen(document.join.snum.value)){ 
						alert('자신의 학번을 제대로 입력해주세요.'); 
						document.join.snum.focus(); 
						return false; 
					}
					alert('감사합니다.'); 
					return true; 
				} 
			//-----------------ID 유효성 검사
			</script> 
</body> 
</html> 

