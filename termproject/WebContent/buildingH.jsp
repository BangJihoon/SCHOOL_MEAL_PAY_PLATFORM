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
<body  onload="init(); enable_text(false); t2_enable_text(false);"> 		<!--init()함수 로드, 사용상태를 불능 초기화 -->
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
						<a class="dropdown-item"  id="navfont" href="buildingH.jsp">Olive Green</a>
						<a class="dropdown-item" id="navfont"  href="buildingB.jsp">Cafe SP</a>
						<a class="dropdown-item"  id="navfont" href="buildingC.jsp">Cafe SB</a>
						<a class="dropdown-item"  id="navfont" href="buildingC.jsp">Laural</a>
					</div>
				</li>
	  			
	  			<li> 
	  				<a class="nav-link" id="navfont" href="index.jsp">후 기</a>
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


<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ한림관ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="building">
			<p id=buildingTitle>한 림 관</p>
		<div class="todayMenu">
			<div class="todayHead" style="background: Bisque;">
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
					  document.write("<h3>(",weekperiod,"일 ~ ",weekperiod+4,"일)</h3>"); //그주에 월~금 날짜를 출력하길바람 0~5
					</script>
					
					<button href="#">식단 관리</button>
					
				
			</div>
				
				
				<%	
					Calendar firstDayOfWeek = new GregorianCalendar();
					Date date = new Date();	//오늘날짜 받기
					int dday = date.getDay();
					firstDayOfWeek.add(Calendar.DATE, -dday+1);
					
					String today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());	//String  형식으로 변환
					
					MenuDAO menuDAO = new MenuDAO();
					ArrayList<MenuDTO> list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
					
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
						%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>화</p>
							<%
							firstDayOfWeek.add(Calendar.DATE,1);
							today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
							list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
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
							%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>수</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
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
						%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>목</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
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
						%>
					</div>
					
					<div class="col-lg-2 ">					
						<p id=weekmenuTitle>금</p>
						<%
						firstDayOfWeek.add(Calendar.DATE,1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
						list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
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

	// 식권선택	
		function init() { 
			t1_sell_price = document.form.t1_sell_price.value;
			t1_amount = document.form.t1_amount.value;

			t2_sell_price = document.form.t2_sell_price.value;
			t2_amount = document.form.t2_amount.value;


			document.form.t1_sum.value = t1_sell_price;
			document.form.t2_sum.value = t2_sell_price;
			change();
			t2_change();
		}

//1번째 티켓
		
		function change() {
			t1_hm = document.form.t1_amount;	//수량
			t1_sum = document.form.t1_sum;	//합계
		
				if (t1_hm.value < 0) {		// 수량이 음수이면
					t1_hm.value = 0;		//그냥 0반환
				}
			t1_sum.value = commify(parseInt(t1_hm.value) * t1_sell_price);	//수량 x 가격 = 합계
		}
		function enable_text(status)
		{
			if(status<1){	//unchecked 상태일때 수량,금액 초기화
			document.form.t1_sum.value = 0;
			document.form.t1_amount.value = 0;
			}
			status=!status	//상태를 변경시킴(true값이 들어오면 , false값)
			document.form.t1_amount.disabled = status;	//사용가능여부 바꿔줌
			document.form.t1_added.disabled = status;	//사용가능여부 바꿔줌
			document.form.t1_deled.disabled = status;	//사용가능여부 바꿔줌
		}
		function add() {
			t1_hm = document.form.t1_amount;
			t1_sum = document.form.t1_sum;
			t1_hm.value ++ ;
			t1_sum.value = commify(parseInt(t1_hm.value) * t1_sell_price);	//합계에 그대로 반환
		}
		
		function del() {
			t1_hm = document.form.t1_amount;
			t1_sum = document.form.t1_sum;
				if (t1_hm.value >= 1) {
					t1_hm.value -- ;
					t1_sum.value = commify(parseInt(t1_hm.value) * t1_sell_price);	//합계에 그대로 반환
				}
		}
//2번째 티켓

		function t2_change() {
			t2_hm = document.form.t2_amount;	//수량
			t2_sum = document.form.t2_sum;	//합계
		
				if (t2_hm.value < 0) {		// 수량이 음수이면
					t2_hm.value = 0;		//그냥 0반환
				}
			t2_sum.value = commify(parseInt(t2_hm.value) * t2_sell_price);	//수량 x 가격 = 합계
		}
		function t2_enable_text(status)
		{
			if(status<1){	//unchecked 상태일때 수량,금액 초기화
			document.form.t2_sum.value = 0;
			document.form.t2_amount.value = 0;
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
		}
		
		function t2_del() {
			t2_hm = document.form.t2_amount;
			t2_sum = document.form.t2_sum;
				if (t2_hm.value >= 1) {
					t2_hm.value -- ;
					t2_sum.value = commify(parseInt(t2_hm.value) * t2_sell_price);	//합계에 그대로 반환
				}
		}
 	
 	//1,000단위 마다 콤마찍는 함수		
		function commify(n) {
			var reg = /(^[+-]?\d+)(\d{3})/; // 정규식 
			n += ''; // 숫자를 문자열로 변환
			while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			return n;
		}
		
</script>
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 식권ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
 
 <div class="col-xs-10 offset-1">
	 <div class="purchase">
	 <form name="form" method="get">
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
					<td>식권 1장</td>
					<td>
						<input type="checkbox" name="t1" onclick="enable_text(this.checked)"><br> 
					  	<input type=hidden name="t1_sell_price" value="4300">
					</td>
					<td>4,300원</td>
					<td>
						<input type="button" name="t1_added" value=" + " onclick="add();">
						<input type="text" style="width:50px; height:50px;" name="t1_amount" value="0" size="5" onchange="change();">
						<input type="button" name="t1_deled" value=" - " onclick="del();"><br> 
					</td>
					<td>
						<input type="text" name="t1_sum" style="text-align:right " size="11" readonly >원
					</td>
				</tr>

				<tr>
					<td>식권 10장</td>
					<td>
						<input type="checkbox" name="t2" onclick="t2_enable_text(this.checked)"><br> 
					  	<input type=hidden name="t2_sell_price" value="43000">
					</td>
					<td>43,000원</td>
					<td>
						<input type="button" name="t2_added" value=" + " onclick="t2_add();">
						<input type="text" style="width:50px;height:50px" name="t2_amount" value="0" size="5" onchange="t2_change();">
						<input type="button" name="t2_deled" value=" - " onclick="t2_del();"><br> 
					</td>
					<td>
						<input type="text" name="t2_sum" style="text-align:right " size="11" readonly >원
					</td>
				</tr>
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<h1 style="text-align:center;"> 총 결제금액  
							<input type="text"  style="text-align:right;" id="total_sum" size="11" onchange="total();" readonly> 원
						</h1>
					</td>
				</tr>
			</tfoot>
		</table>
		<br><br><br>
		<input type="button" value="결 제 하 기" onclick="pay();"style="width: 200px; height: 70px">
	</form>
	</div>
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
   