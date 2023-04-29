<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin3.aspx.cs" Inherits="back_end_project.admin3" %>
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
                document.getElementById("thismodal").click()
                if (document.getElementById("Main_Content_Edescription").text != "Label") {
                    let ED = document.getElementById("Main_Content_Edescription").innerText;
                    let EST = document.getElementById("Main_Content_Estock").innerText;
                    let EP = document.getElementById("Main_Content_Eprice").innerText;
                    let ESA = document.getElementById("Main_Content_Esale").innerText;
                    let ET = document.getElementById("Main_Content_Etitle").innerText;
                    let EA = document.getElementById("Main_Content_Eauthor").innerText;
                    let EC = document.getElementById("Main_Content_Ecat").innerText;
                    document.getElementById("Description2").innerText = ED;
                    document.getElementById("author2").value = EA;
                    document.getElementById("stock2").value = EST;
                    document.getElementById("Sale2").value = ESA;
                    document.getElementById("price2").value = EP;
                    document.getElementById("title2").value = ET;
                    var select = document.getElementById('CatName2');
                    var option;

                    for (var i = 0; i < select.options.length; i++) {
                        option = select.options[i];

                        if (option.value == EC) {
                            option.setAttribute('selected', true);
                        }
                    }
                }
            }
        }
        window.onload = loadpls;
    </script>
    <asp:Label ID="Edescription" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Estock" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Eprice" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Esale" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Etitle" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Eauthor" class="hidethis" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Ecat" class="hidethis" runat="server" Text="Label"></asp:Label>
      <div class="Products">
        <div class="card">
          <div class="card-header">
              <div style="width: 10%;">
                       <select class="form-control" id="justpost" onchange="postpls()">
                                <option value="choose">Sort By</option>
                                <option value="ALL">Default</option>
                                <option value="count">Count</option>
                                <option value="sale">Sale</option>
                                <option value="stock">Stock</option>
                       </select>
              </div>
         
            <h3 class="heo">All Products</h3>
            <!-- Button trigger modal -->
            <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Add product
            </button>
            <button type="button" id="thismodal" hidden  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">
              Edit product
            </button>
            
              <!-- Moda2 -->
            <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
              aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">
                      Edit product
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  </div>
                <div class="modal-body">
                    <form id="form2" action="#" method="post">
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="title2">Title</label>
                          <input type="text" name="title2" value="" class="form-control" id="title2" aria-describedby="emailHelp"
                            placeholder="Enter title" required />
                        </div>
                        <div class="form-group col-md-6">
                          <label for="price2">Price</label>
                          <input type="text" name="price2" class="form-control" id="price2" aria-describedby="emailHelp"
                            placeholder="Enter price" required />
                        </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="CatName2">Category</label>
                            <select class="form-control" name="selCat2" id="CatName2">
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <option value="<%# Eval("CatName") %>"><%# Eval("CatName") %></option>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Sale2">Sale</label>
                                <input type="text" name="sale2" class="form-control" id="Sale2" placeholder="Sale" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="stock2">Stock</label>
                                <input type="text" name="stock2" class="form-control" id="stock2" placeholder="stock" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="author2">Author</label>
                                <input type="text" name="author2" class="form-control" id="author2" placeholder="Enter author" required />
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="image2">Image</label>
                            <div class="custom-file">
                                <input type="file" name="image" class="custom-file-input" id="image2" />
                                <label class="custom-file-label" for="image">Choose image...</label>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="Description2">Description</label>
                            <textarea class="form-control" name="description2" id="Description2" rows="3" placeholder="Enter Description"
                                required></textarea>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" name="editpls" class="btn btn-primary">Edit</button>
                          </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
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
                    <form action="#" method="post">
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="title">Title</label>
                          <input type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp"
                            placeholder="Enter title" required />
                        </div>
                        <div class="form-group col-md-6">
                          <label for="price">Price</label>
                          <input type="text" name="price" class="form-control" id="price" aria-describedby="emailHelp"
                            placeholder="Enter price" required />
                        </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="CatName">Category</label>
                            <select class="form-control" name="selCat" id="CatName" placeholder="CatName">
                                <option value="ALL">Choose...</option>
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <option id="cat" value="<%# Eval("CatName") %>"><%# Eval("CatName") %></option>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Sale">Sale</label>
                                <input type="text" name="sale" class="form-control" id="Sale" placeholder="Sale" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="count">Stock</label>
                                <input type="text" name="stock" class="form-control" id="stock" placeholder="stock" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="author">Author</label>
                                <input type="text" name="author" class="form-control" id="author" placeholder="Enter author" required />
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="image">Image</label>
                            <div class="custom-file">
                                <input type="file" name="image" class="custom-file-input" id="image" />
                                <label class="custom-file-label" for="image">Choose image...</label>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="Description">Description</label>
                            <textarea class="form-control" name="description" id="Description" rows="3" placeholder="Enter Description"
                                required></textarea>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" name="submit" class="btn btn-primary">Add</button>
                          </div>
                    </form>
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
                    <td>ID</td>
                    <td>Product name</td>
                    <td>Category</td>
                    <td>Status</td>
                      <td>Count</td>
                      <td>Sale</td>
                      <td></td>
                      <td></td>
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
                    <td><%# Eval("count") %></td>
                    <td><%# Eval("Sale") %></td>
                    <td><a href="admin3.aspx?edit=<%# Eval("ID") %>" class="btn"><h4><i class="las la-edit"></i></h4></a></td>
                    <td><a href="admin3.aspx?remove=<%# Eval("ID") %>" class="btn" ><h4><i class="las la-trash-alt"></i></h4></a></td>
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
    <script>
        function postpls() {
            var select = document.getElementById('justpost');
            var post = select.value;
            var string = window.location.href
            if (!string.includes("?edit=")) {
                if (string.includes("?sort=")) {
                    let result = string.indexOf("?sort=");
                    let r2 = string.substring(0, result);
                    r2 += "?sort=";
                    r2 += post
                    window.location.href = r2;
                } else {
                    string += "?sort=";
                    string += post
                    window.location.href = string;
                }
            } else {
                let result = string.indexOf("?edit=");
                let r2 = string.substring(0, result);
                r2 += "?sort=";
                r2 += post
                window.location.href = r2;
            }
        }
    </script>
</asp:Content>
