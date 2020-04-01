
function setImg()
{
	$.ajax(
		{
			url:"../SetImgOneClick",
			success:function(){
				alert("yes");
			},
			error:function(){
				alert("no");
			}
		}
	);
}
