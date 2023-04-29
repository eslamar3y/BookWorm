<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin3.aspx.cs" Inherits="back_end_project.admin3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <title>Admin</title>
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
            <h3 class="heo">All Products</h3>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Add product
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                      Add product
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="title">Title</label>
                          <input type="text" class="form-control" id="title" aria-describedby="emailHelp"
                            placeholder="Enter title" required />
                        </div>
                        <div class="form-group col-md-6">
                          <label for="price">Price</label>
                          <input type="text" class="form-control" id="price" aria-describedby="emailHelp"
                            placeholder="Enter price" required />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Description">Description</label>
                        <textarea class="form-control" id="Description" rows="3" placeholder="Enter Description"
                          required></textarea>
                      </div>
                      <div class="form-group">
                        <label for="image">Image</label>
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="image" required />
                          <label class="custom-file-label" for="image">Choose image...</label>
                        </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-12">
                          <label for="author">Author</label>
                          <input type="text" class="form-control" id="author" placeholder="Enter author" required />
                        </div>
                        <div class="form-group col-md-4">
                          <label for="CatName">Category</label>
                          <select class="form-control" id="CatName" placeholder="CatName" required>
                            <option selected>Choose...</option>
                            <option>Literature</option>
                            <option>science</option>
                            <option>science</option>
                            <option>History</option>
                            <option>self-help</option>
                            <option>Languages</option>
                            <option>Fantasy</option>
                          </select>
                        </div>
                        <div class="form-group col-md-4">
                          <label for="Sale">Sale</label>
                          <input type="text" class="form-control" id="Sale" placeholder="Sale" />
                        </div>
                        <div class="form-group col-md-4">
                          <label for="count">Count</label>
                          <input type="text" class="form-control" id="count" placeholder="count" />
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                      Close
                    </button>
                    <button type="button" class="btn btn-primary">Add</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table width="100%">
                <thead>
                  <tr>
                    <td>Product ID</td>
                    <td>Product name</td>
                    <td>Category</td>
                    <td>Status</td>
                  </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                  <tr>
                    <td><%# Eval("ID") %></td>
                    <td><%# Eval("title") %></td>
                    <td><%# Eval("CatName") %></td>
                    <td><span class="status <%# Eval("CCode") %>"></span><%# Eval("status") %></td>
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
