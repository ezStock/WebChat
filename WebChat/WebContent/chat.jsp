<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");

String nick = request.getParameter("nick");
if(nick == null)
{
	%>
	<script>
		alert("닉네임을 지정한 후 채팅방에 참여하세요!!");
		document.location = "join.jsp";
	</script>
	<%
	return;
}
session.setAttribute("nick", nick);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>웹 채팅</title>
		<script src="jquery-3.6.0.js"></script>
		<script src="chat.js" charset="utf-8"></script>
	</head>
	<body>
		<style>
			div
			{
				width: 700px;
				height: 300px;
				background-color: #f4f4f4;
				overflow: auto;
			}
		</style>
		<table border="1" width="700px">
			<tr>
				<td>
					<div id="chatMsg">채팅방에 입장하였습니다.</div>
				</td>
			</tr>
			<tr>
				<td>
				<form id="chat" name="chat" method="post" action="#" onsubmit="return SendMsg();">
				<input type="text" id="msg" name="msg" size="80%">
				<input type="button" id="btnSend" value="보내기">
				</form>
				</td>
			</tr>
		</table>		
	</body>
</html>