<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head> 
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<META NAME="viewpoint" CONTENT="width=device-width, initial-scale=1,shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<TITLE>학식이- 학식결제,식권관리</TITLE>
<style>
.br12{
font-size: 50px;
background-image:url("img/a.jpg");
background-size: 170px 80px;
background-repeat: no-repeat;
color:#000000;
}
</style>
</head>
<body  onload="init(); enable_text(false);"> 
	<%
		// 로그인이 된 정보 담기
		String userID = null;
		String name= null;
		UserDTO userDTO = new UserDTO();
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
 
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ  J  s    ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
 
 <script language="JavaScript">
 
 //식권 ------------------------
 
  	 $(document).ready(function(){
  		    $('.__count_range input[count_range]').click(function(e){
  		        e.preventDefault();
  		        var type = $(this).attr('count_range');
  		        var $count = $(this).parent().children('input.count');
  		        var count_val = $count.val(); // min 1
  		        if(type=='m'){
  		            if(count_val<1){
  		                return;
  		            }
  		            $count.val(parseInt(count_val)-1);
  		        }else if(type=='p'){
  		            $count.val(parseInt(count_val)+1);
  		        }
  		    });
  		});
  	 
//checkbox style
  	function input_checked(obj,el_class){
  		if(obj.is(':checked')==true){
  			obj.parent('label'+el_class).addClass('active');
  		}else{
  			obj.parent('label'+el_class).removeClass('active');
  		}
  	}
  	function checkbox_change(obj){
  		if(obj=='load'){
  			$('input[type=checkbox]').each(function(){
  				input_checked($(this),'.__checkboxArea');
  			});
  		}else{
  			input_checked(obj,'.__checkboxArea');
  		}
  	}
  	$(document).ready(function(){
  		$('input[type=checkbox]').change(function(){
  			checkbox_change($(this));
  		});
  		checkbox_change('load');
  	});
//----자동계산 시스템 -------------
		function enable_text(status)
		{
		status=!status; 
		document.form.amount.disabled = status;
		}
		
		var sell_price;
		var amount;
		
		function init () { 
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}
		
		function add () {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value ++ ;
		
			sum.value = parseInt(hm.value) * sell_price;
		}
		
		function del () {
			hm = document.form.amount;
			sum = document.form.sum;
				if (hm.value > 1) {
					hm.value -- ;
					sum.value = parseInt(hm.value) * sell_price;
				}
		}
		
		function change () {
			hm = document.form.amount;
			sum = document.form.sum;
		
				if (hm.value < 0) {
					hm.value = 0;
				}
			sum.value = parseInt(hm.value) * sell_price;
		}
		function commify(n) { 		//1,000단위 마다 콤마찍는 함수
			var reg = /(^[+-]?\d+)(\d{3})/; // 정규식 
			n += ''; // 숫자를 문자열로 변환
			while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			return n;
		}
</script>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ한림관ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="building">
			<p id=buildingTitle>한 림 관</p>
		<div class="todayMenu">
			<div class="todayHead" style="background: Bisque;">
					<script>
					  function getWeekOfMonth(date) {
					     var selectedDayOfMonth = date.getDate();
					     
					     var first = new Date(date.getFullYear() + '/' + (date.getMonth() + 1) + '/01');
					     var monthFirstDateDay = first.getDay();
					     
					     return Math.ceil((selectedDayOfMonth + monthFirstDateDay) / 7);
					 }
					  wkday = ["첫째주","둘째주","셋째주","넷째주","다섯째"];
					  today = new Date(); 
					  weekperiod = (today.getDate())-(today.getDay()-1);
					  document.write(today.getMonth()+1,"월 ",wkday[getWeekOfMonth(today)-1]," 식단 <br>");
					  document.write("<h3>(",weekperiod,"일 ~ ",weekperiod+4,"일)</h3>"); //그주에 월~금 날짜를 출력하길바람 0~5
					</script>
			</div>
			
				<div class="form-inline">				
					<div class="col-lg-2 offset-1">					
						<p id=weekmenuTitle>월</p>
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle>한 식</p>
								<p>제육불고기</p>
								<p>제육불고기</p>
								<p>제육불고기</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>특 식</p>
								<p>카레라이스</p>
								<p>군만두</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>양 식</p>
								<p>등심돈가스</p>					
							</div>
						</div>	
					</div>
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>화</p>
							<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle>한 식</p>
								<p>제육불고기</p>
								<p>제육불고기</p>
								<p>제육불고기</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>특 식</p>
								<p>카레라이스</p>
								<p>군만두</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>양 식</p>
								<p>등심돈가스</p>					
							</div>	
						</div>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>수</p>
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle>한 식</p>
								<p>제육불고기</p>
								<p>제육불고기</p>
								<p>제육불고기</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>특 식</p>
								<p>카레라이스</p>
								<p>군만두</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>양 식</p>
								<p>등심돈가스</p>					
							</div>	
						</div>
					</div>
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>목</p>
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle>한 식</p>
								<p>제육불고기</p>
								<p>제육불고기</p>
								<p>제육불고기</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>특 식</p>
								<p>카레라이스</p>
								<p>군만두</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>양 식</p>
								<p>등심돈가스</p>					
							</div>	
						</div>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>금</p>
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle>한 식</p>
								<p>제육불고기</p>
								<p>제육불고기</p>
								<p>제육불고기</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>특 식</p>
								<p>카레라이스</p>
								<p>군만두</p>			
							</div>
							<div style="min-height:220px;">		
								<p id=menuTitle>양 식</p>
								<p>등심돈가스</p>					
							</div>	
						</div>
					</div>					
				</div>						
			</div>
		</div>
		<br><br><br><br>
		
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메 뉴 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
 	

 <form name="form" method="get">
	식권선택 : <input type="checkbox" name=others onclick="enable_text(this.checked)";> 
	<br>
	수량 : <input type=hidden name="sell_price" value="4300">
	<input type="text" name="amount" value="0" size="5" onchange="change();">
	<input type="button" value=" + " onclick="add();">
	<input type="button" value=" - " onclick="del();"><br> 
	금액 : <input type="text" name="sum" style="TEXT-ALIGN:right " size="11" readonly >원
</form>


  		<div class="purchase">
	   		<h1 style="text-align: center;">식 권</h1>
   			<form class="form-inline">   			
	   			<div class="col-lg-4 offset-2">	 
					<div class="ticket">
						식권 1매<br>4,300원<br>
						선택 : <input type="checkbox" name="ticket1" value="4300">
						수량 : <input type="number" name="amount1" value="1" min="1" max="9" >
					</div>   
				</div>
				<div class="col-lg-4">	 
					<div class="ticket">
						식권 10매<br>43,000원<br>
						<LABEL class="__checkboxArea"> 
							<input value="uncheck" checked="" type="checkbox" name="name">
						</LABEL>						
						<div class="__count_range">
						  <input value="-" count_range="m" type="button">
						  <input class="count" value="1" readonly="" name="">
						  <input value="+" count_range="p" type="button">
						</div>
					</div>   
				</div>					
   			</form>
	  	 </div>
   
   
   
 
   
<!--   footer    -->
    <footer style="background-color: skyblue; color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12  text-center COLSPAN=5 ALIGN=center">
                    <br>
                    <p>불편 피드백은 메일로 주세요 <br>jihoon289@naver.com</p>
           			  <h5><strong> CopyRight &copy; OWL Right Reserved</strong></h5>
                </div>
            </div>
        </div>
    </footer>
<!-- 애니메이션 참조 -->


	<script src="js/jquery-1.11.1.min.js"></script> 
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
	
</body> 
</html> 
   