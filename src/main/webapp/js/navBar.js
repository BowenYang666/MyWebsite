
function makeBarActive(obj)
{
	var list = $("#navBarDiv li");
	for( var i = 0 ; i < list.length ; i++)
		$("#navBarDiv li").eq(i).removeClass("active");
	
	$(obj).addClass("active");
}
//$( function(){
//	$("#myNavBar").load("navbar.html");
//})
//$( function(){
////	var editor = UE.getEditor('container');
////      editor.ready( function(){
////      	editor.setContent("");
////      	editor.setHeight(300);
////      });
//        
//	$("#myFooter").load("footer.html");
//})

function makeBarActive2( type )
{
	$("#navBarDiv li").eq(type).addClass("active");
}
$(document).ready( function(){
	$("#myNavBar").load("navbar.html");
	$("#myFooter").load("footer.html");
	
	//var val = $("#passNavData").text();
	//console.log(val+" why");
	//makeBarActive2(4);
	//$("#navBarDiv li").eq(4).addClass("active");
});