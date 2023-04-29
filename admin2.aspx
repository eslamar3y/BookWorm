<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin2.aspx.cs" Inherits="back_end_project.admin2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <title>Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <main>
                    <script type="text/javascript">
                        function loadpls() {
                            activates();
                            var string = window.location.href
                            if (string.includes("?edit=")) {
                                let result = string.indexOf("?edit=");
                                let r2 = string.substring(result);
                                let r3 = r2.substring(6)
                                document.getElementById("P_Edit").click()
                                if (document.getElementById("Main_Content_Eemail").text != "Label") {
                                    let EE = document.getElementById("Main_Content_Eemail").innerText;
                                    let EP = document.getElementById("Main_Content_Epass").innerText;
                                    document.getElementById("C_email").value = EE;
                                    document.getElementById("C_pass").value = EP;
                                }
                            }
                        }
                        window.onload = loadpls;
                    </script>
    <asp:Label ID="Eemail" hidden="true" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Epass" hidden="true" runat="server" Text="Label"></asp:Label>

          <div class="customers">
            <div class="card">
              <div class="card-header">
                <h3 class="heo">All Customers</h3>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" id="P_Edit" hidden data-toggle="modal" data-target="#exampleModal">
                    Edit
                </button>
              </div>
          
                <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                      Edit Customer
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                <div class="modal-body">
                    <form action="#" method="post">
                      <div class="form-row">
                        <div class="form-group col-md-12">
                          <label for="C_id">Customer id: </label>
                          <%--<input type="text" name="id" class="form-control" id="C_id" aria-describedby="emailHelp"
                            placeholder="Enter Customer ID" required />--%>
                            <asp:Label ID="C_id" runat="server"></asp:Label>
                        </div>
                        <div class="form-group col-md-12">
                          <label for="C_email">Email</label>
                          <input type="text" name="email" class="form-control" id="C_email" aria-describedby="emailHelp"
                             required />
                        </div> 
                        <div class="form-group col-md-12">
                          <label for="C_pass">Password</label>
                          <input type="text" name="password" class="form-control" id="C_pass" aria-describedby="emailHelp"
                            required />
                        </div> 
                      </div>                      
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" name="btn_edit" class="btn btn-primary">Edit</button>
                          </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
             <div class="card-body">
                <div class="table-responsive">
                  <table width="100%">
                    <thead>
                      <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Email</td>
                        <td>Password</td>
                        <td>Phone</td>
                        <td>Address</td>
                        <td>Date</td>
                          <td></td>
                          <td></td>
                      </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Account_ID") %></td>
                                    <td><%# Eval("Username") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Password") %></td>
                                    <td><%# Eval("Phone") %></td>
                                    <td><%# Eval("Address") %></td>
                                    <td><%# Eval("date") %></td>
                                    <td><a href="admin2.aspx?edit=<%# Eval("Account_ID") %>" class="btn"><h4><i class="las la-edit"></i></h4></a></td>
                                    <td><a href="admin2.aspx?remove=<%# Eval("Account_ID") %>" class="btn" ><h4><i class="las la-trash-alt"></i></h4></a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
      </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript_Plugins" runat="server">
</asp:Content>

