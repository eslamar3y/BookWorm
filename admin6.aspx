<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin6.aspx.cs" Inherits="back_end_project.admin6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
        <title>Admin</title> 
    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <main>
        <script type="text/javascript">
        function loadpls() {
            activates();
        }
        window.onload = loadpls;
        </script>
        <div class="Products">
          <div class="card">
            <div class="card-header">
              <h3 class="heo">All Admins</h3>
                <button 
                type="button"
                style="margin-right: 20px;"
                class="btn btn-primary"
                data-toggle="modal"
                data-target="#exampleModa2"
              >
                Remove Admin
              </button>
              <button 
                type="button"
                class="btn btn-primary"
                data-toggle="modal"
                data-target="#exampleModal"
              >
                Add Admin
              </button>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table width="100%">
                  <thead>
                    <tr>
                      <td>Username</td>
                      <td>Email</td>
                      <td>Password</td>
                      <td>Phone</td>
                      <td>Address</td>
                      <td>Date Of Creation</td>
                    </tr>
                  </thead>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Username") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Password") %></td>
                                    <td><%# Eval("Phone") %></td>
                                    <td><%# Eval("Address") %></td>
                                    <td><%# Eval("date") %></td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
              </div>
            </div>
          </div>
        </div>
      </main>
    
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add admin</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
           <div class="modal-body">
               <form class="modal-body" action="#" method="post">
              <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input
                      type="email"
                      name="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                      placeholder="Enter email"
                  />
              </div>
              <div class="modal-footer">
            <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
            >
                Close
            </button>
            <button type="submit" name="submit" class="btn btn-primary">confirm</button>
          </div>
          </form>
           </div> 
          
          
        </div>
      </div>
    </div>
    <!-- Moda2 -->
    <div
      class="modal fade"
      id="exampleModa2"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabe2">Remove admin</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <!-- <div class="modal-body">...</div> -->
          <form class="modal-body" action="#" method="post">
              <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input
                      type="email"
                      name="email"
                      class="form-control"
                      style="margin-bottom: 7px;"
                      id="exampleInputEmail2"
                      aria-describedby="emailHelp"
                      placeholder="Enter email"
                  />
              </div>
              <div class="modal-footer">
            <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
            >
                Close
            </button>
            <button type="submit" name="submit2" class="btn btn-primary">confirm</button>
          </div>
          </form>
          
        </div>
      </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript_Plugins" runat="server">
</asp:Content>
