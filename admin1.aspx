<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin1.aspx.cs" Inherits="back_end_project.admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <title>Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <script>
        function onloadthis() {
            activates();
            let lbls = document.getElementsByClassName('lblclr');
            for (const child of lbls) {
                child.style.color = '#212529';
            };
        }
        window.onload = onloadthis;
    </script>
    <main>
        <div class="cards">
          <div class="card-single">
            <div>
              <h1>
                  <asp:Label ID="Label2" CssClass="lblclr" runat="server" Text="Label"></asp:Label>
              </h1>
              <span>Customers</span>
            </div>
            <div>
              <span class="las la-users"></span>
            </div>
          </div>

          <div class="card-single">
            <div>
              <h1>
                  <asp:Label ID="Label1"  CssClass="lblclr" runat="server" Text="Label"></asp:Label>
              </h1>
              <span>Products</span>
            </div>
            <div>
              <span class="las la-clipboard-list"></span>
            </div>
          </div>

          <div class="card-single">
            <div>
              <h1>165</h1>
              <span>orders</span>
            </div>
            <div>
              <span class="las la-shopping-bag"></span>
            </div>
          </div>

          <div class="card-single">
            <div>
              <h1>$78K</h1>
              <span>Income</span>
            </div>
            <div>
              <span class="lab la-google-wallet"></span>
            </div>
          </div>
        </div>
        <div class="recent-grid">
          <div class="Products">
            <div class="card">
              <div class="card-header">
                <h3>Recent Products</h3>
                <button onclick="window.open('admin3.aspx','_self')">
                  See all</a>
                  <span class="las la-arrow-right"></span>
                </button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table width="100%">
                    <thead>
                      <tr>
                        <td>Product name</td>
                        <td>Category</td>
                        <td>Status</td>
                      </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("title") %></td>
                                    <td><%# Eval("CatName") %></td>
                                    <td><%# Eval("stock") %></td>
                                    <%--<td><span class="status green"></span>in stock</td>--%>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="customers">
            <div class="card">
              <div class="card-header">
                <h3>News Customers</h3>
                <button onclick="window.open('admin2.aspx','_self')">
                  See all <span class="las la-arrow-right"></span>
                </button>
              </div>
              <div class="card-body">
                  <div class="table-responsive">
                      <table>
                          <thead>
                              <tr>
                                  <td>Email</td>
                                  <td>Password</td>
                              </tr>
                          </thead>                      
                          <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%# Eval("Email") %></td>
                                        <td><%# Eval("Password") %></td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                          </asp:Repeater>
                      </table>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript_Plugins" runat="server">
</asp:Content>
