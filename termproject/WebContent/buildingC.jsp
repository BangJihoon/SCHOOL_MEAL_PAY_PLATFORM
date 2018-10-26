<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="menu.MenuDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="menu.MenuDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head> 
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
<body  onload="init(); enable_text(false); t2_enable_text(false); t3_enable_text(false);"> 		<!--init()함수 로드, 사용상태를 불능 초기화 -->
	<%
		// 로그인이 된 정보 담기
		String userID = null;
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
	  			<li class="nav-item "> 
	  				<a class="nav-link" id="navfont" href="index.jsp">메 인</a>
	  			</li>
	  			
				<li class="nav-item dropdown active"> 
					<a class="nav-link dropdown-toggle" id="navfont" data-toggle="dropdown"> 식 당 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item "  id="navfont" href="buildingH.jsp">한림관</a>
						<a class="dropdown-item" id="navfont"  href="buildingB.jsp">북악관</a>
						<a class="dropdown-item"  id="navfont" href="buildingC.jsp">청운관</a>
					</div>
				</li>
				
	  			<li class="nav-item dropdown "> 
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
				<li><a class="dropdown-item" href="myPage.jsp">MyPage</a></li>		
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


<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	
			<div class="building">
		<div class="todayMenu">
		<div class="card text-center">
			  <div class="card-header">
				<p id=buildingTitle>청 운 관</p>
			  </div>
			  <div class="card-body">
			  
			   <h5 class="card-title">
				  	<script>
						  function getWeekOfMonth(date) {		// 오늘이 몇주차 인지 구하는함수
						     var selectedDayOfMonth = date.getDate();	
						     var first = new Date(date.getFullYear() + '/' + (date.getMonth() + 1) + '/01');	//이달의 첫날 변수
						     var monthFirstDateDay = first.getDay();		//이달의 첫날이 무슨요일인지 구함					     
						     return Math.ceil((selectedDayOfMonth + monthFirstDateDay) / 7); 
						 }
						  
						  wkday = ["첫째주","둘째주","셋째주","넷째주","다섯째"];
						  today = new Date(); 
						  weekperiod = (today.getDate())-(today.getDay()-1);
						  document.write(today.getMonth()+1,"월 ",wkday[getWeekOfMonth(today)-1]," 식단 <br>");
						  document.write("<h3>[",weekperiod,"일 ~ ",weekperiod+4,"일]</h3>"); //그주에 월~금 날짜를 출력하길바람 0~5
					</script>
					<button class="btn btn-primary" onclick='location.href="menuManage.jsp?storeID=buildingC"'>식단 관리</button>
				</h5>
			  </div>
			  <div class="card-footer text-muted">
			    
			  </div>
		</div>
				
				
				<%	
					Calendar firstDayOfWeek = new GregorianCalendar();
					Date date = new Date();	//오늘날짜 받기
					int dday = date.getDay();
					firstDayOfWeek.add(Calendar.DATE, -dday+1);
					
					String today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());	//String  형식으로 변환
					
					MenuDAO menuDAO = new MenuDAO();
					ArrayList<MenuDTO> list = menuDAO.getTodayMenu("buildingC",today);	//넣어줌
					
				%>
				
				<div class="form-inline">				
					<div class="col-lg-2 offset-1">					
						<p id=weekmenuTitle>월</p>
						<%
						for(int i=0;i<list.size();i++){							
						%>							
						<div class="weekmenu">
							<div style="min-height:220px;">	
								<p id=menuTitle><%=list.get(i).getMenuName()%></p>
								<p><%=list.get(i).getSide1()%></p>
								<p><%=list.get(i).getSide2()%></p>
								<p><%=list.get(i).getSide3()%></p>
								<p id=menuPrice><%=list.get(i).getPrice()%>원</p>
							</div>
						</div>	
						<%
						}
						if(list.size() ==0){					
						%>
						<div class="col-lg-12">
							<div class="menu">
								<p id=menuTitle><%out.print("오늘 메뉴");%></p>						
								<p id=menuPrice><%out.print("미등록");%></p>						
							</div>
						</div>
						<%
						}
						%>
						
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>화</p>
							<%
							firstDayOfWeek.add(Calendar.DATE,1);
							today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
							list = menuDAO.getTodayMenu("buildingC",today);	//넣어줌
							for(int i=0;i<list.size();i++){							
							%>							
							<div class="weekmenu">
								<div style="min-height:220px;">			
									<p id=menuTitle><%=list.get(i).getMenuName()%></p>
									<p><%=list.get(i).getSide1()%></p>
									<p><%=list.get(i).getSide2()%></p>
									<p><%=list.get(i).getSide3()%></p>
									<p id=menuPrice><%=list.get(i).getPrice()%>원</p>
								</div>
							</div>	
							<%
							}
							if(list.size() ==0){					
							%>
							<div class="col-lg-12">
								<div class="menu">
									<p id=menuTitle><%out.print("궁금 하지?");%></p>						
									<p id=menuPrice><%out.print("좀만 참자");%></p>						
								</div>
							</div>
							<%
							}
							%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>수</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingC",today);	//넣어줌
						for(int i=0;i<list.size();i++){							
						%>							
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle><%=list.get(i).getMenuName()%></p>
								<p><%=list.get(i).getSide1()%></p>
								<p><%=list.get(i).getSide2()%></p>
								<p><%=list.get(i).getSide3()%></p>
								<p id=menuPrice><%=list.get(i).getPrice()%>원</p>
							</div>
						</div>	
						<%
						}
						if(list.size() ==0){					
						%>
						<div class="col-lg-12">
							<div class="menu">
								<p id=menuTitle><%out.print("누가제발");%></p>						
								<p id=menuPrice><%out.print("밥먹을때");%></p>						
							</div>
						</div>
						<%
						}
						%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>목</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingC",today);	//넣어줌
						for(int i=0;i<list.size();i++){							
						%>							
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle><%=list.get(i).getMenuName()%></p>
								<p><%=list.get(i).getSide1()%></p>
								<p><%=list.get(i).getSide2()%></p>
								<p><%=list.get(i).getSide3()%></p>
								<p id=menuPrice><%=list.get(i).getPrice()%>원</p>
							</div>
						</div>	
						<%
						}
						if(list.size() ==0){					
						%>
						<div class="col-lg-12">
							<div class="menu">
								<p id=menuTitle><%out.print("식당가서");%></p>						
								<p id=menuPrice><%out.print("말해주라");%></p>						
							</div>
						</div>
						<%
						}
						%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>금</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingC",today);	//넣어줌
						for(int i=0;i<list.size();i++){							
						%>							
						<div class="weekmenu">
							<div style="min-height:220px;">				
								<p id=menuTitle><%=list.get(i).getMenuName()%></p>
								<p><%=list.get(i).getSide1()%></p>
								<p><%=list.get(i).getSide2()%></p>
								<p><%=list.get(i).getSide3()%></p>
								<p id=menuPrice><%=list.get(i).getPrice()%>원</p>
							</div>
						</div>	
						<%
						}
						if(list.size() ==0){					
						%>
						<div class="col-lg-12">
							<div class="menu">
								<p id=menuTitle><%out.print("등록아직");%></p>						
								<p id=menuPrice><%out.print("안됬다고");%></p>						
							</div>
						</div>
						<%
						}
						%>
					</div>					
				</div>	
									
			</div>
		</div>
		<br><br><br><br>
		
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡ  J  s    ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
   <script language="JavaScript">
