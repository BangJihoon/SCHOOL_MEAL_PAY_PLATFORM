package purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import util.DatabaseUtil;

public class PurchaseDAO {
	
	public String getDate() {
		String SQL = "SELECT NOW()";	//현재시간을 가져오는 sql문구
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();	//쿼리실행결과 가져옴
			if(rs.next()) {				
				return rs.getString(1);	//결과 반환
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;	//데이터에비스오류
	}
	
	public ArrayList<PurchaseDTO> getList(String userID){
		String SQL = "SELECT * FROM purchase WHERE userID=? ORDER BY purchaseDate DESC";
		ArrayList<PurchaseDTO> purchaseList = new ArrayList<PurchaseDTO>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PurchaseDTO purchaseDTO= new PurchaseDTO();
				purchaseDTO.setCode(rs.getString(1));
				purchaseDTO.setUserID(rs.getString(2));
				purchaseDTO.setTicketID(rs.getString(3));
				purchaseDTO.setPurchaseDate(rs.getString(4));
				purchaseDTO.setUsed(rs.getBoolean(5));
				purchaseList.add(purchaseDTO);					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null) conn.close();} catch(Exception e){e.printStackTrace();}
			try { if(pstmt!=null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try { if(rs!=null) rs.close();} catch(Exception e){e.printStackTrace();}
		}
		return purchaseList;	
	}
	
	public int write(String userID, String ticketID) {	//리뷰작성 함수
		String SQL = "INSERT INTO purchase values(?,?,?,?,0)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		Random random = new Random();
		String time =getDate();
		String code = random.nextInt(100) +ticketID +random.nextInt(100) + String.valueOf((char) ((int) (random.nextInt(26)) + 97));
		//일단 코드는 규칙없이 랜덤수 + 티켓아이디 + 핸덤 문자로 조합
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);	
			pstmt.setString(1,code);
			pstmt.setString(2,userID);
			pstmt.setString(3,ticketID);
			pstmt.setString(4,time);
			return pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1;	// db접근 오류
	}
	
}
