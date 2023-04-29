<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin6.aspx.cs" Inherits="back_end_project.admin6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
        <title>Admin</title> 
    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <main>
        <div class="Products">
          <div class="card">
            <div class="card-header">
              <h3 class="heo">All Admins</h3>
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
                      <td>Admin</td>
                      <td>Username</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Eslam mohamed</td>
                      <td>Emaree</td>
                    </tr>
                    <tr>
                      <td>Eslam mohamed</td>
                      <td>Emaree</td>
                    </tr>
                    <tr>
                      <td>Eslam mohamed</td>
                      <td>Emaree</td>
                    </tr>
                    <tr>
                      <td>Eslam mohamed</td>
                      <td>Emaree</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
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
            <h5 class="modal-title" id="exampleModalLabel">Adding new admin</h5>
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
          <form class="modal-body">
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input
                type="email"
                class="form-control"
                id="exampleInputEmail1"
                aria-describedby="emailHelp"
                placeholder="Enter email"
              />
            </div>
            <div class="form-group">
              <label for="exampleInputName1">Name</label>
              <input
                type="text"
                class="form-control"
                id="exampleInputName1"
                placeholder="Enter Name"
              />
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input
                type="password"
                class="form-control"
                id="exampleInputPassword1"
                placeholder="Password"
              /><small id="passwordHelp" class="form-text text-muted"
                >We'll never share your password with anyone else.</small
              >
            </div>
          </form>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              Close
            </button>
            <button type="submit" class="btn btn-primary">confirm</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript_Plugins" runat="server">
        <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</asp:Content>