//----자동계산 시스템 -------------
		var t1_sell_price;	// 판매가격
		var t1_amount;		// 수량

		var t2_sell_price;	// 판매가격
		var t2_amount;		// 수량

		var t3_sell_price;	// 판매가격
		var t3_amount;		// 수량

		var total_sum;
// 식권선택	
		function init() { 
			t1_sell_price = document.form.t1_sell_price.value;
			t1_amount = document.form.t1_amount.value;

			t2_sell_price = document.form.t2_sell_price.value;
			t2_amount = document.form.t2_amount.value;

			t3_sell_price = document.form.t3_sell_price.value;
			t3_amount = document.form.t3_amount.value;

			total_sum = document.form.total_sum.value;
		}

//1번째 티켓
		function enable_text(status)
		{
			if(status<1){	//unchecked 상태일때 수량,금액 초기화
			document.form.t1_sum.value = 0;
			document.form.t1_amount.value = 0;
			total();
			}
			status=!status	//상태를 변경시킴(true값이 들어오면 , false값)
			document.form.t1_amount.disabled = status;	//사용가능여부 바꿔줌
			document.form.t1_added.disabled = status;	//사용가능여부 바꿔줌
			document.form.t1_deled.disabled = status;	//사용가능여부 바꿔줌
		}
		function add() {
			t1_hm = document.form.t1_amount;
			t1_sum = document.form.t1_sum;
			total_sum = document.form.total_sum;
			t1_hm.value ++ ;
			t1_sum.value = commify(parseInt(t1_hm.value) * t1_sell_price);	//합계에 그대로 반환
			total();
		}
		
		function del() {
			t1_hm = document.form.t1_amount;
			t1_sum = document.form.t1_sum;
				if (t1_hm.value >= 1) {
					t1_hm.value -- ;
					t1_sum.value = commify(parseInt(t1_hm.value) * t1_sell_price);	//합계에 그대로 반환
				}
			total();
		}

