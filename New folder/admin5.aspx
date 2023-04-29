<%@ Page Title="" Language="C#" MasterPageFile="~/adminM.Master" AutoEventWireup="true" CodeBehind="admin5.aspx.cs" Inherits="back_end_project.admin5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
        <title>PromoCodes</title>
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
              <h3 class="heo">All Promo-codes</h3>
              <!-- Button trigger modal -->
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
                        Promo code
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
                      <form>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Promo-code</label>
                          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter promo-code">
                         
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal"
                      >
                        Close
                      </button>
                      <button type="button" class="btn btn-primary">
                        Add
                      </button>
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
                      <td>Promo-code</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>08ZR98TQ</td>
                    </tr>
                    <tr>
                      <td>J59STL2G</td>
                    </tr>
                    <tr>
                      <td>H8T66DE1</td>
                    </tr>
                    <tr>
                      <td>GK58F3GA</td>
                    </tr>
                    <tr>
                      <td>HL9P13AC</t>
                    </tr>
                    <tr>
                      <td>MN55Q9Z33</td>
                    </tr>
                    <tr>
                      <td>LA11W3Q4</td>
                    </tr>
                    <tr>
                      <td>W188SS14</td>
                    </tr>
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
