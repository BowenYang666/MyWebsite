//主要是处理分页

var currentPos;
var lastPos;
var pageSize;
var pageNum;	//页面总数
$(document).ready( function() {
	
	currentPos = lastPos = 1;		//最开始在第1页
	pageSize = 4;		//每一页有多少篇文章
	
	addLi(pageSize);	//添加分页符号
	
	gotoPage(1,pageSize);
}
); 
/**
 * 分页函数
 * pno--页数
 * psize--每页显示记录数
 * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数
 * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能
 **/
function gotoPage(currentPage,pageSize)	//两个参数表示 当前页号、每一页的行数
{
	lastPos = currentPos;
	currentPos = currentPage;
	
	removePageNumActive(lastPos);
	makePageNumActive(currentPos);
	
	
    var list = document.getElementById("articleTable");
	var total = list.children.length-1;
	//获取文章长度，-1是因为还有个标题
	//alert(total);

    var startRow = (currentPage - 1) * pageSize+1;//开始显示的行  31 
    var endRow = currentPage * pageSize;		//结束显示的行   40
    endRow = (endRow > total)? total : endRow;    //避免最后一页过少
   // console.log(startRow+" "+endRow);
      
    //遍历显示数据实现分页
    for( var i = 1 ; i <= total ; i++ )
    {
        //var irow = myTable.rows[i-1];
        if(	i>=startRow && i <= endRow )
        {
        	$("#articleTable > div").eq(i).show();
            //irow.style.display = "block";    
        }
        else
        {
        	$("#articleTable > div").eq(i).hide();
            //irow.style.display = "none";
        }
    }
    if( currentPos == 1 )
    	$("nav ul li").eq(0).addClass('disabled');
    else $("nav ul li").eq(0).removeClass('disabled');
    
    if( currentPos == pageNum )
    	$("nav ul li").last().addClass('disabled');
    else $("nav ul li").last().removeClass('disabled');
    
}
function addLi( pageSize )
{
	var list = document.getElementById("articleTable");
	var total = list.children.length-1;
	//获取文章长度，-1是因为还有个标题
	//alert(total);
	pageNum = (total-1)/pageSize+1;
	pageNum = Math.trunc(pageNum);
	for( var i = 1 ; i <= pageNum ; i++ )
	{
		var s = "<li><a href='#'>"+i+"</a></li>";
		$("nav ul").append(s);
		$('nav ul li').eq(i).bind('click', {startPage:i, pSize:pageSize}, function(event) 
		{
			//console.log(event.data.startPage);
			gotoPage(event.data.startPage,event.data.pSize);
			
		});
	}
	var last = "<li><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>"
	$("nav ul").append(last);
	
	$("nav ul li").eq(0).bind('click',{},previousPage );
	$("nav ul li").last().bind('click',{},nextPage );
	
	//console.log("pageNUm "+pageNum );
}
function previousPage()
{
	if( currentPos != 1 )
	{
		gotoPage(currentPos-1,pageSize);
		
	}
}
function nextPage()
{
	if( currentPos != pageNum )
	{
		gotoPage(currentPos+1,pageSize);
	}
}
function makePageNumActive( pos )
{
	$(".pagination li").eq(pos).addClass("active");
}
function removePageNumActive( pos )
{
	$(".pagination li").eq(pos).removeClass("active");
}

//-----------------------------------------------------------------------

var lastElement = "<li><a href='javascript:;'>&raquo;</a></li>";
var currentPage,liSize,totalPageNum;

