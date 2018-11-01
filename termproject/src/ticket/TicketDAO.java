package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TicketDAO { 	//데이터 가져오기만 필요!  저장,수정은 필요없는 fixed데이터
		
	public ArrayList<TicketDTO> getList(String storeID){		//리스트 형식으로 업체별 해당 식권 반환
		String SQL = "SELECT * FROM ticket WHERE storeID=? ORDER BY menuName DESC";
		ArrayList<TicketDTO> list = new ArrayList<TicketDTO>();
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,storeID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TicketDTO ticketDTO= new TicketDTO();

				ticketDTO.setTicketID(rs.getString(1));
				ticketDTO.setStoreID(rs.getString(2));
				ticketDTO.setMenuName(rs.getString(3));
				ticketDTO.setPrice(rs.getString(4));
				list.add(ticketDTO);					
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

}
