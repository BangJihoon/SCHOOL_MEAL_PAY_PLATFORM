<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.UserDTO" %>
<%@ page import = "review.ReviewDAO" %>
<%@ page import = "review.ReviewDTO" %> 
<%@ page import = "java.io.PrintWriter" %>


	<%
		 request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			script.close();
			return;
		} 
		
		String storeID=null;
		String menuName=null;
		String reviewTitle=null;
		String  reviewContent=null;
		int score1=0;
		int score2=0;
		int score3=0;
		float avgScore = 0;
		
		if(request.getParameter("storeID")!=null){
			storeID =request.getParameter("storeID");
		}
		if(request.getParameter("menuName")!=null){
			menuName =request.getParameter("menuName");
		}
		if(request.getParameter("reviewTitle")!=null){
			reviewTitle =request.getParameter("reviewTitle");
		}
		if(request.getParameter("reviewContent")!=null){
			reviewContent =request.getParameter("reviewContent");
		}
		if(request.getParameter("score1")!=null){
			try{
				score1= Integer.parseInt(request.getParameter("score1"));	
			}catch(Exception e){
				System.out.println("점수1 오류!");
			}
		}
		if(request.getParameter("score2")!=null){
			try{
				score2= Integer.parseInt(request.getParameter("score2"));	
			}catch(Exception e){
				System.out.println("점수2 오류!");
			}
		}
		if(request.getParameter("score3")!=null){
			try{
				score3= Integer.parseInt(request.getParameter("score3"));	
			}catch(Exception e){
				System.out.println("점수3 오류!");
			}
		}
		if(score1!=0 || score2!=0 || score3!=0){
			avgScore = (float)(score1 + score2 + score3) / 3;
		}
		
		if(storeID==null ||menuName==null ||reviewTitle==null ||reviewContent==null ||score1==0 ||score2==0 ||score3==0 ||
				avgScore==0 || reviewTitle.equals("") || reviewContent.equals("")||storeID.equals("")||menuName.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		
		ReviewDAO reviewDAO = new ReviewDAO();
		int result = reviewDAO.write(new ReviewDTO(0,userID,storeID,menuName,reviewTitle,reviewContent,score1,score2,score3,avgScore,0));
		
		if (result ==-1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('후기 평가글이 등록되지 않았습니다.')");
			script.println("history.back()"); 
			script.println("</script>");	
		} 
		
		else if(result==1){  
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('평가글이 정상 등록 되었습니다.')");
			script.println("location.href = 'review.jsp'"); 
			script.println("</script>");			
		}
		
	%>