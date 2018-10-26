<!-- 사용자-메인 -->
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="menu.MenuDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="menu.MenuDTO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="review.ReviewDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URLEncoder" %>
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
<body style="background:rgba(71, 99, 255, 0.1);"> 		
	<%
	request.setCharacterEncoding("UTF-8");
	String storeID = "전체";
	String searchType = "최신순";
	String search= "";
	int pageNumber = 0;
	if(request.getParameter("storeID")!=null){
		storeID = request.getParameter("storeID");
	}
	if(request.getParameter("searchType")!=null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search")!=null){
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber")!=null){
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}catch(Exception e){
			System.out.println("검색페이지 번호오류");
		}
	}


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
	  			<li> 
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
	  			
	  			<li class="nav-item active"> 
	  				<a class="nav-link" id="navfont" href="review.jsp">후 기</a>
	  			</li>
			</ul>
			
			<% 	
		 	if(userID!=null){				
			%>
			<ul class="nav navbar-nav navbar-right">	
				<li><a class="dropdown-item" href="myPage.jsp"><%=userID%>'s 식권</a></li>		
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


<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 게시판 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
	
	<div style="margin:30px;">
		<p id=buildingTitle>REVIEW 게시판</p>
		<section>				
			<form method="get" action="review.jsp" class="form-inline mt-3">
				<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" data-target=".bd-example-modal-lg" 
				href="#registerModal" style="width:200px;"> 리뷰 쓰기 </a>
				<select name="storeID" class="form-control mx-1 mt-2">
					<option value="전체">전체</option>
					<option value="한림관" <%if(storeID.equals("한림관")) out.println("selected");%> >한림관</option>
					<option value="북악관" <%if(storeID.equals("북악관")) out.println("selected");%> >북악관</option>
					<option value="청운관" <%if(storeID.equals("청운관")) out.println("selected");%> >청운관</option>
				</select>
				<select name="searchType" class="form-control mx-1 mt-2">
					<option value="최신순" <%if(searchType.equals("최신순")) out.println("selected");%>>최신순</option>
					<option value="추천순" <%if(searchType.equals("추천순")) out.println("selected");%> >추천순</option>				
				</select>
				<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
				<button type="submit" class="btn btn-outline-success mx-1 mt-2">검색</button>
				
			</form>
		</section>
	</div>	
		
		<%
		DecimalFormat format = new DecimalFormat("0.00");
		
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		reviewList = new ReviewDAO().getList(storeID, searchType, search, pageNumber);
		if(reviewList !=null)
			for(int i=0; i<reviewList.size();i++){
				if(i==5) break;
				ReviewDTO review = reviewList.get(i);
			
		%>
		
<!-- 리뷰게시판      ㅡㅡ -->	
<div style="margin:30px;">	
	
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-4 text-left mt-3">  
						<h5><%=review.getReviewTitle()%></h5>
					</div>
					<div class="col-8 text-right">
						[ 장소 : <b><%=review.getStoreID()%>&nbsp</b>
						    메뉴 : <b><%=review.getMenuName()%></b>		]						
						작성자 :<b><%=review.getUserID()%>님 &nbsp </b>
						<b>종합 <span style="color:red;"><%=format.format(review.getAvgScore())%> </span> 점</b>
						<a class="btn btn-default " onClick="return confirm('삭제 하시겠습니까?')" href="./deleteAction.jsp?reviewID=<%=review.getReviewID()%>">삭제</a>
					</div>
				</div>
			</div>
			<div class="card-body">
				
				<p class="card-text"><%=review.getReviewContent()%></p>
				<div class="row">
					<div class="col-6 text-left">
						맛<span style="color:red;"><%=review.getScore1()%></span>점
						위생<span style="color:red;"><%=review.getScore2()%></span>점
						서비스<span style="color:red;"><%=review.getScore3()%></span>점
					</div>
					<div class="col-6 text-right">		
						<span  style="color:green; text-align: left;"><b>추천 <%=review.getLikeCount()%>&nbsp</b></span>
						<a class="btn btn-success"  href="./likeAction.jsp?reviewID=<%=review.getReviewID()%>">공감</a>
						<a class="btn btn-danger" data-toggle="modal" href="#reportModal">신고</a>		
					
					</div>
				</div>
			</div>			
		</div>
</div>
		
		<%
			}	
		%>
		
<!-- 페이지 네이션 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<ul class="pagination pagination-lg justify-content-center mt-3">
		<li class="page-item">
		<%
			if(pageNumber <=0){
		%>	
			<a class="page-link disabled">Previous</a>	
		<%
			} else{
		%>
			<a class="page-link" href="review.jsp?storeID=<%=URLEncoder.encode(storeID,"UTF-8")%>&searchType=
			<%=URLEncoder.encode(searchType,"UTF-8")%>&search=<%=URLEncoder.encode(search,"UTF-8")%>&pageNumber=<%=pageNumber - 1%>">Previous
			</a>
		<%
			}
		%>
		</li>
		<li>
		<%
			if(reviewList.size() < 6){
		%>	
			<a class="page-link disabled">Next</a>	
		<%
			} else{
		%>
			<a class="page-link" href="review.jsp?storeID=<%=URLEncoder.encode(storeID,"UTF-8")%>&searchType=
			<%=URLEncoder.encode(searchType,"UTF-8")%>&search=<%=URLEncoder.encode(search,"UTF-8")%>&pageNumber=
			<%=pageNumber + 1 %>">Next</a>
		<%
			}
		%>
		</li>
	</ul>
		
	
<!-- 등록 모달창  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		

		<div class="modal fade bd-example-modal-lg" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				<!-- 등록 모달 헤더ㅡㅡ -->		
					<div class="modal-header">
						<h3 class="modal-title" id="modal">후기등록</h3>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>					
						</button>
					</div>
				<!-- 등록 모달 바디ㅡㅡ -->				
					<div class="modal-body">
					
						<form action="reviewRegisterAction.jsp" method="post">
							<div class="form-row">
								<div class="form-group col-sm-6">
									<label>장 소</label>
									<select name="storeID" class="form-control" >
										<option value="" selectde>장소를 선택해주세요</option>
										<option value="한림관">한림관</option>
										<option value="북악관">북악관</option>
										<option value="청운관">청운관</option>
									</select>
								</div>
								<div class="form-group col-sm-6">
									<label>메 뉴</label>
									<input type="text" name="menuName" class="form-control" maxlength="40">
								</div>
							</div>
				
				<!-- 등록 모달 제목과 내용  ㅡㅡ -->			
							<div class="form-group">
								<label>제목</label>
								<input type="text" name="reviewTitle" class="form-control" maxlength="40">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea name="reviewContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
							</div>
				<!-- 등록 모달 평가부분ㅣㅡㅡ -->		
							<div class="form-row">
								<div class="form-group col-sm-4">
									<label>맛</label>
									<select name="score1" class="form-control" >
										<option value="5" selected>5점</option>
										<option value="4">4점</option>
										<option value="3">3점</option>
										<option value="2">2점</option>
										<option value="1">1점</option>
									</select>
								</div>		
								<div class="form-group col-sm-4">
									<label>위생</label>
									<select name="score2" class="form-control" >
										<option value="5" selected>5점</option>
										<option value="4">4점</option>
										<option value="3">3점</option>
										<option value="2">2점</option>
										<option value="1">1점</option>
									</select>
								</div>						
								<div class="form-group col-sm-4">
									<label>서비스</label>
									<select name="score3" class="form-control" >
										<option value="5" selected>5점</option>
										<option value="4">4점</option>
										<option value="3">3점</option>
										<option value="2">2점</option>
										<option value="1">1점</option>
									</select>
								</div>								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary">등록하기</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
<!-- 등록 모달 끝       ㅡㅡ -->	

	
<!-- 신고 모달창  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		

		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<!-- 등록 모달 헤더ㅡㅡ -->		
					<div class="modal-header">
						<h3 class="modal-title" id="modal">신고하기</h3>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>					
						</button>
					</div>
				<!-- 신고 모달 바디ㅡㅡ -->				
					<div class="modal-body">
						<form action="reportAction.jsp" method="post">	
							<input type="hidden" name="reviewID" class="form-control" maxlength="40">
							<div class="form-group">
								<label>신고 제목</label>
								<input type="text" name="reportTitle" class="form-control" maxlength="40">
							</div>
							<div class="form-group">
								<label>신고 내용</label>
								<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
							</div>						
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-danger" >신고하기</button>
							</div>
						</form>				
					</div>					
				</div>
			</div>
		</div>
<!-- 신고 모달 끝       ㅡㅡ -->			


		

   
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
   