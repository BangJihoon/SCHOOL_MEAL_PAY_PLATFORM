package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TicketDAO { 	//������ �������⸸ �ʿ�!  ����,������ �ʿ���� fixed������
		
	public ArrayList<TicketDTO> getList(String storeID){		//����Ʈ �������� ��ü�� �ش� �ı� ��ȯ
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
