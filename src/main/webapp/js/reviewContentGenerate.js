/**
 * 生成评论中随机的部分
 */
$(document).ready(function () {
	$("#contentDiv p").css("background-color","initial");	//去掉p标签白色阴影
	

});

function generateName()
{
	var nameList = ["大王叫我来巡山","你好吗","66123","想你不知依林阿根廷",
		"挪威的夜晚","程序猿","1024","Hello","Tim","蔡","一个人的寂寞","我很好",
		"小老弟啊","天赐良鸡"];
	var len = nameList.length;
	var pos = Math.round( Math.random()*len );	//获取0-len，不包括len，的下标
	return nameList[pos];
}
function generatePhoto()
{
	var len = 15;	//目前有15张头像图片
	var pos = Math.round( Math.random()*len );	//获取0-len，不包括len，的下标
	return "img/reviewPhoto/"+pos+".jpg";
}