//2번째 티켓
		
		function t2_enable_text(status)
		{
			if(status<1){	//unchecked 상태일때 수량,금액 초기화
			document.form.t2_sum.value = 0;
			document.form.t2_amount.value = 0;
			total();
			}
			status=!status	//상태를 변경시킴(true값이 들어오면 , false값)
			document.form.t2_amount.disabled = status;	//사용가능여부 바꿔줌
			document.form.t2_added.disabled = status;	//사용가능여부 바꿔줌
			document.form.t2_deled.disabled = status;	//사용가능여부 바꿔줌
		}
		function t2_add() {
			t2_hm = document.form.t2_amount;
			t2_sum = document.form.t2_sum;
			t2_hm.value ++ ;
			t2_sum.value = commify(parseInt(t2_hm.value) * t2_sell_price);	//합계에 그대로 반환
			total();
		}
		
		function t2_del() {
			t2_hm = document.form.t2_amount;
			t2_sum = document.form.t2_sum;
				if (t2_hm.value >= 1) {
					t2_hm.value -- ;
					t2_sum.value = commify(parseInt(t2_hm.value) * t2_sell_price);	//합계에 그대로 반환
				}
			total();
		}
//3번째 티켓
		
		function t3_enable_text(status)
		{
			if(status<1){	//unchecked 상태일때 수량,금액 초기화
			document.form.t3_sum.value = 0;
			document.form.t3_amount.value = 0;
			total();
			}
			status=!status	//상태를 변경시킴(true값이 들어오면 , false값)
			document.form.t3_amount.disabled = status;	//사용가능여부 바꿔줌
			document.form.t3_added.disabled = status;	//사용가능여부 바꿔줌
			document.form.t3_deled.disabled = status;	//사용가능여부 바꿔줌
		}
		function t3_add() {
			t3_hm = document.form.t3_amount;
			t3_sum = document.form.t3_sum;
			t3_hm.value ++ ;
			t3_sum.value = commify(parseInt(t3_hm.value) * t3_sell_price);	//합계에 그대로 반환
			total();
		}
		
		function t3_del() {
			t3_hm = document.form.t3_amount;
			t3_sum = document.form.t3_sum;
				if (t3_hm.value >= 1) {
					t3_hm.value -- ;
					t3_sum.value = commify(parseInt(t3_hm.value) * t3_sell_price);	//합계에 그대로 반환
				}
			total();
		}

 //1,000단위 마다 콤마찍는 함수		
		function commify(n) {
			var reg = /(^[+-]?\d+)(\d{3})/; // 정규식 
			n += ''; // 숫자를 문자열로 변환
			while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			return n;
		}
		function uncommify(n) {
			var leg = n.length;
			for(var i = 0; i < leg; i++) {
				n = n.replace(',', "");
			}
			return parseInt(n);
		}
		function total() {
			x = document.form.total_sum;
			t1 = document.form.t1_sum;
			t2 = document.form.t2_sum;
			t3 = document.form.t3_sum;
			t1 = uncommify(t1.value);
			t2 = uncommify(t2.value);
			t3 = uncommify(t3.value);
			x.value = commify(t1 + t2 + t3);
		}
