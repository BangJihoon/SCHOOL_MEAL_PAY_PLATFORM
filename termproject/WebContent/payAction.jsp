<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.UserDTO" %>
<%@ page import = "purchase.*" %>
<%@ page import = "ticket.*" %>
<%@ page import = "review.ReviewDAO" %>
<%@ page import = "review.ReviewDTO" %> 
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList"%>
<html>
<body>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


	<%
		String userID = null;
		String storeID=null;
		String storeName=null;
	
		int t1_amount=0;
		int t2_amount=0;
		int t3_amount=0;
		int t4_amount=0;
		
		if(request.getParameter("t1_amount")!=null){
			try{
				t1_amount= Integer.parseInt(request.getParameter("t1_amount"));	
			}catch(Exception e){
				System.out.println("t1_amunot 오류");
			}
		}
		if(request.getParameter("t2_amount")!=null){
			try{
				t2_amount= Integer.parseInt(request.getParameter("t2_amount"));	
			}catch(Exception e){
				System.out.println("t2_amount 오류");
			}
		}
		if(request.getParameter("t3_amount")!=null){
			try{
				t3_amount= Integer.parseInt(request.getParameter("t3_amount"));	
			}catch(Exception e){
				System.out.println("t3_amount 오류");
			}
		}
		if(request.getParameter("t4_amount")!=null){
			try{
				t4_amount= Integer.parseInt(request.getParameter("t4_amount"));	
			}catch(Exception e){
				System.out.println("t4_amount 오류");
			}
		}
		String t1_id=null;
		String t2_id=null;
		String t3_id=null;
		String t4_id=null;
		
		int total_sum = 0;
		String sumtmp= null;
		
		
		request.setCharacterEncoding("UTF-8");
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('올바른 접근이 아닙니다.\n 로그인을 해주세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
// 전달받은 값 ㅡㅡㅡㅡㅡㅡㅡ 저장할 변수 
		
		
// 합계 받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
		if(request.getParameter("total_sum")!=null ||!request.getParameter("total_sum").equals("")){
			try{
				sumtmp= request.getParameter("total_sum");	
				sumtmp= sumtmp.replaceAll(",","");
				total_sum = Integer.parseInt(sumtmp);
			}catch(Exception e){
				System.out.println("합계 오류");
			}
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('선택된 상품이 없습니다.\n 다시 선택 해주시기 바랍니다.')");
			script.println("history.back()"); 
			script.println("</script>");	
		}
// 학식당 ID를 받아 , 식당이름 저장 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

		if(request.getParameter("storeID")!=null){
			storeID =request.getParameter("storeID");
			if(storeID.equals("buildingH"))
				storeName="한림관";
			else if(storeID.equals("buildingC"))
				storeName="청운관";
			else if(storeID.equals("buildingB"))
				storeName="북악관";
		}
		if(request.getParameter("t1_id")!=null || !request.getParameter("t1_id").equals(""))
			t1_id = request.getParameter("t1_id");
		if(request.getParameter("t2_id")!=null || !request.getParameter("t2_id").equals(""))
			t2_id = request.getParameter("t2_id");
		if(request.getParameter("t3_id")!=null || !request.getParameter("t3_id").equals(""))
			t3_id = request.getParameter("t3_id");
		if(request.getParameter("t4_id")!=null || !request.getParameter("t4_id").equals(""))
			t4_id = request.getParameter("t4_id");
		

// DB에서 구매자 정보 (이름, 이메일) 받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
		UserDAO userDAO = new UserDAO();
		String email = userDAO.getEmail(userID);
		String name = userDAO.getName(userID);		
		String merchant = null;	//주문번호 = userID,email,name, 총가격, 날짜, 등등.. 합친 문자열에 base64 인코딩
				
				
 	 	PurchaseDAO purchaseDAO = new PurchaseDAO();

		
		if(userID!=null || total_sum!=0){
	%>
	
	<script>
	
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init('imp79893651'); //iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
		
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : "<%=storeName%>",
	    amount :"<%=total_sum%>",
	    buyer_email : "<%=email%>",
	    buyer_name : "<%=name%>",
	    //buyer_tel : '010-1234-1234',
	    //buyer_addr : '서울특별시 강남구 삼성동',
	    //buyer_postcode : '123-456',   
	    m_redirect_url : 'http://localhost:8080/paySuccess.jsp'
		}, function(rsp) {			//콜백함수
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        msg += '\n결제 금액 : ' + rsp.paid_amount;
		        msg += '\n카드 승인번호 : ' + rsp.apply_num;
			    alert(msg);
			    <%
			    	if(t1_amount!=0){
			    	for(int i=0;i<t1_amount;i++)
			    		purchaseDAO.write(userID,t1_id);
			    	}
				    if(t2_amount!=0){
				    	for(int i=0;i<t2_amount;i++)
				    		purchaseDAO.write(userID,t2_id);
				    }
				    if(t3_amount!=0){
				    	for(int i=0;i<t3_amount;i++)
				    		purchaseDAO.write(userID,t3_id);
				    }
				    if(t4_amount!=0){
				    	for(int i=0;i<t4_amount;i++)
				    		purchaseDAO.write(userID,t4_id);
				    }
			    %>
			    location.href = "paySuccess.jsp";
		    }  
		    else {
		        var msg = '결제에 실패하였습니다.\n';
		        msg += '에러내용 : '+rsp.error_msg;
			    alert(msg);
			    location.href = "<%=storeID%>.jsp";
		    }
		});
			
			
	</script>
	
		<%}%>
		
	</body>
	</html>