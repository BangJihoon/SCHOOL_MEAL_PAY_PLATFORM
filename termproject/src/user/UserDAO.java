package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,false)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			return pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}	
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
	public int joinCheck(String userID) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;	//�̹� �����ϴ� ȸ��
			}
			else
				return 1;	//���԰����� ���̵�
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}	
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}	
		}
		return -1; 	//������ -1
	}
	public int emailCheck(String email) {
		String SQL = "SELECT * FROM USER WHERE email = ?";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;	//�̹� �����ϴ� ȸ��
			}
			else
				return 1;	//���԰����� ���̵�
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}	
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}	
		}
		return -1; 	//������ -1
	}
	public String getEmail(String userID) {	// �����ۼ��� ���̵������� �Լ�
		String SQL = "SELECT email FROM user WHERE userID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
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
	public String getName(String userID) {	// �����ۼ��� ���̵������� �Լ�
		String SQL = "SELECT name FROM user WHERE userID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
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
	public boolean isAdm(String userID) {	// �����ۼ��� ���̵������� �Լ�
		String SQL = "SELECT admin FROM user WHERE userID = ? ";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return false;	// ������������
	}
}
