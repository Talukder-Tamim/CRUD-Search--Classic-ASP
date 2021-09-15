
<% 
do until rs.EOF
%>
<form method="post" action="update.asp">
<%
for each x in rs.Fields
    if lcase(x.name)="id" then
    id = x.value
    %>
    <td>
    <input type="submit" name="ID" value="<%=x.value%>">
    </td>
    <%else%>
    <td><%Response.Write(x.value)%></td>
<%end if
next
%>
<td>
    <a href="update.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit
    <a href="delete.asp?id=<%Response.Write(id)%>" class="btn btn-danger" >Delete
    

</td>
</form>
</tr>
<%
rs.MoveNext
loop
response.write("</table>")
conn.close
%>



