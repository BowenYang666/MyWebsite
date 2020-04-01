/**
 *  检查登录 账号密码合法性
 */

//管理员登录
function adminSubmit()
{
	
	//alert("submit");
	var password = $("#inputPassword").val();
	//console.log("pass: "+password);
	if( password == "" )
	{
		swal("密码不能为空!");
		return;
	}
	$.ajax({
		url:"AdminCheck",
		data:{"password":password},
		type:"post",
		success:function(){
			window.location.href="admin/adminIndex.jsp";
		},
		error:function()
		{
			swal("密码错误!");
		}
	});
}