$(document).ready( function () {


	totalPageNum= $("#paginatorDiv nav span strong").eq(0).text();     //获取结果数
	totalPageNum = Math.ceil(pageNum/10);        //每一页放10条结果，算出多少页

	var requireNum = $("#passData").text();     //需要展现的页面
	$("#totalPageNum").text(totalPageNum);      //使用Jquery设置页面元素值（总页数）
	liSize = 5;					//下面存放多少个li

	currentPage= requireNum;
	createElement();			//将所有的li标签创建出来

	$("#searchInput").tooltip({         //输入为空提示信息绑定
		title:"关键字为空",
		placement:"bottom",
		trigger:"manual"
	});
	$("#paginatorInput").tooltip({         //翻页提示信息的绑定
		title: "请输入合法页码数",
		placement: "top",
		trigger:"manual"
	});

	$("#searchInput").keydown(function (event) {
		if ( event.keyCode == 13 ){             //当用户在输入框按下回车时
			if ( isSearchInputEmpty() )     //如果输入框为空，则给出提示，然后return
				return;
			keywords = $("#searchInput").val();
			changeHref(keywords,1);       //执行搜索查询
		}
	});
	$("#searchBtn").click(function (event) {
		//当用户在点击搜索按钮时
		if ( isSearchInputEmpty() )     //如果输入框为空，则给出提示，然后return
			return;
		keywords = $("#searchInput").val();
		changeHref(keywords,1);       //执行搜索查询

	});

	$("#paginatorInput").keydown(function (event) {
		if ( event.keyCode == 13 )
			gotoPage();
	});
});
function isSearchInputEmpty() {
	if ( $("#searchInput").val() == "" ){   //判断是否为空
		$("#searchInput").tooltip("show");
		setTimeout( function() {
				$("#searchInput").tooltip("hide");
			}
			,1500);
		return true;
	}
	return false;
}
function createElement(){
	var l = (currentPage-1)/liSize;
	l = parseInt(l);
	l = l*liSize + 1;		//计算出左边标签的值
	var r = l+liSize-1;		//然后得出右边标签的值
	if( r > totalPageNum )
		r = totalPageNum;

	for ( var i = l ; i <= r ; i++ ) {
		$("#paginator ul").append(createLiElementByNum(i) );
	}
	$("#paginator ul").append(lastElement);
	$("#paginator ul li").eq(currentPage-l+1).addClass("active");


	bindLeftAndRight(l,r);	//这里给前一页和后一页的li添加href

	if( currentPage == 1 ){
		$("#paginator ul li").eq(0).addClass("disabled");
		$("#paginator ul li").eq(0).attr("href","javascript:;");
	}
	else if( currentPage == totalPageNum ){
		$("#paginator ul li").eq(r-l+2).addClass("disabled");
		$("#paginator ul li").eq(r-l+2).attr("href","javascript:;");
	}

}
function createLiElementByNum(num){
	var url_includeQuotes = "'query?keywords="+keywords+"&page="+num+"'";	//包含了引号
	return "<li><a href="+url_includeQuotes+">"+num+"</a></li>";
}
function bindLeftAndRight(l,r){  //点击前一页和后一页的事件

	var preNum = currentPage-1;
	var nxtNum = parseInt(currentPage)+1;
	var left_url  = "query?keywords="+keywords+"&page="+preNum;
	var right_url = "query?keywords="+keywords+"&page="+nxtNum;
	if( currentPage != 1 )
		$("#paginator ul li a").eq(0).attr("href",left_url);
	if( currentPage != totalPageNum )
		$("#paginator ul li a").eq(r-l+2).attr("href",right_url);
}
function gotoPage() {
	var num = $("#paginatorInput").val();
	// console.log("gotoPage num:"+num);
	if ( num == "" || num > totalPageNum || num <= 0 || isNaN(num) ){
		$("#paginatorInput").tooltip("show");       //显示提示信息
		setTimeout(function () {
			$("#paginatorInput").tooltip("hide");       //定时关闭提示信息
		},1500);
		return;
	}
	changeHref(keywords,num);
}
function changeHref(keywords,pageNum) {
	window.location.href = "query?keywords="+keywords+"&page="+pageNum;
}
// function pageInputKeyDown(event) {
//     if ( event.keyCode == 13 )
//         gotoPage();
// }