
window.onload = function()
{
	$("#btnSend").click(function()
	{
		SendMsg();
	});
	
	//1초 간격으로 실행하기
	setInterval(function() 
	{ 
		GetMsg();
	}, 1000);	
			
	GetMsg();
}

function SendMsg()
{
	if($("#msg").val() == "")
	{
		alert("발송 할 메시지를 입력하세요.");
		$("#msg").focus();
		return false;
	}
	var postData = "";
	postData = "msg=" + $("#msg").val();
	
	$.ajax({
		type : "post",
		url: "sendmsg.jsp",
		data: postData,
		dataType: "html",
		success : function(data) 
		{
			$("#msg").val("");
			$("#msg").focus();
			
			GetMsg();
		}
	});	
	
	return false;
}

var cno = "0";
function GetMsg()
{
	$.ajax({
		type : "get",
		url: "getmsg.jsp?cno=" + cno,
		dataType: "html",
		success : function(data) 
		{
			/*
			var org_html = $("#chatMsg").html();
			org_html = data + org_html;
			$("#chatMsg").html(org_html);
			*/			
			data = data.trim();
			var aryMsg = data.split("<!--EOR-->");
			for(i=0;i<aryMsg.length;i++)
			{				
				var item = aryMsg[i].split("<!--EOF-->");
				if(item[0] != "")
				{
					cno = item[0];
					var org_html = $("#chatMsg").html();
					org_html = item[1] + org_html;
					$("#chatMsg").html(org_html);	
				}
			}
			//alert(cno);
		}
	});		
}
