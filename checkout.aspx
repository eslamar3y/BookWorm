<%@ Page Title="" Language="C#" MasterPageFile="~/M.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="back_end_project.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="hero_normal" runat="server">
    <section class="hero hero-normal">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hero_bg" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<input type="hidden" id="refreshed" value="no" />
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Checkout</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">Home</a>
                <span>Checkout</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h6>
              <span class="icon_tag_alt"></span> Have a coupon?
              <a href="shoping-cart.aspx#promocode">Click here</a> to enter your code
            </h6>
          </div>
        </div>
        <div class="checkout__form">
          <h4>Billing Details</h4>
            <%--THE FORM--%>
          <form action="invoice.aspx" method="post" runat="server">
            <div class="row">
              <div class="col-lg-8 col-md-6">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Fist Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_firstname" ForeColor="Red"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="txt_firstname" runat="server" CssClass="txt_check"></asp:TextBox>
                      
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt_lastname" ForeColor="Red"></asp:RequiredFieldValidator></p>
                          <asp:TextBox ID="txt_lastname" runat="server" CssClass="txt_check"></asp:TextBox>
                      
                    </div>
                  </div>
                </div>
                <div class="checkout__input">
                  <p>Country/State<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txt_country" ForeColor="Red"></asp:RequiredFieldValidator></p>
                      <asp:TextBox ID="txt_country" runat="server" class="txt_check"></asp:TextBox>
                  
                </div>
                <div class="checkout__input">
                  <p>Address<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txt__street_address" ForeColor="Red"></asp:RequiredFieldValidator></p>
                      <asp:TextBox ID="txt__street_address" runat="server" class=" txt_check txt_str_add"  placeholder="Street Address"></asp:TextBox>


                  
                  <%--  class="checkout__input__add"--%>
                    <asp:TextBox ID="txt_apartment_address" runat="server" class="txt_check"  placeholder="Apartment, suite, unite ect (optinal)"></asp:TextBox>
                  
                </div>
                <div class="checkout__input">
                  <p>Town/City<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txt_city" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="txt_city" runat="server" class="txt_check"></asp:TextBox>
                  
                </div>
                <div class="checkout__input">
                  <p>Postcode / ZIP<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txt_post" ForeColor="Red"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="txt_post" runat="server" class="txt_check"></asp:TextBox>
                  
                </div>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Phone<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txt_phone" ForeColor="Red"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="txt_phone" runat="server" class="txt_check" TextMode="Phone"></asp:TextBox>
                     
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txt_mail" ForeColor="Red"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="txt_mail" runat="server" class="txt_check" TextMode="Email"></asp:TextBox>
                     
                    </div>
                  </div>
                </div>
                <%--<div class="checkout__input__checkbox">
                  <label for="acc">
                    Create an account?
                    <input type="checkbox" id="acc" />
                    <span class="checkmark"></span>
                  </label>
                </div>
                <p>
                  Create an account by entering the information below. If you
                  are a returning customer please login at the top of the page
                </p>
                <div class="checkout__input">
                  <p>Account Password<span>*</span></p>
                    <asp:TextBox ID="txt_password" runat="server" class="txt_check"></asp:TextBox>
                  
                </div>
                <div class="checkout__input__checkbox">
                  <label for="diff-acc">
                    Ship to a different address?
                    <input type="checkbox" id="diff-acc" />
                    <span class="checkmark"></span>
                  </label>
                </div>--%>
                <%--<div class="checkout__input">
                  <p>Order notes<span>*</span></p>
                    <asp:TextBox ID="txt_notes" runat="server" class="txt_check" placeholder="Notes about your order, e.g. special notes for delivery."></asp:TextBox>
                </div>--%>
              </div>
              <div class="col-lg-4 col-md-6">
                <div class="checkout__order">
                  <h4>Your Order</h4>
                  <div class="checkout__order__products">
                    Products <span>Total</span>
                  </div>
                  <ul>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li><%# Eval("title") %> <span>$<%# Eval("discount") %> x (<%# Eval("quantity") %>)</span></li>
                        </ItemTemplate>
                    </asp:Repeater>
                  </ul>
                  <div class="checkout__order__subtotal">
                    Subtotal <asp:Label ID="thissubtotal" runat="server" Text="0"></asp:Label>
                  </div>
                  <div class="checkout__order__total">
                    Discount <asp:Label ID="thisdiscount" runat="server" Text="0"></asp:Label>
                  </div>
                  <div class="checkout__order__total">
                    GrandTotal <asp:Label ID="thisgrandtotal" runat="server" Text="0"></asp:Label>
                  </div>
                  <%--<div class="checkout__input__checkbox">
                    <label for="acc-or">
                      Create an account?
                      <input type="checkbox" id="acc-or" />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adip elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  </p>--%>
                  <%--<div class="checkout__input__checkbox">
                    <label for="payment">
                      Check Payment
                      <input type="checkbox" id="payment" />
                      <span class="checkmark"></span>
                    </label>
                  </div>
                  <div class="checkout__input__checkbox">
                    <label for="paypal">
                      Paypal
                      <input type="checkbox" id="paypal" />
                      <span class="checkmark"></span>
                    </label>
                  </div>--%>
                  <div class="checkout__input__checkbox">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" style="position: absolute;top: 375px;" runat="server" ErrorMessage="Please Select a Payment Method" ControlToValidate="RadioButtonList1" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    </asp:RadioButtonList>
                  </div>
                  <asp:Button ID="PlaceOrder" name="invoicepls" class="site-btn Check-btn" runat="server" Text="PLACE ORDER" />
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    <!-- Checkout Section End -->

</asp:Content>
