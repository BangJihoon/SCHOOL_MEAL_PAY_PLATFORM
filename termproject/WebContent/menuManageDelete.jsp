<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "likey.LikeyDAO" %>
<%@ page import = "likey.LikeyDTO" %>
<%@ page import = "menu.MenuDAO" %>
<%@ page import = "menu.MenuDTO" %> 
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
		int menuID=0;
		String storeID=null;
		String menuDate=null;
		String menuName=null;
		String side1=null;
		String side2=null;
		String side3=null;
		String price=null;
		
		
		if(request.getParameter("menuID")!=null){
			menuID =Integer.parseInt(request.getParameter("menuID"));
		}	
		if(request.getParameter("storeID")!=null){
			storeID =request.getParameter("storeID");
		}
		if(request.getParameter("menuDate")!=null){
			menuDate =request.getParameter("menuDate");
		}
		if(request.getParameter("menuName")!=null){
			menuName =request.getParameter("menuName");
		}
		if(request.getParameter("side1")!=null){
			side1 =request.getParameter("side1");
		}
		if(request.getParameter("side2")!=null){
			side2 =request.getParameter("side2");
		}
		if(request.getParameter("side3")!=null){
			side3 =request.getParameter("side3");
		}
		if(request.getParameter("price")!=null){
			price =request.getParameter("price");
		}
		
		
		MenuDAO menuDAO = new MenuDAO();
	
		int result = new MenuDAO().delete(menuID);
		if(result>0){
			out.println("<script>alert('삭제가 완료되었습니다.');</script>");
			out.println("<script>location.href='menuManage.jsp?storeID="+storeID+"&menuName="+menuName+"'</script>");
			
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;				
		}
		
		
	%>