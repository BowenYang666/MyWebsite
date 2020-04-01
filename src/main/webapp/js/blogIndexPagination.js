var lastElement = "<li><a href='javascript:;'>&raquo;</a></li>";
var currentPage,liSize,totalPageNum;
var atype;

$(document).ready( function () {

    atype = getParameterValue("atype"); //获取文章分类
    if ( atype == null )
        atype = 0;
    currentPage = getParameterValue('pageNum');     //需要展现的页面
    if ( currentPage == null || currentPage == 0 )
        currentPage = 1;

    totalPageNum= $("#paginatorDiv span strong").eq(0).text();     //获取结果数（文章总数）

    totalPageNum = Math.ceil(totalPageNum/6);        //每一页放6条结果，算出多少页
    $("#totalPageNum").text(totalPageNum);      //使用Jquery设置页面元素值（总页数）
    liSize = 5;					//下面存放多少个li

    createElement();			//将所有的li标签创建出来

    $("#paginatorInput").tooltip({         //翻页提示信息的绑定
        title: "请输入合法页码数",
        placement: "top",
        trigger:"manual"
    });


    $("#paginatorInput").keydown(function (event) {
        if ( event.keyCode == 13 )
            gotoPage();
    });

    $("#categoryCard ul li").eq(atype).addClass("active");  //选中文章分类navbar 添加active class
});

function createElement(){
    var l = (currentPage-1)/liSize;
    l = parseInt(l);
    l = l*liSize + 1;		//计算出左边标签的值
    var r = l+liSize-1;		//然后得出右边标签的值
    if( r > totalPageNum )
        r = totalPageNum;

    for ( var i = l ; i <= r ; i++ ) {
        $("#paginatorDiv ul").append(createLiElementByNum(i) );
    }
    $("#paginatorDiv ul").append(lastElement);
    $("#paginatorDiv ul li").eq(currentPage-l+1).addClass("active");


    bindLeftAndRight(l,r);	//这里给前一页和后一页的li添加href

    if( currentPage == 1 ){
        $("#paginatorDiv ul li").eq(0).addClass("disabled");
        $("#paginatorDiv ul li").eq(0).attr("href","javascript:;");
    }
    if( currentPage == totalPageNum ){
        $("#paginatorDiv ul li").eq(r-l+2).addClass("disabled");
        $("#paginatorDiv ul li").eq(r-l+2).attr("href","javascript:;");
    }

}
function createLiElementByNum(num){
    var url_includeQuotes = "'BlogEntrance?atype="+atype+"&pageNum="+num+"'";	//包含了引号
    return "<li><a href="+url_includeQuotes+">"+num+"</a></li>";
}
function bindLeftAndRight(l,r){  //点击前一页和后一页的事件

    var preNum = currentPage-1;
    var nxtNum = parseInt(currentPage)+1;
    var left_url  = "BlogEntrance?atype="+atype+"&pageNum="+preNum;
    var right_url = "BlogEntrance?atype="+atype+"&pageNum="+nxtNum;
    if( currentPage != 1 )
        $("#paginatorDiv ul li a").eq(0).attr("href",left_url);
    if( currentPage != totalPageNum )
        $("#paginatorDiv ul li a").eq(r-l+2).attr("href",right_url);
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
    changeHref(atype,num);
}
function changeHref(keywords,pageNum) {
    window.location.href = "BlogEntrance?atype="+atype+"&pageNum="+pageNum;
}

/**
 * [通过参数名获取url中的参数值]
 */
function getParameterValue(queryName) {
    var reg = new RegExp("(^|&)" + queryName + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if ( r != null ){
        return decodeURI(r[2]);
    }else{
        return 0;
    }
}