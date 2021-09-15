<!DOCTYPE html>
<html lang="en">
<body>

<%
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")

MdbFilePath = "D:\asp\asp2.mdb"
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& MdbFilePath

n1=request.form("name")
p1=request.form("phone")
e1=request.form("email")
g1=request.form("gender")
s1=request.form("skill")
b1=request.form("birthday")

response.write(Request.QueryString("name"))
response.write("yes")


conn.execute("INSERT INTO std (name, phone, email, gender, skill, birthday) VALUES ('"&n1&"', "& p1 &", '"&e1&"', '"&g1&"', '"&s1&"', '"&b1&"')")
response.redirect "list.asp"
conn.close
%>

</table>





</body>
</html>