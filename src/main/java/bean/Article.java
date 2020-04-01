package bean;

import java.util.List;

import dao.CategoryDao;

public class Article 
{
	//从数据库查询到所有种类的名称
	
	static List<String> nameList = new CategoryDao().getAllNames();
	
	String aid;
	String aURL;	//文章介绍图片位置
	String atitle;
	int atype;
	String adescription;
	String aauthor;
	String acreationTime;
	int apageView;
	int athumbUp;
	String passageContent;
	String cname;	//分类名称
	String keywords;

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	
	public int getAtype() {
		return atype;
	}
	public void setAtype(int atype) {
		this.atype = atype;
	}
	public String getAdescription() {
		return adescription;
	}
	public void setAdescription(String adescription) {
		this.adescription = adescription;
	}
	public String getAauthor() {
		return aauthor;
	}
	public void setAauthor(String aauthor) {
		this.aauthor = aauthor;
	}
	public String getAcreationTime() {
		return acreationTime;
	}
	public void setAcreationTime(String acreationTime) {
		this.acreationTime = acreationTime;
	}
	public int getApageView() {
		return apageView;
	}
	public void setApageView(int apageView) {
		this.apageView = apageView;
	}
	public int getAthumbUp() {
		return athumbUp;
	}
	public void setAthumbUp(int athumbUp) {
		this.athumbUp = athumbUp;
	}
	public String getPassageContent() {
		return passageContent;
	}
	public void setPassageContent(String passageContent) {
		this.passageContent = passageContent;
	}
	
	
	
	
	public static List<String> getNameList() {
		return nameList;
	}
	public static void setNameList(List<String> nameList) {
		Article.nameList = nameList;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getaURL() {
		return aURL;
	}
	public void setaURL(String aURL) {
		this.aURL = aURL;
	}

	public Article() {
	}

	public Article(String aid, String aURL, String atitle, int atype, String adescription, String aauthor, String acreationTime, int apageView, int athumbUp, String passageContent, String cname, String keywords) {
		this.aid = aid;
		this.aURL = aURL;
		this.atitle = atitle;
		this.atype = atype;
		this.adescription = adescription;
		this.aauthor = aauthor;
		this.acreationTime = acreationTime;
		this.apageView = apageView;
		this.athumbUp = athumbUp;
		this.passageContent = passageContent;
		this.cname = cname;
		this.keywords = keywords;
	}

	@Override
	public String toString() {
		return "Article{" +
				"aid='" + aid + '\'' +
				", aURL='" + aURL + '\'' +
				", atitle='" + atitle + '\'' +
				", atype=" + atype +
				", adescription='" + adescription + '\'' +
				", aauthor='" + aauthor + '\'' +
				", acreationTime='" + acreationTime + '\'' +
				", apageView=" + apageView +
				", athumbUp=" + athumbUp +
				", passageContent='" + passageContent + '\'' +
				", cname='" + cname + '\'' +
				", keywords='" + keywords + '\'' +
				'}';
	}
}
