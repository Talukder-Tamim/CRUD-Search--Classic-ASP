<%
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")

MdbFilePath = "D:\asp\asp2.mdb"
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& MdbFilePath

id = Request.QueryString("id")

rs.open "DELETE FROM std WHERE ID= " & id & "",conn
response.redirect "list.asp"
%>