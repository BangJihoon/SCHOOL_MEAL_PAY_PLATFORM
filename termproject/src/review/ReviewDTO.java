package review;

public class ReviewDTO {

	int reviewID;
	String userID;
	String storeID;
	String menuName;
	String reviewTitle;
	String  reviewContent;
	int score1;
	int score2;
	int score3;
	float avgScore;
	int likeCount;
	
	
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getScore3() {
		return score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	public float getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	public ReviewDTO(){	
	}
	public ReviewDTO(int reviewID, String userID, String storeID, String menuName, String reviewTitle,
			String reviewContent, int score1, int score2, int score3, float avgScore, int likeCount) {
		super();
		this.reviewID = reviewID;
		this.userID = userID;
		this.storeID = storeID;
		this.menuName = menuName;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.score1 = score1;
		this.score2 = score2;
		this.score3 = score3;
		this.avgScore = avgScore;
		this.likeCount = likeCount;
	}
	
	

	
}
