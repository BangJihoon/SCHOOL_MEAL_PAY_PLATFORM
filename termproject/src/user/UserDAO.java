package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,false)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getSchool());
			pstmt.setString(4, user.getSnum());
			pstmt.setString(5, user.getName());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getBirth());
			pstmt.setString(8, user.getPhone());
			return pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
		return -1; 	//������ -1
	}
	
	
	public int login(String userID,String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW))
					return 1; //�α��μ���
				else
					return 0; //��й�ȣ ����ġ
			}
			
			return -1;	// ���̵𰡾���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	// db���� ����
	}
	
	
}
