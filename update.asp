<!DOCTYPE html>
<html lang="en">
<head>
    <title>Updation</title>

    <style>
        .myDiv {    
            text-align: center;}

        .form_wrapper {
            width: 460px;
            max-width: 100%;
            box-sizing: border-box;
            margin: 5% auto 0;
            position: relative;
            border: darkcyan;
            border-style: solid;
            background-color: rgb(188, 212, 221);
            width: 40%;
            padding: 15px;
            
        }

        .title_container {
            text-align: center;
            padding-bottom: 15px;
        }
            
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    
</head>
<body>

<%
set conn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")
set rs1=server.createobject("adodb.recordset")

MdbFilePath = "D:\asp\asp2.mdb"
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& MdbFilePath

id=request.QueryString("id")
sql = "SELECT * FROM std WHERE ID=" & id
sql1 = "SELECT skill FROM std WHERE ID=" & id

rs.open sql, conn
rs1.open sql1, conn

%>
    <div class="form_wrapper">
        <div class="myDiv">
            
            <div class="title_container">
                <h2>Update User</h2>
            </div><br>
            <div class="mb-3 row">
                <form method="post" action="update_user.asp?id=<%Response.Write(id)%>">
                    
                    <div class="form-label">  
                        <label class="col-md-4 control-label" ><strong>Name:</strong></label>  
                        <input name="name" value="<%=rs("name")%>"> <br>
                    </div>
                    <br>
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Email:</b></label> 
                        <input type="email" name="email" value="<%=rs("email")%>">      
                    </div>
                    <br>
                    <div class="form-label">
                        <label class="col-md-4 control-label" ><b>Phone:</b></label> 
                        <input type="tel" name="phone" value="<%=rs("phone")%>">  
                    </div>                
                    <br>               
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Date of Birth:</b></label>
                        <input type="text" name="birthday" value="<%=rs("birthday")%>"><br>
                    </div>
                    <br>
                    <div class="form-label">                
                        <label class="col-md-4 control-label" ><strong>Gender:</strong></label>
                    
                        <input type="radio" name="gender" <% if rs("gender")="male" then %> checked="checked"<%End if%> value="male"> Male
                        <input type="radio" name="gender" <% if rs("gender")="female" then %> checked="checked"<%End if%>value="female"> Female
                    </div>
                    <br>                  
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Select Skills:</b></label>
                        <input type="checkbox" name="skill"  <% if rs("skill")="python, asp" then %> checked="checked"<%End if%> value="python">Python
                        <input type="checkbox" name="skill"  <% if rs("skill")="python, asp" then %> checked="checked"<%End if%> value="asp">ASP
                        <br>  
                    </div>
                    <br>
                   <div>
                        <input type="submit" class="btn btn-success" value="Update">
                    </div>
                </form>
                
            </div>
        </div>  
    </div>
  </body>
</html>