<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*" %> 
<%@ page import = "java.io.PrintWriter" %>
<% 
		request.setCharacterEncoding("UTF-8"); 
		String userID = null;
		String userPW = null;		
		String name = null;
		String email = null;		
		boolean admin= false;


		if(request.getParameter("userID")!=null){
			userID =request.getParameter("userID");
		}
		if(request.getParameter("userPW")!=null){
			userPW =request.getParameter("userPW");
		}		
		if(request.getParameter("name")!=null){
			name =request.getParameter("name");
		}
		if(request.getParameter("email")!=null){
			email =request.getParameter("email");
		}
		
		
		if(userID==null ||userID.equals("")||userPW.equals("")||name.equals("")||email.equals("")||userPW==null ||name==null ||email==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(new UserDTO(userID,userPW,name,email,admin));
			
			if (result ==-1){ 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert(' 회원가입에 실패했습니다.')");
				script.println("history.back()"); //이전 페이지(login.jsp)로 돌려보냄
				script.println("</script>");	
			} 
			
			else{  // 로그인 성공 시
				//session.setAttribute("userID",userID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다. 로그인을 해주세요.')");
				script.println("location.href = 'index.jsp'"); 
				script.println("</script>");			
			}
		}	
		
	%>