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
<body > 	
	<%
		// 로그인이 된 정보 담기
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		// 세션이 존재하면 아이디값을 받아 관리
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");	
		}
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인후 이용가능한 페이지입니다.')");
			script.println("location.href = 'login.jsp'"); 
			script.println("</script>");	
		}
		boolean auth = userDAO.isAdm(userID);
		if(auth!=true){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자만 접근 가능합니다.')");
			script.println("history.back();"); 
			script.println("</script>");	
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
	<div class="form-inline my-3" ></div>
	
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 바디 시작 ,  구매한 식권  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<%	

	String storeID = null;
	String store = null;
	String menuName="전체";
	
	if(request.getParameter("storeID") != null) {
		storeID = (String) request.getParameter("storeID");	
	}
	if(request.getParameter("menuName") != null) {
		menuName = (String) request.getParameter("menuName");	
	}
	
	if(storeID.equals("buildingH")) { store="한림관";}
	else if(storeID.equals("buildingC"))  {store="청운관";}
	else if(storeID.equals("buildingB"))  {store="북악관";}
	
	Calendar firstDayOfWeek = new GregorianCalendar();
	Date date = new Date();	//오늘날짜 받기
	int dday = date.getDay();	//오늘 요일
	firstDayOfWeek.add(Calendar.DATE, -dday+1);	//월요일 날짜
	
	String today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());	//월요일날짜를 today에 담음
	firstDayOfWeek.add(Calendar.DATE, +5);	//금요일 날짜
	String lastDay = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());	//월요일날짜를 today에 담음
	firstDayOfWeek.add(Calendar.DATE, -5);	//월요일 날짜
	
	
