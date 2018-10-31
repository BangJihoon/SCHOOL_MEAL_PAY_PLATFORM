<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "likey.LikeyDAO" %>
<%@ page import = "likey.LikeyDTO" %>
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
		
		String reviewID=null;
		if(request.getParameter("reviewID")!=null){
			reviewID =request.getParameter("reviewID");
		}
		ReviewDAO reviewDAO = new ReviewDAO();
		if(userID.equals(reviewDAO.getUserID(reviewID))){
			int result = new ReviewDAO().delete(reviewID);
			if(result ==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가 완료되었습니다.')");
				script.println("location.href = 'review.jsp'");
				script.println("</script>");
				script.close();
				return;
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터 베이스 오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;				
			}
			
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제할수있는 권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;				
		}
		
		
		
	%>