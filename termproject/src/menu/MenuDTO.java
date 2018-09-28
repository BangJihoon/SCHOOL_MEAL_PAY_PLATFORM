package menu;

public class MenuDTO {
	private String storeID;
	private String menuDate;
	private String menuName;
	private String side1;
	private String side2;
	private String side3;
	private String price;
	
	public String getStoreID() {
		return storeID;
	}
	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}
	public String getMenuDate() {
		return menuDate;
	}
	public void setMenuDate(String menuDate) {
		this.menuDate = menuDate;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getSide1() {
		return side1;
	}
	public void setSide1(String side1) {
		this.side1 = side1;
	}
	public String getSide2() {
		return side2;
	}
	public void setSide2(String side2) {
		this.side2 = side2;
	}
	public String getSide3() {
		return side3;
	}
	public void setSide3(String side3) {
		this.side3 = side3;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public MenuDTO(){
		
	}
	public MenuDTO(String storeID, String menuDate, String menuName, String side1, String side2, String side3,
			String price) {
		super();
		this.storeID = storeID;
		this.menuDate = menuDate;
		this.menuName = menuName;
		this.side1 = side1;
		this.side2 = side2;
		this.side3 = side3;
		this.price = price;
	}
	
	
	

}
