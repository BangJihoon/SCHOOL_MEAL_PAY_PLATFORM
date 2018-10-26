package user;

public class UserDTO {

	private String userID;
	private String userPW;
	private String name;
	private String email;
	private boolean admin;
	
	
	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getUserPW() {
		return userPW;
	}


	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}


	public UserDTO() {
	}


	public UserDTO(String userID, String userPW,String name, String email, boolean admin) {
		super();
		this.userID = userID;
		this.userPW = userPW;
		this.name = name;
		this.email = email;
		this.admin = admin;
	}
	
	
}
