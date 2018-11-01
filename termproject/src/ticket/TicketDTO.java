package ticket;

public class TicketDTO {
	private String ticketID;
	private String storeID;
	private String menuName;
	private String price;
	
	public String getTicketID() {
		return ticketID;
	}
	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}
	public String getStoreID() {
		return storeID;
	}
	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public TicketDTO() {
		
	}
	public TicketDTO(String ticketID, String storeID, String menuName, String price) {
		super();
		this.ticketID = ticketID;
		this.storeID = storeID;
		this.menuName = menuName;
		this.price = price;
	}
	
}
