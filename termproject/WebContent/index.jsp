<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.UserDAO" %>
<%@ page import="menu.MenuDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="menu.MenuDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/clock.css" > 
  	
	<TITLE>SKU_Bab- 학식메뉴,식권결제 스마트하게</TITLE>
</head>
<body >
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
				<li><a class="dropdown-item" href="myPage.jsp">My Ticket</a></li>		
				<li><a class="dropdown-item" href="logoutAction.jsp">Logout</a></li>		
			</ul>
 			<%
		 	}else if(userID == null){
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
 
<!-- ㅡㅡㅡㅡㅡㅡㅡ 회전식  캐러셀 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ   -->
<div id="demo" class="carousel slide" data-ride="carousel" >

 <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
<!-- 캐러설 본문, 컨텐트 -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/main.jpg" class="d-block w-100" >
      <div class="carousel-caption" >
        <h2>서경대학교 <br> 학식</h2>
        <p class="text-center">스마트한 식권구매, 학식리뷰 </p>  

      </div>
    </div>
    
    <div class="carousel-item">
      <img src="img/main2.jpg">
        <div class="carousel-caption">
      <h2 class="text-center"> 줄이길어슬펐던 서경인이여 </h2>
      <p class="text-center">오랫동안 줄서서 뽑지말고, <br>메뉴보고 바로구매</p> 
    </div>
    </div>
    <div class="carousel-item">
      <img src="img/main5.jpg">
        <div class="carousel-caption">
      <h2 class="text-center"> 메뉴가 궁금했던 서경인에게 </h2>
      <p class="text-center"> 5G급 업로드로 화답</p> 
    </div>
    </div>
  </div>
  
 <!-- 캐러설 컨트롤러 -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev" >
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- 회전목마 활성화 -->
<script>
$(document).ready(function(){
    // Activate Carousel with a specified interval
    $("#myCarousel").carousel({interval: 1000});
        
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    
    // Enable Carousel Controls
    $(".carousel-control-prev").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".carousel-control-next").click(function(){
        $("#myCarousel").carousel("next");
    });
});
</script>


 <!-- ㅡㅡㅡㅡ 메인 점보트론 사진 ㅡㅡㅡㅡㅡㅡ 
 

	<div class="container-fluid">
		<div class="jumbotron">
			<h1  style="font-size:60; text-align:center">서경대학교 학식</h1><br>
			<br><br><br><br>
			
			
			
			<h2 class="text-center">스마트한 식권구매 및 관리 </h2>
			<p class="text-center">오랫동안 줄서서 뽑지말고, 메뉴보고 바로결제</p>	
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>
	 -->
	
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ 전자시계 ㅡㅡㅡㅡㅡㅡㅡㅡ 
					<div class="col-6 offset-3" style="align-content:center;">
						<div id="clock" class="light">
							<div class="display">
								<div class="weekdays"></div>
								<div class="ampm"></div>
								<div class="alarm"></div>
								<div class="digits"></div>
							</div>
						</div>
					</div>
						<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
						<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
						<script src="js/jquery.digitalclock.js"></script>
				 ㅡㅡㅡㅡㅡㅡㅡㅡ 전자시계 ㅡㅡㅡㅡㅡㅡㅡㅡ -->		
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	
<div class="form-inline">				
	<div class="container">

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 오늘 날짜 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	
		<div class="todayHead" style="text-align: center">
			<h1>Today</h1><h2>
				<script>
				  wkday = ["일","월","화","수","목","금","토"];
				  today = new Date(); 
				  //document.write(today.getFullYear(),"년 ");
				  document.write(today.getMonth()+1,"월 ");
				  document.write(today.getDate()+"일 ");
				  document.write("[",wkday[today.getDay()],"요일]");  //요일주의
				  //tdate =today.toISOString().slice(0,10);
				  //document.write(tdate);
				</script>
			</h2>
		</div>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ한림관ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="building">
			<a href="buildingH.jsp">
				<p id=buildingTitle style="border-style: outset;">
				한 림 관</p>
			</a>
			<div class="form-inline">
				<%
					Date date = new Date();	//오늘날짜 받기
					String today = new SimpleDateFormat("yyyy-MM-dd").format(date);	//String  형식으로 변환
					

					MenuDAO menuDAO = new MenuDAO();
					ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
					list = menuDAO.getTodayMenu("buildingH",today);	//넣어줌
					
				
					for(int i=0;i<list.size();i++){
				%>					
				<div class="col-lg-4">
					<div class="menu">
						<p id=menuTitle><%=list.get(i).getMenuName()%></p>
						<p><%=list.get(i).getSide1()%></p>
						<p><%=list.get(i).getSide2()%></p>
						<p><%=list.get(i).getSide3()%></p>
						<p id=menuPrice><%=list.get(i).getPrice()%></p>						
					</div>
				</div>
				<%
				}
				if(list.size() ==0){					
				%>
				<div class="col-lg-12">
					<div class="menu">
						<p id=menuTitle><%out.print("오늘 메뉴가 등록되지 않았습니다");%></p>						
						<p id=menuPrice><%out.print("조금만 기다려 주세요");%></p>						
					</div>
				</div>
				<%
				}
				%>
			</div>
			
			
		</div>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 북악관 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	<div class="building">
		<a href="buildingB.jsp">
			<p id=buildingTitle style="border-style: outset;">북 악 관</p>
		</a>
			<div class="form-inline">
				<%
					list = menuDAO.getTodayMenu("buildingB",today);
					for(int i=0;i<list.size();i++){
				%>					
				<div class="col-lg-4">
					<div class="menu">
						<p id=menuTitle><%=list.get(i).getMenuName()%></p>
						<p><%=list.get(i).getSide1()%></p>
						<p><%=list.get(i).getSide2()%></p>
						<p><%=list.get(i).getSide3()%></p>
						<p id=menuPrice><%=list.get(i).getPrice()%></p>						
					</div>
				</div>
				<%
				}
				if(list.size() ==0){					
				%>
				<div class="col-lg-12">
					<div class="menu">
						<p id=menuTitle><%out.print("오늘 메뉴가 등록되지 않았습니다");%></p>						
						<p id=menuPrice><%out.print("조금만 기다려 주세요");%></p>						
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 청운관 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
		<div class="building">
		<a href="buildingC.jsp">
			<p id=buildingTitle style="border-style: outset;">청 운 관</p>
		</a>	
			<div class="form-inline">
				<%
					list = menuDAO.getTodayMenu("buildingC", today);
					for(int i=0;i<list.size();i++){
				%>					
				<div class="col-lg-4">
					<div class="menu">
						<p id=menuTitle><%=list.get(i).getMenuName()%></p>
						<p><%=list.get(i).getSide1()%></p>
						<p><%=list.get(i).getSide2()%></p>
						<p><%=list.get(i).getSide3()%></p>
						<p id=menuPrice><%=list.get(i).getPrice()%></p>						
					</div>
				</div>
				<%
				}
				if(list.size() ==0){					
				%>
				<div class="col-lg-12">
					<div class="menu">
						<p id=menuTitle><%out.print("오늘 메뉴가 등록되지 않았습니다");%></p>						
						<p id=menuPrice><%out.print("조금만 기다려 주세요");%></p>						
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div></div>
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메 뉴 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		   

<!--   footer    -->
    <footer style="background-color: skyblue; color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
                    <br>
                    <p>불편 피드백은 메일로 주세요 <br>jihoon289@naver.com</p>
           			  <h5><strong> CopyRight &copy; OWL Right Reserved</strong></h5>
                </div>
            </div>
        </div>
    </footer>
    
<!-- 애니메이션 참조 -->

  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  	
	<script src="js/jquery-1.11.1.min.js"></script> 
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
	<script src ="http://code.jquery.com/jquery-1.10.2.js"></script>
</body> 
</html> 
   