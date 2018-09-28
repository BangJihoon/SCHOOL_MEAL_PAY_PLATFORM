<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*" %> 
<%@ page import = "java.io.PrintWriter" %>
<% 
		request.setCharacterEncoding("UTF-8"); 
		String userID = null;
		String userPW = null;
		String school = null;
		String snum = null;
		String name = null;
		String email = null;
		String birth = null;
		String phone = null;


		if(request.getParameter("userID")!=null){
			userID =request.getParameter("userID");
		}
		if(request.getParameter("userPW")!=null){
			userPW =request.getParameter("userPW");
		}
		if(request.getParameter("school")!=null){
			school =request.getParameter("school");
		}
		if(request.getParameter("snum")!=null){
			snum =request.getParameter("snum");
		}
		if(request.getParameter("name")!=null){
			name =request.getParameter("name");
		}
		if(request.getParameter("email")!=null){
			email =request.getParameter("email");
		}
		if(request.getParameter("birth")!=null){
			birth =request.getParameter("birth");
		}
		if(request.getParameter("phone")!=null){
			phone =request.getParameter("phone");
		}
		
		if(userID==null ||userPW==null ||school==null ||snum==null ||name==null ||email==null ||birth==null ||phone==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID,userPW,school,snum,name,email,birth,phone));
		
		if (result ==-1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(' 이미 존재하는 아이디입니다.')");
			script.println("history.back()"); //이전 페이지(login.jsp)로 돌려보냄
			script.println("</script>");	
		} 
		
		else{  // 로그인 성공 시
			session.setAttribute("userID",userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = 'index.jsp'"); //이전 페이지(login.jsp)로 돌려보냄
			script.println("</script>");			
		}
		
	%>