package util;

import java.util.Comparator;

import bean.Article;

public class ArticleComparator implements Comparator<Article>{

	@Override
	public int compare(Article o1, Article o2) {
		// TODO Auto-generated method stub
		if (o1.getApageView() != o2.getApageView() ) {
			return o2.getApageView()-o1.getApageView();
		}
		else return o2.getAthumbUp()-o1.getAthumbUp();
		
	}

}
