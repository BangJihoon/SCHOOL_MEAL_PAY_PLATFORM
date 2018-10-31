<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.UserDTO" %>
<%@ page import = "menu.*" %>
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
		String menuDate=null;
		String menuName=null;
		String side1=null;
		String side2=null;
		String side3=null;
		String price=null;
		
		
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
		
		
		
		if(storeID==null ||menuDate==null ||menuName==null ||side1==null ||price==null ||
				storeID.equals("") || menuDate.equals("")||menuName.equals("")||side1.equals("")||price.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		
		MenuDAO menuDAO = new MenuDAO();
		int result = menuDAO.write(new MenuDTO(0,storeID,menuDate,menuName,side1,side2,side3,price));
		
		if (result ==-1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('메뉴등록이 이루어지지 않았습니다.')");
			script.println("history.back()"); 
			script.println("</script>");
			script.close();
		} 
		
		else if(result==1){  
			out.println("<script>alert('메뉴가 등록 되었습니다.');</script>");
			out.println("<script>location.href='menuManage.jsp?storeID="+storeID+"&menuName="+menuName+"'</script>");
		}
		
	%>