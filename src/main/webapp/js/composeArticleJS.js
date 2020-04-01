//用于composeArticle的 JavaScript
//提交数据到 SaveArticle，最后返回blogIndex

function saveArticle()
{
	//进行完整性检查，检查表单是否填完
	var ok = completeCheck();
	if( ok == false )
		return;
	var logged = "";
	//检查是否登录
	logged = window.localStorage.getItem("logged-blog");
	//如果没有登录
	if( logged == null || logged.length == 0 || logged == false ){
		//先把 输入的数据 保存在本地
		saveToLocal();
		
		//再告知用户
		swal({
					title:"您还未登录",
					text:"该界面已经保存,请先前往登录界面",
					type:"warning",
					showCancelButton:true,
					confirmButtonText: "前往",
					cancelButtonText: "取消"
						
				},function(isConfirm){
					if( isConfirm )				//跳转到登录界面,来源是composeArticle
						window.location.href="plugin/loginAndRegister/login.jsp?from=composeArticle";
				} );
		return;
		
	}	//执行提交部分
	else doSwalPart(); 
	
	
	
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
					//上面这条语句执行了 文章提交

				} else { 
				swal("取消！", "您取消了上传文章。",
				"error"); 
			} 
		});
}
function returnToBlogIndex()
{
	var title = $("#titleInput").val();
	var description = $("#descriptionInput").val();
	var articleContent = editor.getContent();
	var len = $("#classifyRadio input").length;
	var keywords = $("#keywordsInput").val();
	var atype;
	for( var i = 1 ; i <= len ; i++ )
		if( $("#classifyRadio input").eq(i-1).prop("checked") )
		{
			atype = i;
			break;
		}
	//console.log("atype:"+atype);
	//console.log("title: "+title);
	//console.log("articleContent "+articleContent);
	$.ajax(
		{
			url:"SaveArticle",
			data:{
				"title":title,
				"content":articleContent,
				"atype":atype,
				"description":description,
				"keywords":keywords
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
	var keywords = $("#keywordsInput").val();
	if ( keywords == "" ){
		swal("关键词为空");
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
function saveToLocal(){
	//首先获取输入数据
	var title = $("#titleInput").val();
	var description = $("#descriptionInput").val();
	var content = editor.getContent();
	var len = $("#classifyRadio input").length;
	var atype;
	for( var i = 1 ; i <= len ; i++ )
		if( $("#classifyRadio input").eq(i-1).prop("checked") )
		{
			atype = i;
			break;
		}
	localStorage.setItem("stored-blog", true);
	localStorage.setItem("title-blog", title);
	localStorage.setItem("description-blog",description);
	localStorage.setItem("content-blog", content);
	localStorage.setItem("atype-blog",atype);
	
}
$(document).ready( function(){
	
	var restore = localStorage.getItem("stored-blog");
	//console.log("restore:"+restore);
	//需要复原
	if( restore == "true" || restore == true ){		//先从localStorage 去取
		var title = localStorage.getItem("title-blog");
		var description = localStorage.getItem("description-blog");
		var content = localStorage.getItem("content-blog");
		var atype = localStorage.getItem("atype-blog");
		
		//然后赋值
		$("#titleInput").attr("value",title);
		//$("#titleInput").val(title);
		$("#descriptionInput").val(description);
		editor.setContent(content);
		$("#classifyRadio input").eq(atype-1).prop("checked",true);
		
		//最后清除掉存储
		localStorage.removeItem("stored-blog");
	}
});
function goBack(){
	window.history.go(-1);
}