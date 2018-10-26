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
		String userPW = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
			
		}
		if(userID !=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");			
		} 
		

		if(request.getParameter("userID")!=null){
			userID =request.getParameter("userID");
		}
		if(request.getParameter("userPW")!=null){
			userPW =request.getParameter("userPW");
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
		if(userPW==null||userPW.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID,userPW);
		
		if (result ==1){ // 로그인 성공 시
			session.setAttribute("userID",userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");			
		} 
		else if (result == 0){ // 비밀번호 오류 시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); //이전 페이지(login.jsp)로 돌려보냄
			script.println("</script>");			
		} 
		else if (result == -1){ // 아이디가 존재하지 않을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()"); //이전 페이지(login.jsp)로 돌려보냄
			script.println("</script>");			
		}
		else if (result == -2){ // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()"); //이전 페이지(login.jsp)로 돌려보냄
			script.println("</script>");			
		}
	%>
</body> 
</html> 