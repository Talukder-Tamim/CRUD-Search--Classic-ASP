<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
body {
    background-color: skyblue
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #228B22;
  color: white;
}
p {
  display: inline-block;
}
#btn {
    color: #008CBA;
}
</style>
</head>
<body id="formSet">

<div>
    <form action="" id="form" method="post"> 
        <input type="search" id="query" name="q" placeholder="Search...">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <P>Gender:</p><span>
        <input type="radio" id="male" name="gender" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">Female</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>Skill: </p>
        <input type="checkbox" id="skill" name="skill" value="python">
        <label for="skill1"> Python</label>
        <input type="checkbox" id="skill2" name="skill" value="asp">
        <label for="skill2"> ASP</label>&nbsp;&nbsp;&nbsp;&nbsp;
        <label for="birthday1">From date:</label>
        <input type="date" id="birthday1" name="birthday1">
        <label for="birthday2">To date:</label>
        <input type="date" id="birthday2" name="birthday2">
        <button id="btn">Search</button></span>
    </form>
</div>
</br>

<%
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")

MdbFilePath = "D:\asp\asp2.mdb"
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& MdbFilePath

name = request.form("name")
email = request.form("email")
phone = request.form("phone")
gender = request.form("gender")
skill = request.form("skill")
from_date = request.form("birthday1")
to_date = request.form("birthday2")


If Request("gender") <> "" OR Request("skill") <> "" OR Request("birthday1") <> "" OR Request("q") <> "" Then
 Dim sql
  if request.form("gender")<>"" AND request.form("skill")<>"" AND Request("birthday1") <> "" then
      sql = "SELECT * FROM std WHERE gender = '" & _
          gender & "' AND skill = '" & _
          skill & "' AND birthday Between #" &_
          from_date & "# AND #" &_
          to_date & "#"
  elseif Request("birthday1") <> "" then
      sql = "SELECT * FROM std WHERE birthday Between #" &_
          from_date & "# AND #" &_
          to_date & "#"
  else
      sql = "SELECT * FROM std WHERE name = '" & _
          name & "' OR email = '" & _
          email & "' OR gender = '" & _
          gender & "' OR skill = '" & _
          skill & "'"
  end if
rs.open sql, conn
else
sql = "SELECT * FROM std"

rs.open sql, conn
End If

%>

<table id="customers">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Skill</th>
            <th>Date Of Birth</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
        do until rs.EOF

        response.write("<tr><td>" & rs.Fields("name") &"</td>")
        response.write("<td>" & rs.Fields("email") &"</td>")
        response.write("<td>" & rs.Fields("phone") &"</td>")
        response.write("<td>" & rs.Fields("gender") &"</td>")
        response.write("<td>" & rs.Fields("skill") &"</td>")
        response.write("<td>" & rs.Fields("birthday") &"</td>")
        for each x in rs.Fields
            if lcase(x.name)="id" then
            id = x.value
            %>
            <td>
            <a href="update.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit</a>
            <button id="delete" onClick=deleteRow(<%Response.Write(id)%>)> Delete</button> </td>
            
            <%
            else%>
        <%
        end if
        next
        rs.MoveNext
        loop
        response.write("</table>")
        conn.close
        %>
    </tbody>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
        $("#btn").click(function() {
            $.ajax({
                type: "POST",
                url: "list.asp",
                data:  $("#form").serialize(),
                cache: false,
                dataType: "html",
                success: function(response){
                    $("#formSet").html(response);
                },
                error: function(resposeText){
                    alert("err");
                },
            });
            return false;
          });
        });
        function deleteRow(id){
            $.ajax({
                url: "delete.asp?id=" + id,
                success: function(response){
                    $("#formSet").html(response.toString());

                }
            });
        }      
    </script>
</body>
</html>