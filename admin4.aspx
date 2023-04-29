<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin4.aspx.cs" Inherits="back_end_project.admin4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <title>Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main_Content" runat="server">
    <main>
         <!-- Modal2 -->
              <div
                class="modal fade"
                id="promomodal2"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel2"
                aria-hidden="true"
              >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel2">
                        Edit Order Status
                      </h5>
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
                      <form action="#" method="post">
                        <div class="form-group">
                          <label for="exampleInput">Order ID</label>
                          <input type="text" name="id" style="margin-bottom: 10px;" class="form-control" id="exampleInput2" aria-describedby="Help" placeholder="Enter Order ID">
                          <label for="exampleInputSale">Status</label>
                          <select class="form-control" name="status" id="status" placeholder="CatName">
                                    <option value="Processing">Processing</option>
                                    <option value="Delivered">Delivered</option>
                                    <option value="Canceled">Canceled</option>
                                </select>
                        </div>
                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal"
                            >
                                Close
                            </button>
                            <button type="submit" name="editstatus" class="btn btn-primary">
                                Edit
                            </button>
                        </div>
                        </form>
                    </div>
                    
                  </div>
                </div>
              </div>
      <div class="Products">
        <div class="card">
          <div class="card-header">
            <h3 class="heo">All Orders</h3>
               <!-- Button trigger modal -->
                <button
                type="button"
                class="btn btn-primary"
                style="margin-right: 20px;"
                data-toggle="modal"
                data-target="#promomodal2"
              >
              Edit Order
              </button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table width="100%">
                <thead>
                  <tr>
                    <td>Order ID</td>
                    <td>Session ID</td>
                    <td>Invoice No.</td>
                    <td>Discount</td>
                    <td>Total</td>
                    <td>Payment Type</td>
                    <td>Order Date</td>
                    <td>Status</td>
                  </tr>
                </thead>
                <tbody>
                  
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                    <td><%# Eval("id") %></td>
                    <td><%# Eval("session_id") %></td>
                    <td><%# Eval("invoice_num") %></td>
                    <td><%# Eval("discount") %></td>
                    <td><%# Eval("total") %></td>
                    <td><%# Eval("payment_type") %></td>
                    <td><%# Eval("created_at") %></td>
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
</asp:Content>
