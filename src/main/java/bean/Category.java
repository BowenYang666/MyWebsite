package bean;

public class Category 
{
	String cid;			
	String cname;
	String ccreationTime;
	String cauthor;
	int cpageView;
	String cdescription;
	int ctype;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCcreationTime() {
		return ccreationTime;
	}
	public void setCcreationTime(String ccreationTime) {
		this.ccreationTime = ccreationTime;
	}
	public String getCauthor() {
		return cauthor;
	}
	public void setCauthor(String cauthor) {
		this.cauthor = cauthor;
	}
	public int getCpageView() {
		return cpageView;
	}
	public void setCpageView(int cpageView) {
		this.cpageView = cpageView;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}
	public int getCtype() {
		return ctype;
	}
	public void setCtype(int ctype) {
		this.ctype = ctype;
	}
	public Category(String cid, String cname, String ccreationTime, String cauthor, int cpageView, String cdescription,
			int ctype) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.ccreationTime = ccreationTime;
		this.cauthor = cauthor;
		this.cpageView = cpageView;
		this.cdescription = cdescription;
		this.ctype = ctype;
	}
	public Category() {
		super();
	}
	
	
	
}