</script>
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 식권ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
 
 <div class="container" style="text-align: center;">
	 <form name="form" method="get" action='./payAction.jsp'>
	 	<input type=hidden name="storeID" value="청운관">
	 
	 	<table class="ticket">
		 	<thead>
		 		<tr>
		 			<td>종류</td>
		 			<td>선택</td>
		 			<td>금액</td>
		 			<td>수량</td>
		 			<td>합계</td>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<tr>
					<td>분식류</td>
					<td>
						<input type="checkbox" name="t3" onclick="t3_enable_text(this.checked)"><br> 
					  	<input type=hidden name="t3_sell_price" value="3000">
					</td>
					<td>3,000원</td>
					<td>
						<input type="button"  class="btn btn-default" name="t3_added" value=" + " onclick="t3_add();">
						<input type="text"  class="btn btn-default"  style="width:30px;height:30px;"  name="t3_amount" value="0" size="5" onchange="change();">
						<input type="button" class="btn btn-default"  name="t3_deled" value=" - " onclick="t3_del();"><br> 
					</td>
					<td>
						<input type="text" name="t3_sum" style="text-align:right " size="11" readonly >원
					</td>
				</tr>
		 		<tr>
					<td>식권 1장</td>
					<td>
						<input type="checkbox" name="t1" onclick="enable_text(this.checked)"><br> 
					  	<input type=hidden name="t1_sell_price" value="4000">
					</td>
					<td>4,000원</td>
					<td>
						<input type="button"  class="btn btn-default" name="t1_added" value=" + " onclick="add();">
						<input type="text" class="btn btn-default"  style="width:30px;height:30px;" name="t1_amount" value="0" size="5" onchange="change();">
						<input type="button"  class="btn btn-default" name="t1_deled" value=" - " onclick="del();"><br> 
					</td>
					<td>
						<input type="text" name="t1_sum" style="text-align:right " size="11" readonly >원
					</td>
				</tr>

				<tr>
					<td>식권 10장</td>
					<td>
						<input type="checkbox" name="t2" onclick="t2_enable_text(this.checked)"><br> 
					  	<input type=hidden name="t2_sell_price" value="40000">
					</td>
					<td>40,000원</td>
					<td>
						<input type="button" class="btn btn-default"  name="t2_added" value=" + " onclick="t2_add();">
						<input type="text" class="btn btn-default"  style="width:30px;height:30px;" name="t2_amount" value="0" size="5" onchange="t2_change();">
						<input type="button" class="btn btn-default"  name="t2_deled" value=" - " onclick="t2_del();"><br> 
					</td>
					<td>
						<input type="text" name="t2_sum" style="text-align:right " size="11" readonly >원
					</td>
				</tr>
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="1">
						<h3 style="text-align:center;"> 총 결제금액 </h3>
					</td>
					<td colspan="3"></td>
					<td colspan="1"  style="align-content:right;">
						<input type="text"  style="text-align:right;" name="total_sum" size="11" onchange="total();" readonly> 원
						 
					</td>
				</tr>
			</tfoot>
		</table>
		<br><br><br>
		<input type="submit" class="btn btn-success" value="결 제 하 기" style="width: 200px; height: 70px">
	</form>
</div>

		<br><br><br>   
 
   
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
   