<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.UserDTO" %>
<%@ page import = "review.ReviewDAO" %>
<%@ page import = "review.ReviewDTO" %> 
<%@ page import = "java.io.PrintWriter" %>
<html>
<body>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
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
		String storeID=null;
		
		int t1_sell_price = 0;
		int t2_sell_price = 0;
		int t3_sell_price = 0;
		int t4_sell_price = 0;

		int t1_sum= 0;
		int t2_sum= 0;
		int t3_sum= 0;
		int t4_sum= 0;
		
		int t1_amount;
		int t2_amount;
		int t3_amount;
		int t4_amount;
		
		int total_sum = 0;
		String sumtmp= null;
		
// 합계 받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
		if(request.getParameter("total_sum")!=null){
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
// 학식당 ID  받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

		if(request.getParameter("storeID")!=null){
			storeID =request.getParameter("storeID");
		}
// 기타 정보  받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
		if(request.getParameter("t1_sell_price")!=null){
			try{
				t1_sell_price= Integer.parseInt(request.getParameter("t1_sell_price"));	
			}catch(Exception e){
				System.out.println("오류");
			}
		}
		if(request.getParameter("t2_sell_price")!=null){
			try{
				t2_sell_price= Integer.parseInt(request.getParameter("t2_sell_price"));	
			}catch(Exception e){
				System.out.println("오류");
			}
		}
		if(request.getParameter("t3_sell_price")!=null){
			try{
				t3_sell_price= Integer.parseInt(request.getParameter("t3_sell_price"));	
			}catch(Exception e){
				System.out.println("오류");
			}
		}if(request.getParameter("t4_sell_price")!=null){
			try{
				t4_sell_price= Integer.parseInt(request.getParameter("t4_sell_price"));	
			}catch(Exception e){
				System.out.println("오류");
			}
		}
		
		
		if(request.getParameter("t1_sum")!=null){
			try{
				t1_sum= Integer.parseInt(request.getParameter("t1_sum"));	
				t1_amount = t1_sell_price / t1_sum;

			}catch(Exception e){
				System.out.println("오류");
			}
		}
		if(request.getParameter("t2_sum")!=null){
			try{
				t2_sum= Integer.parseInt(request.getParameter("t2_sum"));
				t2_amount = t2_sell_price / t2_sum;

			}catch(Exception e){
				System.out.println("오류");
			}
		}
		if(request.getParameter("t3_sum")!=null){
			try{
				t3_sum= Integer.parseInt(request.getParameter("t3_sum"));	
				t3_amount = t3_sell_price / t3_sum;

			}catch(Exception e){
				System.out.println("오류");
			}
		}if(request.getParameter("t4_sum")!=null){
			try{
				t4_sum= Integer.parseInt(request.getParameter("t4_sum"));
				t4_amount = t4_sell_price / t4_sum;

			}catch(Exception e){
				System.out.println("오류");
			}
		}
		
		
		
// DB에서 구매자 정보 (이름, 이메일) 받아오기 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
		UserDAO userDAO = new UserDAO();
		String email = userDAO.getEmail(userID);
		String name = userDAO.getName(userID);		
		String merchant = null;	//주문번호 = userID,email,name, 총가격, 날짜, 등등.. 합친 문자열에 base64 인코딩
		
		
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
	    name : "<%=storeID%>",
	    amount :"<%=total_sum%>",
	    buyer_email : "<%=email%>",
	    buyer_name : "<%=name%>",
	    //buyer_tel : '010-1234-1234',
	    //buyer_addr : '서울특별시 강남구 삼성동',
	    //buyer_postcode : '123-456',   
	    m_redirect_url : 'http://localhost:8080/paySuccess.jsp'
		}, function(rsp) {			//콜백함수
			if ( rsp.success ) {		// 성공 ==TRUE
				jQuery.ajax({
		    		url: "/payAction.jsp", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
			    		
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			//msg += '\n고유ID : ' + rsp.imp_uid;
		    			//msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		    			
		    			alert(msg);
		    			location.href = "good.jsp";
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.\n';
		        msg += '에러내용 : '+rsp.error_msg;
			    alert(msg);
			    location.href = "index.jsp";
		    }
		});
	</script>
	
		<%}%>
		
	</body>
	</html>