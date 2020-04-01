//用于updateArticle.jsp的 JavaScript

$(document).ready(function(){
	
	var atype = $("#atypeVal").html();
	$("#classifyRadio input").eq(atype-1).prop("checked",true);
});

function saveArticle()
{
	//进行完整性检查，检查表单是否填完
	var ok = completeCheck();
	if( ok == false )
		return;
	doSwalPart(); 
}
function doSwalPart()
{
	swal(
			{
				title: "确定提交吗？", 
				text: "文章将提交到数据库！", 
				type: "warning",
				showCancelButton: true, 
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "确定", 
				cancelButtonText: "取消",
				closeOnConfirm: false, 
				closeOnCancel: false	
			},
			function(isConfirm)
			{
				if (isConfirm) { 
					swal("提交", "您的文章已经提交。",
					"success");
					setTimeout("returnToBlogIndex()",1500);	//1.5s 后跳转
				} else { 
				swal("取消！", "您取消了上传文章。",
				"error"); 
			} 
		});
}
function returnToBlogIndex()
{
	var aid = $("#idSpan").html();
	var title = $("#titleInput").val();
	var description = $("#descriptionInput").val();
	var articleContent = editor.getContent();
	var len = $("#classifyRadio input").length;
	
	var atype;
	for( var i = 1 ; i <= len ; i++ )
		if( $("#classifyRadio input").eq(i-1).prop("checked") )
		{
			atype = i;
			break;
		}
//	var path = "${pageContext.request.contextPath}/updateArticle";
//	console.log("path "+path);
	$.ajax(
		{
			//实在没有办法，写了绝对路径			
			url:"/MyWebsite/UpdateArticle",
			data:{
				"aid":aid,
				"title":title,
				"content":articleContent,
				"atype":atype,
				"description":description
			},
			type:"post",
			success:function()
			{
				window.location.href="BlogEntrance";
			}
		}
	);
}
function makeRadioChecked()
{
	this.checked = true;
}
//文章信息填写的完整性检查
function completeCheck()
{
	var title = $("#titleInput").val();
	if( title == "" )
	{
		swal("标题不能为空！");
		return false;
	}
	var description = $("#descriptionInput").val();
	if( description == "" )
	{
		swal("描述不能为空！");
		return false;
	}
	var articleContent = editor.getContent();
	if( articleContent == "" )
	{
		swal("文章内容为空！");
		return false;
	}
	var len = $("#classifyRadio input").length;
	var atype = -1;
	for( var i = 1 ; i <= len ; i++ )
		if( $("#classifyRadio input").eq(i-1).prop("checked") )
		{
			atype = i;
			break;
		}
	if( atype == -1 )
	{
		swal("请选择分类！");
		return false;
	}
	return true;
}
