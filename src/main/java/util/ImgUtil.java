package util;

import java.util.Random;

public class ImgUtil {
	
	//该方法没有查询文件，所以存在问题	,如果在img/article 添加了新的图片，这里面的数字要修改
	public static String getRandomImgName(){
		Random random = new Random();
		String firstPart ="img/article/",secondPart = ".jpg";
		int num;
		int type = random.nextInt(2);
		if ( type == 0 ) {
			firstPart += "编程";
			num = random.nextInt(3)+1;
		}
		else{
			firstPart += "programming";
			num = random.nextInt(7)+1;
		}
		//做了数字和字符串的拼接
		String ans =firstPart+String.valueOf(num)+secondPart;
		return ans;
	}
}
