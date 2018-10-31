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
		String email = null;
		if(request.getParameter("email")!=null){
			email =request.getParameter("email");
		}	
		
		if(email==null ||email.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		
		UserDAO userDAO = new UserDAO();
		String result = userDAO.emailCheck(email);
		
		if (result==null){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사용가능한 email입니다.')");
			script.println("history.back()"); //이전 페이지로 돌려보냄
			script.println("</script>");
			script.close();
		} 
		else{ // 이미 존재하는 아이디입니다.
			out.println("<script>alert('이미 가입된 이메일입니다.');</script>");
			out.println("<script>history.back();</script>");
		} 
		
	%>
</body> 
</html> 