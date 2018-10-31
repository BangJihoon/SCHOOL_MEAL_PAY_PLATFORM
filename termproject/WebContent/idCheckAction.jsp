<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %> 
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String userID = null;
		if(request.getParameter("userID")!=null){
			userID =request.getParameter("userID");
		}	
		if(userID==null ||userID.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디를 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.joinCheck(userID);
		
		if (result ==1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사용가능한 아이디입니다.')");
			script.println("history.back()"); //이전 페이지로 돌려보냄
			script.println("</script>");			
		} 
		else if (result == 0){ // 이미 존재하는 아이디입니다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()"); //이전 페이지로 돌려보냄
			script.println("</script>");			
		} 
		
		else if (result == -1){ // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()"); //이전 페이지로 돌려보냄
			script.println("</script>");			
		}
	%>
</body> 
</html> 