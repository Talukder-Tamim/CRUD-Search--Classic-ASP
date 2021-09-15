<%
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")

MdbFilePath = "D:\asp\asp2.mdb"
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& MdbFilePath

id=request.QueryString("id")
response.write(id)

sql="UPDATE std SET "
sql=sql & "name='" & Request.Form("name") & "',"
sql=sql & "email='" & Request.Form("email") & "',"
sql=sql & "phone='" & Request.Form("phone") & "',"
sql=sql & "gender='" & Request.Form("gender") & "',"
sql=sql & "skill='" & Request.Form("skill") & "',"
sql=sql & "birthday='" & Request.Form("birthday") & "'"
sql=sql & " WHERE ID=" & id & ""

'response.write sql
'response.end()

on error resume next
conn.Execute sql
if err<>0 then
response.write("No update permissions!")
else
response.redirect "list.asp"
end if

conn.close
%>

</body>
</html>