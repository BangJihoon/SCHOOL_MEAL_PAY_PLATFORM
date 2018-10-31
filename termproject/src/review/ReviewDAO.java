package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) {	//�����ۼ� �Լ�
		String SQL = "INSERT INTO review values(NULL,?,?,?,?,?,?,?,?,?,0)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);	//XSS���� ���������� ���� �����ڵ� �ۼ�
			pstmt.setString(1, reviewDTO.getUserID().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(2, reviewDTO.getStoreID().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(3, reviewDTO.getMenuName().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(4, reviewDTO.getReviewTitle().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(5, reviewDTO.getReviewContent().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setInt(6, reviewDTO.getScore1());
			pstmt.setInt(7, reviewDTO.getScore2());
			pstmt.setInt(8, reviewDTO.getScore3());
			pstmt.setFloat(9, reviewDTO.getAvgScore());
			return pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1;	// db���� ����
	}
	
	
	
	//�˻��� ���� ����� ��ȯ
	public ArrayList<ReviewDTO> getList(String storeID, String searchType, String search, int pageNumber){	
		if(storeID.equals("��ü")) {
			storeID = "";
		}
		ArrayList<ReviewDTO> reviewList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			if(searchType.equals("�ֽż�")) {
				SQL = "SELECT * FROM review WHERE storeID LIKE ? AND CONCAT(userID,menuName,reviewTitle,reviewContent) LIKE ? "
						+ "ORDER BY reviewID DESC LIMIT " + pageNumber * 5 + " , " + pageNumber * 5 + 6;
			}
			else if(searchType.equals("��õ��")) {
				SQL = "SELECT * FROM review WHERE storeID LIKE ? AND CONCAT(userID,menuName,reviewTitle,reviewContent) LIKE ? "
						+ "ORDER BY likeCount DESC LIMIT " +  pageNumber * 5 + " , " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,"%"+storeID+"%");
			pstmt.setString(2,"%"+search+"%");
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<ReviewDTO>();
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(9),
						rs.getFloat(10),
						rs.getInt(11)
				);	
				reviewList.add(review);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}			
		}
		return reviewList;			
	}

	
	public int like(String reviewID) {	// ���ƿ� ī��Ʈ �Լ�
		String SQL = "UPDATE review SET likeCount = likeCount+1 WHERE reviewID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,reviewID);
			return pstmt.executeUpdate();		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1;	// db���� ����
	}
	
	
	public int delete(String reviewID) { // ������� �Լ�
		String SQL = "DELETE FROM review WHERE reviewID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,Integer.parseInt(reviewID));
			return pstmt.executeUpdate();		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return -1;	// db���� ����
	}
	
	public String getUserID(String reviewID) {	// �����ۼ��� ���̵������� �Լ�
		String SQL = "SELECT userID FROM review WHERE reviewID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,Integer.parseInt(reviewID));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null;	// ������������
	}
}
