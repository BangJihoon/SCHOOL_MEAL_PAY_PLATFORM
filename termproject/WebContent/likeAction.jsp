<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "likey.LikeyDAO" %>
<%@ page import = "review.ReviewDAO" %> 
<%@ page import = "java.io.PrintWriter"%>
<%!
	public static String getCilentIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip ==null || ip.length()==0){
			ip = request.getHeader("Prixy-Cilent-IP");
		}
		if(ip ==null || ip.length()==0){
			ip = request.getHeader("WL-Proxy-Cilent-IP");
		}
		if(ip ==null || ip.length()==0){
			ip = request.getRemoteAddr();
		}
		return ip;
	}
%>

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
		LikeyDAO likeyDAO = new LikeyDAO();
		int result = likeyDAO.like(userID,reviewID,getCilentIP(request)); //좋아요 db저장
		if(result == 1){	//db저장 성공시
			result = reviewDAO.like(reviewID);	//좋아요 count ++ 함수실행
				if(result == 1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('공감 하셨습니다')");
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
			script.println("alert('이미 추천하셨습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;				
		}
		
		
		
		
	%>