%>

 <div class="container">
	 	<table class="table table-condensed" style="text-align:center; font-family: 'Do Hyeon', sans-serif">
		 	<thead>
		 		<tr>
		 			<td colspan="7"> <h5 style="color:skyblue"> 관리자만 접속가능한 <big style="color:blue"><%=store%></big> 식단관리 페이지 입니다.</h5></td>
		 		</tr>
		 		<tr>
			 		<td colspan="1"> 
						<a href="<%=storeID%>.jsp" class="btn btn-light " role="button"><%=store%> 돌아가기</a>
					</td>
		 			<td> 
		 				<button type="button" class="btn btn-outline-info" value="지난주">지난주</button>
		 			</td>
		 			<td colspan="3"> 
		 				<h5><%=today%> 월 ~ <%=lastDay%> 금</h5>
		 			</td>
		 			<td>
		 				<button type="button" class="btn btn-outline-info "value="다음주" >다음주</button>
		 			</td>
		 			
		 			<td class="form-inline">
		 				<form action="menuManage.jsp">
		 					<input type="hidden" name="storeID" value=<%=storeID%>>
			 				<select name="menuName" id="menuName" class="form-control mx-1 mt+2">
								<option value="전체" selected>전체보기</option>
								<%if(storeID.equals("buildingH")){%>
									<option value="한식" <%if(menuName.equals("한식")) out.println("selected");%>>한식</option>
									<option value="특식" <%if(menuName.equals("특식")) out.println("selected");%>>특식</option>
									<option value="양식" <%if(menuName.equals("양식")) out.println("selected");%>>양식</option>
								<%} %>
								<%if(storeID.equals("buildingB")){%>
									<option value="Kitchen1" <%if(menuName.equals("Kitchen1")) out.println("selected");%>>Kitchen1</option>
									<option value="Kitchen2" <%if(menuName.equals("Kitchen2")) out.println("selected");%>>Kitchen2</option>
									<option value="분식" <%if(menuName.equals("분식")) out.println("selected");%>>분식</option>
								<%} %>
								<%if(storeID.equals("buildingC")){%>
									<option value="인터네셔널" <%if(menuName.equals("인터네셔널")) out.println("selected");%>>인터네셔널</option>
									<option value="한식" <%if(menuName.equals("한식")) out.println("selected");%>>한식</option>
									<option value="분식" <%if(menuName.equals("분식")) out.println("selected");%>>분식</option>
									<option value="추가" <%if(menuName.equals("추가")) out.println("selected");%>>추가</option>
								<% } %>
							</select>
							<input type="submit" class="btn btn-outline-success mt+2" value="선택">
						</form>
					</td>
		 		</tr>
		 		<tr style="border-bottom: 3px solid #168; border-top: 3px solid #168;">
		 			<td>날짜</td>
		 			<td>메뉴종류</td>
		 			<td>메인메뉴</td>
		 			<td>사이드1</td>
		 			<td>사이드2</td>
		 			<td>가격</td>
		 			<td>올리기</td>
		 		</tr>
		 	</thead>	
			 	
		 		 	
		 	<tbody>
		 		<%
		 			MenuDAO menuDAO = new MenuDAO();
			 		ArrayList<MenuDTO> menulist = new ArrayList<MenuDTO>();
			 		menulist = new MenuDAO().getMenu(storeID,today,menuName);	
					if(!menuName.equals("전체")){
						
				%>
				<tr style="border-top: 3px solid #168;">
				 	<td colspan="7"><h5>날짜별 <%=menuName%>메뉴 올리기</h5></td>
				</tr>
				<%
				 		for(int i=0; i<5; i++){
			 	%>
						<form action="menuManageUpdate.jsp" method="post">
							<tr>				
				 				<input type="hidden" name="storeID" value=<%=storeID%>>
								<td><input type="hidden" name="menuDate"  class="form-control" value=<%=today%>><%=today%></td>
					 			<td><input type="hidden" name="menuName"  class="form-control" value=<%=menuName%>><%=menuName%></td>
					 			<td><input type="text" name="side1"  class="form-control" placeholder="필수입력"></td>
					 			<td><input type="text" name="side2"  class="form-control" placeholder="선택사항"></td>
					 			<td><input type="text" name="side3"  class="form-control" placeholder="선택사항"></td>
					 			<td>
						 			<select name="price" id="price" class="form-control mx-1 mt+2">
										<%if(storeID.equals("buildingH")){%>
											<option value="4300" selected>4,300원</option>
										<%} %>
										<%if(storeID.equals("buildingB")){%>
											<option value="4000" <%if(menuName.equals("kitchen1")||menuName.equals("kitchen2")) out.println("selected");%>>4,000원</option>
											<option value="3300" <%if(menuName.equals("분식")) out.println("selected");%>>3,300원</option>
										<%} %>
										<%if(storeID.equals("buildingC")){%>
											<option value="4000" <%if(menuName.equals("인터네셔널")||menuName.equals("한식")) out.println("selected");%>>4,000원</option>
											<option value="2500" <%if(menuName.equals("분식")) out.println("selected");%> >2,500원</option>
											<option value="500"  <%if(menuName.equals("추가")) out.println("selected");%> >500원</option>
										<% } %>
									</select>
					 			</td>
					 			<td><input type="submit"  class="btn btn-outline-success" value="저장"></td>
					 		</tr>
				 		</form>
				<%
				 		firstDayOfWeek.add(Calendar.DATE,+1);
						today = new SimpleDateFormat("yyyy-MM-dd").format(firstDayOfWeek.getTime());
					}}
			 	%>
			 	<tr><td colspan="7"><h5></h5></td></tr>
			 	<tr style="border-top: 3px solid #168;">
				 	<td colspan="7"><h5>현재 등록된 메뉴</h5></td>
				</tr>
			 	<%
			 		for(int i=0; i<menulist.size(); i++){	
			 			MenuDTO menu = menulist.get(i);
			 	%>
					<form action="menuManageDelete.jsp" method="post">
						<tr>
				 			<input type="hidden" name="storeID" value=<%=storeID%>>
				 			<input type="hidden" name="menuID" value=<%=menu.getMenuID()%>>
							<td><input type="hidden" name="menuDate" value=<%=menu.getMenuDate()%>><%=menu.getMenuDate()%></td>
				 			<td><input type="hidden" name="menuName" value=<%=menu.getMenuName()%>><%=menu.getMenuName()%></td>
				 			<td><input type="hidden" name="side1" value=<%=menu.getSide1()%>><%=menu.getSide1()%></td>
				 			<td><input type="hidden" name="side2" value=<%=menu.getSide2()%>><%=menu.getSide2()%></td>
				 			<td><input type="hidden" name="side3" value=<%=menu.getSide3()%>><%=menu.getSide3()%></td>
				 			<td><input type="hidden" name="price" value=<%=menu.getPrice()%>><%=menu.getPrice()%></td>
				 			<td><input type="submit"  class="btn btn-outline-danger" value="삭제"></td>
				 		</tr>
				 	</form>
		 		<%
					}
		 		%>
			</tbody>
			
			<tfoot>
				<tr>
					
				</tr>
			</tfoot>
		</table>
		
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
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"> </script>
	<script src ="js/bootstrap.min.js"> </script>
	<script src ="js/jquery.min.js"> </script>
	<script src ="js/popper.js"> </script>
	
</body> 
</html> 
   