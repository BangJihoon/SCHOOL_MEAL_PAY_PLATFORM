<!-- 사용자-메인 -->
<%@page import="menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.*" %>
<%@ page import="menu.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/clock.css" >
	
	<TITLE>SKU_Bab- 학식결제,식권관리</TITLE>

</head>
<body>
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
 
<!-- 본문 -->

 	
 <!-- ㅡㅡㅡㅡ 메인 점보트론 사진 ㅡㅡㅡㅡㅡㅡ  -->
 
	<div class="container-fluid">
		<div class="jumbotron">
			<h1 class="text-center" style="font-size:80;">서경대학교 학식</h1><br>
			<h2 class="text-center">스마트한 식권구매 및 관리 </h2>
			<p class="text-center">오랫동안 줄서서 뽑지말고, 메뉴보고 바로결제</p>	
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ 전자시계 ㅡㅡㅡㅡㅡㅡㅡㅡ -->	
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
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ 전자시계 ㅡㅡㅡㅡㅡㅡㅡㅡ -->		
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메뉴시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	

<div class="form-inline">				
	<div class="col-lg-10 offset-1">	
	<div class="todayMenu">
			
		<div class="todayHead">
			<h1>Today</h1><h2>
				<script>
				  wkday = ["일","월","화","수","목","금","토"];
				  today = new Date(); 
				  //document.write(today.getFullYear(),"년 ");
				  document.write(today.getMonth()+1,"월 ");
				  document.write(today.getDate()+"일 ");
				  document.write("[",wkday[today.getDay()],"요일]");  //요일주의
				  tdate = today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate()
				  //document.write(tdate);
				</script>
			</h2>
		</div>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ한림관ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="building">
			<a href="buildingH.jsp">
				<p id=buildingTitle>한 림 관</p>
			</a>
			<div class="form-inline">
				<%
					ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
					list = new MenuDAO().getTodayMenu("buildingH", "2018-09-28");
					
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
				%>

			</div>
			
		</div>
		<img src="img/outline.jpg" width=100% height=80px>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 북악관 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	<div class="building">
		<a href="buildingB.jsp">
			<p id=buildingTitle>북 악 관</p>
		</a>
			<div class="form-inline">
				<%
				ArrayList<MenuDTO> list2 = MenuDAO.getTodayMenu("buildingB", "2018-09-28");
					
					for(int i=0;i<list2.size();i++){
				%>					
				<div class="col-lg-4">
					<div class="menu">
						<p id=menuTitle><%=list2.get(i).getMenuName()%></p>
						<p><%=list2.get(i).getSide1()%></p>
						<p><%=list2.get(i).getSide2()%></p>
						<p><%=list2.get(i).getSide3()%></p>
						<p id=menuPrice><%=list2.get(i).getPrice()%></p>						
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
		<img src="img/outline.jpg" width=100% height=80px>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 청운관 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
		<div class="building">
		<a href="buildingC.jsp">
			<p id=buildingTitle>청 운 관</p>
		</a>	
			<div class="form-inline">
				<%
				ArrayList<MenuDTO> list3 = MenuDAO.getTodayMenu("buildingC", "2018-09-28");
					
					for(int i=0;i<list3.size();i++){
				%>					
				<div class="col-lg-4">
					<div class="menu">
						<p id=menuTitle><%=list3.get(i).getMenuName()%></p>
						<p><%=list3.get(i).getSide1()%></p>
						<p><%=list3.get(i).getSide2()%></p>
						<p><%=list3.get(i).getSide3()%></p>
						<p id=menuPrice><%=list3.get(i).getPrice()%></p>						
					</div>
				</div>
				<%
				}	
				%>

			</div>
		</div>
	</div>
</div></div>
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 메 뉴 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		   
    
		<img src="img/outline.gif" width=100%>
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
<!-- 애니메이션 참조 -->

	<script src="js/jquery-1.11.1.min.js"></script> 
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
	<script src ="http://code.jquery.com/jquery-1.10.2.js"></script>
</body> 
</html> 
   