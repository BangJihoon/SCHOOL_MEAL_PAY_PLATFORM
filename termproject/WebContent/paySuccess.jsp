<!-- 사용자-메인 -->
<%@page import="ticket.TicketDAO"%>
<%@page import="purchase.PurchaseDTO"%>
<%@page import="purchase.PurchaseDAO"%>
<%@page import="ticket.TicketDAO"%>
<%@page import="ticket.TicketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="menu.MenuDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="menu.MenuDTO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head> 

<!-- 아임포트 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 바코드 css, js -->	
	<LINK rel=stylesheet type=text/css href="./css/code128.css" media=screen>
	<SCRIPT type=text/javascript src="./js/code128-base.js"></SCRIPT>	

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
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인후 이용가능한 페이지입니다.')");
			script.println("location.href = 'login.jsp'"); 
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
	  			<li class="nav-item"> 
	  				<a class="nav-link" id="navfont" href="index.jsp">메 인</a>
	  			</li>
	  			
				<li class="nav-item dropdown "> 
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
			<li class="nav nav-link right"> 
	  			<a class="nav-link active" id="navfont" href="myPage.jsp">My Ticket</a>
	  		</li>	
	  		
			<ul class="nav navbar-nav navbar-right">	
				<li><a class="nav-link" id="navfont" href="logoutAction.jsp">Logout</a></li>		
			</ul>
 			<%
		 	}else if(userID ==null){
		 	%>
			<ul class="nav navbar-nav navbar-right">					
				<li><a class="dropdown-item" id="navfont" href="join.jsp">Join</a></li>
				<li><a class="dropdown-item" id="navfont" href="login.jsp">Login</a></li>
			</ul>
 			<%
		 	}
			%>
			
		</div>
	</nav>

	
	<div class="form-inline my-3" ></div>
	
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 바디 시작 ,  구매한 식권  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
 <SCRIPT> 
 	new jsb.Rule(".barcode, .barcode2", base2.Barcode.code128behaviour); 
 	function transferVal(code){

 		$('#reCode').val(code)

 		}	
 </SCRIPT>


 <div class="container">
	 	<table class="ticket" style="text-align:center;">
		 	<thead>
		 	
		 		<tr>
                    <td colspan="6"> <h2>구매가 성공적으로 이루어졌습니다.</h2></td>
                </tr>
                <tr>
                    <td colspan="6"> <h1>  </h1></td>
                </tr>
                
		 		<tr>
		 			<td colspan="6"> <h3><%=userID%>님의 식권</h3></td>
		 		</tr>
		 		<tr>
		 			<td>식당</td>
		 			<td>종류</td>
		 			<td>가격</td>
		 			<td>구매일시</td>
		 			<td style="text-align:right;">식권코드</td>
		 			<td>크게보기</td>
		 		</tr>
		 	</thead>
		 	
		 	<tbody>
			<%
		 		TicketDAO ticketDAO = new TicketDAO();
		 		
		 	
		 	 	PurchaseDAO purchaseDAO = new PurchaseDAO();
		 		ArrayList<PurchaseDTO> purchaseList = purchaseDAO.getList(userID);
		 		if(purchaseList.size()>0){
			 		for(int i=0;i<purchaseList.size();i++){
			 			PurchaseDTO purchase = purchaseList.get(i);					// 여러줄 list로 받아옴
			 			TicketDTO ticket = ticketDAO.getInfo(purchase.getTicketID());	//한줄만 DTO형식으로 받아옴
			 			if(!purchase.isUsed()){
			%>
			 		<tr>
						<td><%=ticket.getStoreID()%></td>
			 			<td><%=ticket.getMenuName()%></td>
			 			<td><%=ticket.getPrice()%></td>
			 			<td><%=purchase.getPurchaseDate()%></td>
			 			<td style="height:10vh;"><div class="barcode right" id="code"><%=purchase.getCode()%></div></td>
			 			<td><button class="btn btn-default" data-toggle="modal" href="#viewBarcode">+</button></td>
				
	<!-- 크게보기  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		
	
			<div class="modal fade"  id="viewBarcode" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
				<div class="modal-dialog" >
					<div class="modal-content" >
					<!-- 등록 모달 헤더ㅡㅡ -->		
						<div class="modal-header">
							<h3 class="modal-title" id="modal">학식코드</h3>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>					
							</button>
						</div>
					<!-- 모달 바디ㅡㅡ -->				
						<div class="modal-body">
							<div class="barcode2" style="height:40vh;" value=<%=purchase.getCode()%>><%=purchase.getCode()%></div>				
						</div>					
					</div>
				</div>
			</div>	
						
					</tr>
			<%
				}}}
		 		else{
			 %>	
			 <tr></tr>
					<tr>
						<td colspan="6">
							<p> 아직 구매한 식권이 없습니다.</p>
						</td>
					</tr>
			 <tr></tr>
			<%
				}
		 		//purchaseDAO.write(userID,"c4");
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
	<br><br><br><br><br>
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
   