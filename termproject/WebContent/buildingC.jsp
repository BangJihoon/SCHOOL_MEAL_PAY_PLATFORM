<!-- 사용자-메인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.*" %>
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
		<a class="br12" href="index.jsp">SKU Bab</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">	
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div id="navbar1" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">	
	  			<li class="nav-item active"> 
	  				<a class="nav-link" href="index.jsp">Main</a>
	  			</li>
				<li class="nav-item dropdown"> 
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">Menu</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="buildingB.jsp">한림관</a>
						<a class="dropdown-item" href="buildingB.jsp">북악관</a>
						<a class="dropdown-item" href="buildingB.jsp">청운관</a>
					</div>
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
		<div class="main">
			<h1>6월 1주 식단 </h1>
			<div class="w3l_menu_grids">
				<div class="w3l_menu_grid">
						<div class="w3l_main_grid_top">
							<h3><span>월요일</span></h3>
						</div>
						<div class="w3l_main_grid_middle">
							<ul>	
								<h3><li>베이컨 김치 볶음밥</li></h3>
								<h3><li>메콤 닭갈비 덮밥</li></h3>
								<h3><li>크림파스타 & 유부초밥</li></h3>
							</ul>
						</div>
				</div>
				<div class="w3l_menu_grid">
						<div class="w3l_main_grid_top">
							<h3><span>화요일</span></h3>
						</div>
						<div class="w3l_main_grid_middle">
							<ul>	
								<h3><li>베이컨 김치 볶음밥</li></h3>
								<h3><li>메콤 닭갈비 덮밥</li></h3>
								<h3><li>크림파스타 & 유부초밥</li></h3>
							</ul>
						</div>
				</div>
				<div class="w3l_menu_grid">
						<div class="w3l_main_grid_top">
							<h3><span>수요일</span></h3>
						</div>
						<div class="w3l_main_grid_middle">
							<ul>	
								<h3><li>베이컨 김치 볶음밥</li></h3>
								<h3><li>메콤 닭갈비 덮밥</li></h3>
								<h3><li>크림파스타 & 유부초밥</li></h3>
							</ul>
						</div>
				</div>
				<div class="w3l_menu_grid">
						<div class="w3l_main_grid_top">
							<h3><span>목요일</span></h3>
						</div>
						<div class="w3l_main_grid_middle">
							<ul>	
								<h3><li>베이컨 김치 볶음밥</li></h3>
								<h3><li>메콤 닭갈비 덮밥</li></h3>
								<h3><li>크림파스타 & 유부초밥</li></h3>
							</ul>
						</div>
				</div>
				<div class="w3l_menu_grid">
						<div class="w3l_main_grid_top">
							<h3><span>금요일</span></h3>
						</div>
						<div class="w3l_main_grid_middle">
							<ul>	
								<h3><li>베이컨 김치 볶음밥</li></h3>
								<h3><li>메콤 닭갈비 덮밥</li></h3>
								<h3><li>크림파스타 & 유부초밥</li></h3>
							</ul>
						</div>
				</div>
			</div>
			
		</div>
 
		<div class="main">
			<h1>오늘의 메뉴 </h1>
			<div class="w3l_main_grids">

				<div class="w3l_main_grid">
					<div class="w3l_main_grid_top">
						<h3><span>북악관</span></h3>
						<img src="img/1.jpg"  max-width=90%; width=auto;  height=auto; margin=10px />
					</div>
					<div class="w3l_main_grid_middle">
						<ul>	
							<h3><li>베이컨 김치 볶음밥</li></h3>
							<h3><li>메콤 닭갈비 덮밥</li></h3>
							<h3><li>크림파스타 & 유부초밥</li></h3>
						</ul>
					</div>
					<div class="w3ls_order">
						<h3>4,200원</h3>
						<a class="popup-with-zoom-anim" href="buildingB.jsp">메뉴 더보기</a>
					</div>

				</div>

				<div class="w3l_main_grid">
					<div class="w3l_main_grid_top">
						<h3><span>청운관</span></h3>
						<img src="img/2.jpg"  max-width=100%; width = auto;  height=auto/>
					</div>
					<div class="w3l_main_grid_middle">
						<ul>	
							<h3><li>베이컨 김치 볶음밥</li></h3>
							<h3><li>메콤 닭갈비 덮밥</li></h3>
							<h3><li>크림파스타 & 유부초밥</li></h3>
						</ul>
					</div>
					<div class="w3ls_order">
						<h3>3,800원</h3>
						<a class="popup-with-zoom-anim" href="buildingC.jsp">메뉴 더보기</a>
					</div>

				</div>

				<div class="w3l_main_grid">
					<div class="w3l_main_grid_top">
						<h3><span>한림관</span></h3>
						<img src="img/3.jpg"  max-width=100%; width = auto;  height=auto/>
					</div> 
					<div class="w3l_main_grid_middle">
						<ul>	
							<h3><li>베이컨 김치 볶음밥</li></h3>
							<h3><li>메콤 닭갈비 덮밥</li></h3>
							<h3><li>크림파스타 & 유부초밥</li></h3>
							
						</ul>
					</div>
					<div class="w3ls_order">
						<h3>4,300원</h3>
						<a class="popup-with-zoom-anim" href="buildingH.jsp">메뉴 더보기</a>
					</div>
				</div>
 
<!--   footer    
    <footer style="background-color: skyblue; color:black;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
                    <br>
                    <p>불편 피드백은 메일로 주세요 <br>jihoon289@naver.com
           			  <h5><strong> CopyRight &copy; OWL Right Reserved</strong></h5>
                    </ul>
                </div>
            </div>
        </div>
    </footer>-->
<!-- 애니메이션 참조 -->

	<script src="js/jquery-1.11.1.min.js"></script> 
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
</body> 
</html> 
   