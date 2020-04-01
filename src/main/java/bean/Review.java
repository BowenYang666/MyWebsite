package bean;

public class Review 
{
	int rid;
	String aid;	//是哪一篇文章的评论
	String photoURL;	//头像URL
	String commentatorName;
	String rtime;
	String htmlCode;
	int thumbUp;
	public String getPhotoURL() {
		return photoURL;
	}
	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}
	public String getCommentatorName() {
		return commentatorName;
	}
	public void setCommentatorName(String commentatorName) {
		this.commentatorName = commentatorName;
	}
	public String getHtmlCode() {
		return htmlCode;
	}
	public void setHtmlCode(String htmlCode) {
		this.htmlCode = htmlCode;
	}
	
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public int getThumbUp() {
		return thumbUp;
	}
	public void setThumbUp(int thumbUp) {
		this.thumbUp = thumbUp;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	
	public Review() {
		super();
	}
	public Review(int rid, String aid, String photoURL, String commentatorName, String rtime, String htmlCode,
			int thumbUp) {
		super();
		this.rid = rid;
		this.aid = aid;
		this.photoURL = photoURL;
		this.commentatorName = commentatorName;
		this.rtime = rtime;
		this.htmlCode = htmlCode;
		this.thumbUp = thumbUp;
	}
	@Override
	public String toString() {
		return "Review [photoURL=" + photoURL + ", commentatorName=" + commentatorName + ", htmlCode=" + htmlCode + "]";
	}
	
}
