package menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class MenuDAO {
	public ArrayList<MenuDTO> getList(String storeID){
		String SQL = "SELECT * FROM menu WHERE storeID=? ORDER BY menuName DESC";
		ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,storeID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuDTO menuDTO= new MenuDTO();

				menuDTO.setMenuID(rs.getInt(1));
				menuDTO.setStoreID(rs.getString(2));
				menuDTO.setMenuDate(rs.getString(3));
				menuDTO.setMenuName(rs.getString(4));
				menuDTO.setSide1(rs.getString(5));
				menuDTO.setSide2(rs.getString(6));
				menuDTO.setSide3(rs.getString(7));
				menuDTO.setPrice(rs.getString(8));
				list.add(menuDTO);					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn!=null) conn.close();} catch(Exception e){e.printStackTrace();}
			try { if(pstmt!=null) pstmt.close();} catch(Exception e){e.printStackTrace();}
			try { if(rs!=null) rs.close();} catch(Exception e){e.printStackTrace();}
		}
		return list;	
	}
	
	
	
	public ArrayList<MenuDTO> getTodayMenu(String storeID,String menuDate) {
		String SQL = "SELECT * FROM menu WHERE storeID=? and menuDate=? ORDER BY menuName DESC";
		ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,storeID);
			pstmt.setString(2,menuDate);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MenuDTO menuDTO= new MenuDTO();

				menuDTO.setMenuID(rs.getInt(1));
				menuDTO.setStoreID(rs.getString(2));
				menuDTO.setMenuDate(rs.getString(3));
				menuDTO.setMenuName(rs.getString(4));
				menuDTO.setSide1(rs.getString(5));
				menuDTO.setSide2(rs.getString(6));
				menuDTO.setSide3(rs.getString(7));
				menuDTO.setPrice(rs.getString(8));
				list.add(menuDTO);					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try { if(pstmt!=null) pstmt.close();}catch(Exception e){e.printStackTrace();}
			try { if(rs!=null) rs.close();}catch(Exception e){e.printStackTrace();}
		}
		return list;	
	}
	
	public ArrayList<MenuDTO> getMenu(String storeID,String menuDate,String menuName) {
		String SQL = null; 
		
		ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			if(menuName.equals("전체")) {
				SQL = "SELECT * FROM menu WHERE storeID=? and menuDate>=? ORDER BY menuName DESC";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,storeID);
				pstmt.setString(2,menuDate);
			}
			else {
				SQL = "SELECT * FROM menu WHERE storeID=? and menuDate>=? and menuName=? ORDER BY menuName DESC";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,storeID);
				pstmt.setString(2,menuDate);
				pstmt.setString(3,menuName);
			}
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MenuDTO menuDTO= new MenuDTO();

				menuDTO.setMenuID(rs.getInt(1));
				menuDTO.setStoreID(rs.getString(2));
				menuDTO.setMenuDate(rs.getString(3));
				menuDTO.setMenuName(rs.getString(4));
				menuDTO.setSide1(rs.getString(5));
				menuDTO.setSide2(rs.getString(6));
				menuDTO.setSide3(rs.getString(7));
				menuDTO.setPrice(rs.getString(8));
				list.add(menuDTO);					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn!=null) conn.close();}catch(Exception e){e.printStackTrace();}
			try { if(pstmt!=null) pstmt.close();}catch(Exception e){e.printStackTrace();}
			try { if(rs!=null) rs.close();}catch(Exception e){e.printStackTrace();}
		}
		return list;	
	}
	public int write(MenuDTO menuDTO) {	//리뷰작성 함수
		String SQL = "INSERT INTO menu values(null,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);	//XSS공격 방지를위해 직접 보안코드 작성
			pstmt.setString(1, menuDTO.getStoreID().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(2, menuDTO.getMenuDate().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(3, menuDTO.getMenuName().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(4, menuDTO.getSide1().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(5, menuDTO.getSide2().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(6, menuDTO.getSide3().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(7, menuDTO.getPrice().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
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
	
	
	public int delete(int menuID) { // 삭제 함수
		String SQL = "DELETE FROM menu WHERE menuID=?";
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,menuID);
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
