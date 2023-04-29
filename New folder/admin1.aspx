<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin1.aspx.cs" Inherits="back_end_project.admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <title>Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <main>
        <div class="cards">
          <div class="card-single">
            <div>
              <h1>54</h1>
              <span>Customers</span>
            </div>
            <div>
              <span class="las la-users"></span>
            </div>
          </div>

          <div class="card-single">
            <div>
              <h1>48</h1>
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
                <button onclick="window.open('admin3.html','_self')">
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
                        <td>Department</td>
                        <td>Status</td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>UI/UX Design</td>
                        <td>UI Team</td>
                        <td><span class="status green"></span>in stock</td>
                      </tr>
                      <tr>
                        <td>Web devolopment</td>
                        <td>Front-End</td>
                        <td><span class="status yellow"></span>almost</td>
                      </tr>
                      <tr>
                        <td>Ushop app</td>
                        <td>Mobile Team</td>
                        <td><span class="status red"></span>out of stock</td>
                      </tr>
                      <tr>
                        <td>UI/UX Design</td>
                        <td>UI Team</td>
                        <td><span class="status green"></span>in stock</td>
                      </tr>
                      <tr>
                        <td>Web devolopment</td>
                        <td>Front-End</td>
                        <td><span class="status yellow"></span>almost</td>
                      </tr>
                      <tr>
                        <td>Ushop app</td>
                        <td>Mobile Team</td>
                        <td><span class="status red"></span>out of stock</td>
                      </tr>
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
                <button onclick="window.open('admin2.html','_self')">
                  See all <span class="las la-arrow-right"></span>
                </button>
              </div>
              <div class="card-body">
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
                <div class="customer">
                  <div class="info">
                    <img src="img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                      <h4>Eslam Mhmd</h4>
                      <small>CEO Expert</small>
                    </div>
                  </div>
                  <div class="contact">
                    <span class="las la-user-circle"></span>
                    <span class="las la-comment"></span>
                    <span class="las la-phone"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript_Plugins" runat="server">
</asp:Content>
