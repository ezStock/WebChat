<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ezen.*" %>
<%
String no = request.getParameter("cno");
if(no == null) no = "0";

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";
sql  = "select cno,cdate,cname,cnote ";
sql += "from chat ";
sql += "where cno > " + no + " ";
sql += "order by cno asc ";
dbms.OpenQuery(sql);
while(dbms.GetNext() == true)
{
	String cno = dbms.GetValue("cno");
	String cdate = dbms.GetValue("cdate");
	String cname = dbms.GetValue("cname");
	String cnote = dbms.GetValue("cnote");
	
	cnote = cnote.replace("<","&lt;");
	cnote = cnote.replace(">","&gt;");
	
	//out.print("[" + cdate + "] " + cnote + "<br>");
	out.print(cno);
	out.print("<!--EOF-->");
	out.print("[" + cdate + "][" + cname + "] " + cnote + "<br>");	
	out.print("<!--EOR-->");
}
dbms.CloseQuery();
dbms.DBClose();
%>