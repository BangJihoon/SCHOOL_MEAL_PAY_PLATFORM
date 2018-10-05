package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) {
		String SQL = "INSERT INTO review values(NULL,?,?,?,?,?,?,?,?,?,0)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reviewDTO.getUserID());
			pstmt.setString(2, reviewDTO.getStoreID());
			pstmt.setString(3, reviewDTO.getMenuName());
			pstmt.setString(4, reviewDTO.getReviewTitle());
			pstmt.setString(5, reviewDTO.getReviewContent());
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
		return -1;	// db접근 오류
	}

}
