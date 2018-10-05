package menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class MenuDAO {
	public ArrayList<MenuDTO> getList(String storeID){
		String SQL = "SELECT * FROM menu WHERE storeID=?";
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
				
				menuDTO.setStoreID(rs.getString(1));
				menuDTO.setMenuDate(rs.getString(2));
				menuDTO.setMenuName(rs.getString(3));
				menuDTO.setSide1(rs.getString(4));
				menuDTO.setSide2(rs.getString(5));
				menuDTO.setSide3(rs.getString(6));
				menuDTO.setPrice(rs.getString(7));
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
		String SQL = "SELECT * FROM menu WHERE storeID=? and menuDate=?";
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
				
				menuDTO.setStoreID(rs.getString(1));
				menuDTO.setMenuDate(rs.getString(2));
				menuDTO.setMenuName(rs.getString(3));
				menuDTO.setSide1(rs.getString(4));
				menuDTO.setSide2(rs.getString(5));
				menuDTO.setSide3(rs.getString(6));
				menuDTO.setPrice(rs.getString(7));
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
		return list;	//데이터에비스오류
	}

}
