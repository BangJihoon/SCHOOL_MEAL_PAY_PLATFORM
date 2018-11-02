package purchase;

public class PurchaseDTO {
	private String code;
	private String userID;
	private String ticketID;
	private String purchaseDate;
	private boolean isUsed;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTicketID() {
		return ticketID;
	}
	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public boolean isUsed() {
		return isUsed;
	}
	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}
	public PurchaseDTO(String code, String userID, String ticketID, String purchaseDate, boolean isUsed) {
		super();
		this.code = code;
		this.userID = userID;
		this.ticketID = ticketID;
		this.purchaseDate = purchaseDate;
		this.isUsed = isUsed;
	}
	
	public PurchaseDTO() {
		
	}
	
}
