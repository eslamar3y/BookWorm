<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin5.aspx.cs" Inherits="back_end_project.admin5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
        <title>PromoCodes</title>
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
              <h3 class="heo">All Promo-codes</h3>
              <!-- Button trigger modal -->
                <button
                type="button"
                class="btn btn-primary"
                style="margin-right: 20px;"
                data-toggle="modal"
                data-target="#promomodal2"
              >
              Edit promo
              </button>
              <button
                type="button"
                class="btn btn-primary"
                data-toggle="modal"
                data-target="#promomodal"
              >
              Add promo
              </button>

              <!-- Modal -->
              <div
                class="modal fade"
                id="promomodal"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">
                        Add promo code
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
                          <label for="exampleInput">Promo-code</label>
                          <input type="text" name="promo-code" style="margin-bottom: 10px;" class="form-control" id="exampleInput" aria-describedby="Help" placeholder="Enter promo-code">
                          <label for="exampleInputSale">Sale</label>
                          <input type="text" name="add-sale" class="form-control" id="exampleInputSale" aria-describedby="SaleHelp" placeholder="Enter Sale">
                         
                        </div>
                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal"
                            >
                                Close
                            </button>
                            <button type="submit" name="submit" class="btn btn-primary">
                                Add
                            </button>
                       </div>
                        </form>
                    </div>
                    
                  </div>
                </div>
              </div>
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
                        Edit promo code
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
                          <label for="exampleInput">promo-code ID</label>
                          <input type="text" name="id" style="margin-bottom: 10px;" class="form-control" id="exampleInput2" aria-describedby="Help" placeholder="Enter promo-code ID">
                          <label for="exampleInputSale">Sale</label>
                          <input type="text" name="sale" class="form-control" id="exampleInputSale2" aria-describedby="SaleHelp" placeholder="Enter Sale">
                         
                        </div>
                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal"
                            >
                                Close
                            </button>
                            <button type="submit" name="submit2" class="btn btn-primary">
                                Edit
                            </button>
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
                      <td>Promo code ID</td>
                      <td>Promo code</td>
                      <td>Sale</td>
                    </tr>
                  </thead>
                  <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PROMOCODE_ID") %></td>
                                <td><%# Eval("PROMOCODE") %></td>
                                <td><%# Eval("SALE") %></td>
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
